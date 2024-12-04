import '../../../../core/utils/result.dart';
import '../../data/repositories/complaints_repository_impl.dart';

class FetchComplaintByIDUseCase {
  final ComplaintsRepositoryImpl complaintsRepositoryImpl;

  FetchComplaintByIDUseCase({required this.complaintsRepositoryImpl});

  Future<Result<void>> call(String id) async {
    return await complaintsRepositoryImpl.fetchComplaintByID(id);
  }
}
