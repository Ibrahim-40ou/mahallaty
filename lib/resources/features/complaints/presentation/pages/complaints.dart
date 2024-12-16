import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mahallaty/main.dart';
import 'package:mahallaty/resources/core/routing/routes.gr.dart';
import 'package:mahallaty/resources/core/services/internet_services.dart';
import 'package:mahallaty/resources/core/sizing/size_config.dart';
import 'package:mahallaty/resources/core/widgets/complaint.dart';

import '../../../../core/utils/common_functions.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/text.dart';
import '../../domain/entities/complaint_entity.dart';
import '../state/bloc/complaints_bloc.dart';
import '../state/cubit/image_counter_cubit.dart';
import '../widgets/shimmer_container.dart';

@RoutePage()
class ComplaintsPage extends StatelessWidget {
  late List<ComplaintEntity> complaints = [];

  ComplaintsPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = CommonFunctions().darkModeCheck(context);
    CommonFunctions().changeStatusBarColor(false, isDarkMode, context, null);
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          color: Theme.of(context).colorScheme.primary,
          onRefresh: () async {
            context.read<ComplaintsBloc>().add(SerializationEvent());
          },
          child: BlocConsumer<ComplaintsBloc, ComplaintsStates>(
            listener: (BuildContext context, state) {
              if (state is DeleteComplaintFailure) {
                CommonFunctions().showDialogue(
                  context,
                  state.failure!,
                  '',
                  () {},
                  () {},
                );
              }
            },
            builder: (BuildContext context, state) {
              if (state is FetchComplaintsSuccess) {
                complaints = state.complaints;
              }
              if (state is UploadedOfflineComplaintsLoading) {
                return _buildLoadingWidget(context);
              } else if (state is DeletedOfflineComplaintsLoading) {
                return _buildLoadingWidget(context);
              } else if (state is FetchComplaintsLoading) {
                return _buildLoadingWidget(context);
              } else if (state is FetchComplaintsFailure) {
                return _buildErrorMessage(context, state);
              } else {
                complaints =
                    state is FetchComplaintsSuccess ? state.complaints : [];
                List<ImageCounterCubit> pageCubits =
                    state is FetchComplaintsSuccess
                        ? List.generate(
                            complaints.length,
                            (index) => ImageCounterCubit(),
                          )
                        : [];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitles(context),
                    if (complaints.isEmpty) ...[
                      _buildNoComplaints(context),
                    ],
                    _buildComplaints(
                      context,
                      complaints,
                      isDarkMode,
                      pageCubits,
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildNoComplaints(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: CustomText(
                text: 'there are no complaints. try refreshing the page'.tr()),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(2.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'complaints'.tr(),
              size: 8.sp,
              weight: FontWeight.w500,
            ),
            SizedBox(height: 2.h),
            CustomComplaintsShimmer(),
            SizedBox(height: 1.h),
            CustomComplaintsShimmer(),
            SizedBox(height: 1.h),
            CustomComplaintsShimmer(),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorMessage(
    BuildContext context,
    FetchComplaintsFailure state,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: 'failed to fetch complaints:'.tr(),
            overflow: TextOverflow.visible,
          ),
          CustomText(
            text: ' ${state.failure}',
            overflow: TextOverflow.visible,
          ),
        ],
      ),
    );
  }

  Widget _buildTitles(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: 'complaints'.tr(),
            size: 8.sp,
            weight: FontWeight.w500,
          ),
          CustomButton(
            function: () async {
              if (!(await InternetServices().isInternetAvailable())) {
                if (preferences!.getString('latToAdd') == null) {
                  CommonFunctions().showDialogue(
                    context,
                    'there is no internet connection and there is not any last known location for you. try connecting to the internet',
                    '',
                    () {},
                    () {},
                  );
                } else {
                  CommonFunctions().handlePermission(
                    key: 'location',
                    context: context,
                    onGranted: () async {
                      await context.router.push(AddComplaintRoute());
                    },
                  );
                }
                return;
              }
              CommonFunctions().handlePermission(
                key: 'location',
                context: context,
                onGranted: () async {
                  await context.router.push(AddComplaintRoute());
                },
              );
            },
            height: 8.w,
            width: 8.w,
            color: Theme.of(context).colorScheme.surface,
            child: Icon(
              Iconsax.add,
              color: Theme.of(context).textTheme.bodyMedium!.color!,
              size: 8.w,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComplaints(
    BuildContext context,
    List<ComplaintEntity> complaints,
    bool isDarkMode,
    List<ImageCounterCubit> pageCubits,
  ) {
    return Expanded(
      child: ListView.builder(
        itemCount: complaints.length,
        itemBuilder: (BuildContext context, int index) {
          complaints.sort(
            (a, b) {
              DateTime dateA = DateTime.parse(a.date);
              DateTime dateB = DateTime.parse(b.date);
              return dateB.compareTo(dateA);
            },
          );

          return Padding(
            padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 2.w),
            child: CustomComplaintCard(
              complaint: complaints[index],
              isDarkMode: isDarkMode,
              index: index,
              pageCubit: pageCubits[index],
              isStatistic: false,
            ),
          );
        },
      ),
    );
  }
}
