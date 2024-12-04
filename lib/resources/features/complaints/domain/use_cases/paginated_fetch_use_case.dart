import '../../../../core/utils/result.dart';
import '../../data/repositories/complaints_repository_impl.dart';

class PaginatedFetchUseCase {
  final ComplaintsRepositoryImpl complaintsRepositoryImpl;

  PaginatedFetchUseCase({required this.complaintsRepositoryImpl});

  Future<Result<void>> call(int perPage) async {
    return await complaintsRepositoryImpl.paginatedFetch(perPage);
  }
}
