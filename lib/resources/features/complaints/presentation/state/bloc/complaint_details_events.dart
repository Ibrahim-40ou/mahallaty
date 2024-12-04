part of 'complaint_details_bloc.dart';

@immutable
sealed class ComplaintDetailsEvent {}

class FetchComplaintByID extends ComplaintDetailsEvent {
  final String id;

  FetchComplaintByID({required this.id});
}
