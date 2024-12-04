import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/api/https_consumer.dart';
import '../../../../../core/services/internet_services.dart';
import '../../../../../core/utils/result.dart';
import '../../../data/datasources/complaints_datasource.dart';
import '../../../data/repositories/complaints_repository_impl.dart';
import '../../../domain/entities/complaint_entity.dart';
import '../../../domain/use_cases/fetch_complaint_by_id_use_case.dart';

part 'complaint_details_events.dart';

part 'complaint_details_states.dart';

class ComplaintDetailsBloc extends Bloc<ComplaintDetailsEvent, ComplaintDetailsStates> {
  ComplaintDetailsBloc() : super(ComplaintDetailsInitial()) {
    on<FetchComplaintByID>(_fetchComplaintByID);
  }

  @override
  void onChange(Change<ComplaintDetailsStates> change) {
    super.onChange(change);
    if (kDebugMode) {
      print(change);
    }
  }

  Future<void> _fetchComplaintByID(
    FetchComplaintByID event,
    Emitter<ComplaintDetailsStates> emit,
  ) async {
    emit(FetchComplaintByIDLoading());
    if (await InternetServices().isInternetAvailable()) {
      final Result result = await FetchComplaintByIDUseCase(
        complaintsRepositoryImpl: ComplaintsRepositoryImpl(
          complaintsDatasource: ComplaintsDatasource(
            httpsConsumer: HttpsConsumer(),
          ),
        ),
      ).call(event.id);
      if (result.isSuccess) {
        return emit(FetchComplaintByIDSuccess(complaint: result.data));
      } else {
        return emit(FetchComplaintByIDFailure(failure: result.error));
      }
    } else {
      return emit(FetchComplaintByIDFailure(failure: 'no internet connection'.tr()));
    }
  }
}
