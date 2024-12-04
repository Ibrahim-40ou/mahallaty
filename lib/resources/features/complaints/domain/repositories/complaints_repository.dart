import '../../data/models/complaint_model.dart';

abstract class ComplaintsRepository {

  Future<void> addComplaint(ComplaintModel complaint);

  Future<void> deleteComplaint(int id);

  Future<void> paginatedFetch(int perPage);

  Future<void> fetchComplaintByID(String id);
}
