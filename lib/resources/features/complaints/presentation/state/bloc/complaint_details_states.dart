part of 'complaint_details_bloc.dart';

sealed class ComplaintDetailsStates {}

class ComplaintDetailsInitial extends ComplaintDetailsStates {}

class FetchComplaintByIDLoading extends ComplaintDetailsStates {}

class FetchComplaintByIDSuccess extends ComplaintDetailsStates {
  final ComplaintEntity complaint;

  FetchComplaintByIDSuccess({required this.complaint});
}

class FetchComplaintByIDFailure extends ComplaintDetailsStates {
  final String? failure;

  FetchComplaintByIDFailure({required this.failure});
}
