import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/api/https_consumer.dart';
import '../../../../../core/cache/database_helper.dart';
import '../../../../../core/services/image_services.dart';
import '../../../../../core/services/internet_services.dart';
import '../../../../../core/utils/result.dart';
import '../../../data/datasources/local_complaints_datasource.dart';
import '../../../data/datasources/complaints_datasource.dart';
import '../../../data/models/complaint_model.dart';
import '../../../data/repositories/complaints_repository_impl.dart';
import '../../../domain/entities/complaint_entity.dart';
import '../../../domain/use_cases/add_complaint_use_case.dart';
import '../../../domain/use_cases/delete_complaint_use_case.dart';
import '../../../domain/use_cases/paginated_fetch_use_case.dart';

part 'complaints_events.dart';

part 'complaints_states.dart';

class ComplaintsBloc extends Bloc<ComplaintsEvents, ComplaintsStates> {
  late List<ComplaintEntity> complaints = [];
  late int perPage = 3;

  ComplaintsBloc() : super(ComplaintsInitial()) {
    on<PaginatedFetchComplaints>(_paginatedFetch);
    on<AddComplaint>(_addComplaint);
    on<NoImages>(_noImages);
    on<DeleteComplaint>(_deleteComplaint);
    on<UploadOfflineComplaints>(_upload);
    on<DeleteOfflineComplaints>(_delete);
    on<SerializationEvent>(_serialize);
    on<ComplaintsLogout>(_logout);
  }

  Future<void> _logout(
    ComplaintsLogout event,
    Emitter<ComplaintsStates> emit,
  ) async {
    complaints.clear();
  }

  void incrementPerPage() {
    perPage += 3;
  }

  Future<void> _paginatedFetch(
    PaginatedFetchComplaints event,
    Emitter<ComplaintsStates> emit,
  ) async {
    emit(FetchComplaintsLoading());
    if (await InternetServices().isInternetAvailable()) {
      final Result result = await PaginatedFetchUseCase(
        complaintsRepositoryImpl: ComplaintsRepositoryImpl(
          complaintsDatasource: ComplaintsDatasource(
            httpsConsumer: HttpsConsumer(),
          ),
        ),
      ).call(perPage);
      incrementPerPage();
      if (result.isSuccess) {
        complaints = result.data;
        await LocalComplaintsDatasource(
          databaseHelper: DatabaseHelper(),
          imageService: ImageService(),
          httpsConsumer: HttpsConsumer(),
        ).storeComplaints(complaints);
        return emit(FetchComplaintsSuccess(complaints: complaints));
      } else {
        return emit(FetchComplaintsFailure(failure: result.error));
      }
    } else {
      complaints = await LocalComplaintsDatasource(
        databaseHelper: DatabaseHelper(),
        imageService: ImageService(),
        httpsConsumer: HttpsConsumer(),
      ).fetchComplaints();
      return emit(FetchComplaintsSuccess(complaints: complaints));
    }
  }

  Future<void> _serialize(
    SerializationEvent event,
    Emitter<ComplaintsStates> emit,
  ) async {
    await _upload(UploadOfflineComplaints(), emit);
    await _delete(DeleteOfflineComplaints(), emit);
    await _paginatedFetch(
      PaginatedFetchComplaints(),
      emit,
    );
  }

  Future<void> _upload(
    UploadOfflineComplaints event,
    Emitter<ComplaintsStates> emit,
  ) async {
    emit(UploadedOfflineComplaintsLoading());
    try {
      if (await InternetServices().isInternetAvailable()) {
        final List<ComplaintModel> complaintsToUpload =
            await DatabaseHelper().getWaitingComplaints();
        bool success = true;
        for (ComplaintModel complaint in complaintsToUpload) {
          final Result<void> result = await AddComplaintUseCase(
            complaintsRepositoryImpl: ComplaintsRepositoryImpl(
              complaintsDatasource: ComplaintsDatasource(
                httpsConsumer: HttpsConsumer(),
              ),
            ),
          ).call(complaint);
          if (!result.isSuccess) {
            success = false;
          }
        }
        if (success) {
          await LocalComplaintsDatasource(
            databaseHelper: DatabaseHelper(),
            imageService: ImageService(),
            httpsConsumer: HttpsConsumer(),
          ).deleteAllWaitingComplaints();
        }
      }
      return emit(UploadedOfflineComplaintsSuccess());
    } on Exception catch (e) {
      return emit(UploadedOfflineComplaintsFailure(failure: '$e'));
    }
  }

  Future<void> _delete(
    DeleteOfflineComplaints event,
    Emitter<ComplaintsStates> emit,
  ) async {
    emit(DeletedOfflineComplaintsLoading());
    try {
      if (await InternetServices().isInternetAvailable()) {
        final List<ComplaintModel> complaintsToDelete =
            await DatabaseHelper().getDeletedComplaints();
        bool success = true;
        for (ComplaintModel complaint in complaintsToDelete) {
          final Result<void> result = await DeleteComplaintsUseCase(
            complaintsRepositoryImpl: ComplaintsRepositoryImpl(
              complaintsDatasource: ComplaintsDatasource(
                httpsConsumer: HttpsConsumer(),
              ),
            ),
          ).call(complaint.id);
          if (!result.isSuccess) {
            success = false;
          }
        }
        if (success) {
          await LocalComplaintsDatasource(
            databaseHelper: DatabaseHelper(),
            imageService: ImageService(),
            httpsConsumer: HttpsConsumer(),
          ).deleteAllDeletedComplaints();
        }
      }
      return emit(DeletedOfflineComplaintsSuccess());
    } on Exception catch (e) {
      return emit(DeletedOfflineComplaintsFailure(failure: '$e'));
    }
  }

  @override
  void onChange(Change<ComplaintsStates> change) {
    super.onChange(change);
    if (kDebugMode) {
      print(change);
    }
  }

  void _deleteComplaint(
    DeleteComplaint event,
    Emitter<ComplaintsStates> emit,
  ) async {
    if (await InternetServices().isInternetAvailable()) {
      final result = await DeleteComplaintsUseCase(
        complaintsRepositoryImpl: ComplaintsRepositoryImpl(
          complaintsDatasource: ComplaintsDatasource(
            httpsConsumer: HttpsConsumer(),
          ),
        ),
      ).call(event.id);
      if (result.isSuccess) {
        complaints.removeAt(event.index);
        await LocalComplaintsDatasource(
          databaseHelper: DatabaseHelper(),
          imageService: ImageService(),
          httpsConsumer: HttpsConsumer(),
        ).deleteComplaint(event.id);
        return emit(FetchComplaintsSuccess(complaints: complaints));
      } else {
        return emit(DeleteComplaintFailure(failure: result.error));
      }
    } else {
      await LocalComplaintsDatasource(
        databaseHelper: DatabaseHelper(),
        imageService: ImageService(),
        httpsConsumer: HttpsConsumer(),
      ).deleteComplaint(event.id);
      complaints.removeAt(event.index);
      return emit(FetchComplaintsSuccess(complaints: complaints));
    }
  }

  void _noImages(
    NoImages event,
    Emitter<ComplaintsStates> emit,
  ) {
    return emit(NoImagesState());
  }

  Future<void> _addComplaint(
    AddComplaint event,
    Emitter<ComplaintsStates> emit,
  ) async {
    emit(AddComplaintLoading());
    if (await InternetServices().isInternetAvailable()) {
      final Result result = await AddComplaintUseCase(
        complaintsRepositoryImpl: ComplaintsRepositoryImpl(
          complaintsDatasource: ComplaintsDatasource(
            httpsConsumer: HttpsConsumer(),
          ),
        ),
      ).call(event.complaint);
      if (result.isSuccess) {
        await LocalComplaintsDatasource(
          databaseHelper: DatabaseHelper(),
          imageService: ImageService(),
          httpsConsumer: HttpsConsumer(),
        ).addComplaint(event.complaint);
        complaints.add(event.complaint);
        emit(AddComplaintSuccess());
        return emit(FetchComplaintsSuccess(complaints: complaints));
      } else {
        return emit(AddComplaintFailure(failure: result.error));
      }
    } else {
      await LocalComplaintsDatasource(
        databaseHelper: DatabaseHelper(),
        imageService: ImageService(),
        httpsConsumer: HttpsConsumer(),
      ).addComplaint(event.complaint);
      complaints.add(event.complaint);
      emit(AddComplaintSuccess());
      emit(FetchComplaintsSuccess(complaints: complaints));
    }
  }
}
