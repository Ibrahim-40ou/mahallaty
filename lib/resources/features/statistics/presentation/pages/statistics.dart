import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mahallaty/resources/core/sizing/size_config.dart';
import 'package:mahallaty/resources/core/widgets/complaint.dart';

import '../../../../core/utils/common_functions.dart';
import '../../../../core/widgets/text.dart';
import '../../../complaints/domain/entities/complaint_entity.dart';
import '../../../complaints/presentation/state/bloc/complaints_bloc.dart';
import '../../../complaints/presentation/state/cubit/image_counter_cubit.dart';
import '../../../complaints/presentation/widgets/shimmer_container.dart';
import '../state/statistics_bloc.dart';
import '../widgets/statistic.dart';

@RoutePage()
class StatisticsPage extends StatelessWidget {
  late bool _totalComplaints = true;
  late List<ComplaintEntity> complaints = [];

  StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = CommonFunctions().darkModeCheck(context);
    CommonFunctions().changeStatusBarColor(false, isDarkMode, context, null);
    return BlocProvider<StatisticsBloc>(
      create: (context) => StatisticsBloc(),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(2.w),
            child: BlocConsumer<StatisticsBloc, StatisticsStates>(
              listener:
                  (BuildContext context, StatisticsStates statisticsState) {},
              builder:
                  (BuildContext context, StatisticsStates statisticsState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitles(),
                    SizedBox(height: 1.h),
                    BlocBuilder<ComplaintsBloc, ComplaintsStates>(
                      builder: (
                        BuildContext context,
                        ComplaintsStates complaintsState,
                      ) {
                        if (complaintsState is FetchComplaintsSuccess) {
                          complaints = complaintsState.complaints;
                        }
                        List<ImageCounterCubit> pageCubits = List.generate(
                          complaints.length,
                          (index) => ImageCounterCubit(),
                        );
                        return Expanded(
                          child: ListView(
                            children: [
                              _buildStatistics(
                                context,
                                isDarkMode,
                                statisticsState,
                                complaints,
                              ),
                              SizedBox(height: 1.h),
                              if (complaintsState is FetchComplaintsLoading) ...[
                                _buildLoadingWidget(context)
                              ],
                              if (complaintsState
                                  is UploadedOfflineComplaintsLoading) ...[
                                _buildLoadingWidget(context)
                              ],
                              if (complaintsState is DeletedOfflineComplaintsLoading) ...[
                                _buildLoadingWidget(context)
                              ],
                              _buildComplaints(
                                context,
                                isDarkMode,
                                pageCubits,
                                statisticsState is TotalComplaints
                                    ? statisticsState.complaints
                                    : statisticsState is ApprovedComplaints
                                        ? statisticsState.complaints
                                        : statisticsState is PendingComplaints
                                            ? statisticsState.complaints
                                            : statisticsState is RejectedComplaints
                                                ? statisticsState.complaints
                                                : statisticsState
                                                        is ProcessingComplaints
                                                    ? statisticsState.complaints
                                                    : complaints,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomComplaintsShimmer(),
          SizedBox(height: 1.h),
          CustomComplaintsShimmer(),
          SizedBox(height: 1.h),
          CustomComplaintsShimmer(),
        ],
      ),
    );
  }

  Widget _buildTitles() {
    return CustomText(
      text: 'statistics'.tr(),
      size: 8.sp,
      weight: FontWeight.w500,
    );
  }

  Widget _buildStatistics(
    BuildContext context,
    bool isDarkMode,
    StatisticsStates state,
    List<ComplaintEntity> complaints,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomStatistic(
          width: 100.w,
          icon: Iconsax.book,
          title: 'total complaints'.tr(),
          number: '${complaints.length}',
          function: () {
            context.read<StatisticsBloc>().add(
                  TotalComplaintsEvent(complaints: complaints),
                );
            _totalComplaints = true;
          },
          selected: state is TotalComplaints || _totalComplaints,
        ),
        SizedBox(height: 1.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomStatistic(
              width: null,
              icon: Iconsax.tick_circle,
              title: 'done_2',
              number:
                  '${complaints.where((complaint) => complaint.statusId == 4).toList().length}',
              function: () {
                context.read<StatisticsBloc>().add(
                      ApprovedComplaintsEvent(complaints: complaints),
                    );
                _totalComplaints = false;
              },
              selected: state is ApprovedComplaints,
            ),
            SizedBox(width: 2.w),
            CustomStatistic(
              width: null,
              icon: Iconsax.info_circle,
              title: 'pending_2',
              number:
                  '${complaints.where((complaint) => complaint.statusId == 1).toList().length}',
              function: () {
                context.read<StatisticsBloc>().add(
                      PendingComplaintsEvent(complaints: complaints),
                    );
                _totalComplaints = false;
              },
              selected: state is PendingComplaints,
            ),
          ],
        ),
        SizedBox(height: 1.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomStatistic(
              width: null,
              icon: Iconsax.close_circle,
              title: 'canceled_2',
              number:
                  '${complaints.where((complaint) => complaint.statusId == 3).toList().length}',
              function: () {
                context.read<StatisticsBloc>().add(
                      RejectedComplaintsEvent(complaints: complaints),
                    );
                _totalComplaints = false;
              },
              selected: state is RejectedComplaints,
            ),
            SizedBox(width: 2.w),
            CustomStatistic(
              width: null,
              icon: Iconsax.activity,
              title: 'in progress_2',
              number:
                  '${complaints.where((complaint) => complaint.statusId == 2).toList().length}',
              function: () {
                context.read<StatisticsBloc>().add(
                      ProcessingComplaintsEvent(complaints: complaints),
                    );
                _totalComplaints = false;
              },
              selected: state is ProcessingComplaints,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildComplaints(
    BuildContext context,
    bool isDarkMode,
    List<ImageCounterCubit> pageCubits,
    List<ComplaintEntity> complaints,
  ) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: complaints.length,
      itemBuilder: (BuildContext context, int index) {
        complaints.sort(
          (a, b) {
            DateTime dateA = DateTime.parse(a.date);
            DateTime dateB = DateTime.parse(b.date);
            return dateB.compareTo(dateA);
          },
        );
        return CustomComplaintCard(
          complaint: complaints[index],
          isDarkMode: isDarkMode,
          index: index,
          pageCubit: pageCubits[index],
          isStatistic: false,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 1.h);
      },
    );
  }
}
