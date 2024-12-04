import 'dart:async';
import 'dart:io';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mahallaty/resources/core/routing/routes.gr.dart';
import 'package:mahallaty/resources/core/sizing/size_config.dart';
import 'package:mahallaty/resources/core/utils/common_functions.dart';
import 'package:mahallaty/resources/core/widgets/back_button.dart';
import 'package:mahallaty/resources/core/widgets/button.dart';
import 'package:mahallaty/resources/core/widgets/text.dart';
import 'package:mahallaty/resources/features/complaints/presentation/state/bloc/complaint_details_bloc.dart';
import 'package:mahallaty/resources/features/complaints/presentation/widgets/shimmer_container.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../main.dart';
import '../../../../core/services/internet_services.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../domain/entities/complaint_entity.dart';
import '../state/cubit/counter_opacity_cubit.dart';
import '../state/cubit/image_counter_cubit.dart';

@RoutePage()
class ComplaintDetailsPage extends StatelessWidget {
  final String? id;
  ComplaintEntity? complaint;

  ComplaintDetailsPage({
    super.key,
    this.complaint,
    @PathParam('id') this.id,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = CommonFunctions().darkModeCheck(context);
    return BlocProvider<ComplaintDetailsBloc>(
      create: (_) {
        final bloc = ComplaintDetailsBloc();
        if (id != null) {
          bloc.add(FetchComplaintByID(id: id!));
        }
        return bloc;
      },
      child: WillPopScope(
        onWillPop: () async {
          if (preferences!.getString('deepLink') != null) {
            preferences!.remove('deepLink');
            context.router.replaceAll([InitialRoute()]);
          }
          return Future.value(true);
        },
        child: BlocBuilder<ComplaintDetailsBloc, ComplaintDetailsStates>(
          builder: (context, state) {
            if (state is FetchComplaintByIDLoading) {
              return _buildLoadingWidget(context);
            } else if (state is FetchComplaintByIDFailure) {
              return _buildFailureMessage(context, state.failure!);
            } else if (state is FetchComplaintByIDSuccess) {
              complaint = state.complaint;
              return _buildComplaintDetailsView(context, isDarkMode);
            }
            return _buildComplaintDetailsView(
              context,
              isDarkMode,
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoadingWidget(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(2.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomBackButton(
                function: () {
                  if (preferences!.getString('deepLink') != null) {
                    preferences!.remove('deepLink');

                    context.router.replaceAll([InitialRoute()]);
                    return;
                  }
                  context.router.maybePop();
                },
              ),
              SizedBox(height: 2.h),
              CustomText(
                text: 'complaint details'.tr(),
                size: 8.sp,
                weight: FontWeight.w500,
              ),
              SizedBox(height: 2.h),
              CustomComplaintsShimmer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFailureMessage(BuildContext context, String error) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(2.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomBackButton(
                function: () {
                  if (preferences!.getString('deepLink') != null) {
                    preferences!.remove('deepLink');

                    context.router.replaceAll([InitialRoute()]);
                    return;
                  }
                  context.router.maybePop();
                },
              ),
              SizedBox(height: 2.h),
              CustomText(
                text: 'complaint details'.tr(),
                size: 8.sp,
                weight: FontWeight.w500,
              ),
              SizedBox(height: 20.h),
              Center(
                child: Column(
                  children: [
                    CustomText(
                      text: 'failed fetching complaint'.tr(),
                    ),
                    CustomText(text: error),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildComplaintDetailsView(BuildContext context, bool isDarkMode) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(2.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomBackButton(
                  function: () {
                    if (preferences!.getString('deepLink') != null) {
                      preferences!.remove('deepLink');

                      context.router.replaceAll([InitialRoute()]);
                      return;
                    }
                    context.router.maybePop();
                  },
                ),
                SizedBox(height: 2.h),
                CustomText(
                  text: 'complaint details'.tr(),
                  size: 8.sp,
                  weight: FontWeight.w500,
                ),
                SizedBox(height: 2.h),
                complaint != null ? _buildComplaint(context, isDarkMode) : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildComplaint(BuildContext context, bool isDarkMode) {
    final pageController = PageController();
    final counterOpacityCubit = CounterOpacityCubit();
    Timer? timer;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(2.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isDarkMode
                ? Theme.of(context).colorScheme.secondary.withOpacity(0.2)
                : Theme.of(context).colorScheme.secondary.withOpacity(0.4),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: '${CommonFunctions().getStatus(complaint!.statusId)}_1'.tr(),
                color: Theme.of(context).colorScheme.primary,
                weight: FontWeight.w600,
                size: 6.sp,
              ),
              SizedBox(height: 1.h),
              CustomText(text: complaint!.description),
              SizedBox(height: 1.h),
              Container(
                height: 25.h,
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: pageController,
                      itemCount: complaint!.media.length,
                      onPageChanged: (pageIndex) {
                        context
                            .read<ImageCounterCubit>()
                            .changeImage(pageIndex);
                        counterOpacityCubit.showCounter();

                        timer?.cancel();
                        timer = Timer(Duration(seconds: 2), () {
                          counterOpacityCubit.hideCounter();
                        });
                      },
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.router.push(
                              ImageViewerRoute(
                                imageUrls: complaint!.media,
                                initialIndex: index,
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 0.5,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: complaint!.media[index].contains('http')
                                  ? CachedNetworkImage(
                                      imageUrl: complaint!.media[index],
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Center(
                                        child: CustomLoadingIndicator(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Center(
                                        child: Icon(
                                          Icons.error,
                                        ),
                                      ),
                                    )
                                  : Image.file(
                                      File(complaint!.media[index]),
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Center(
                                          child: Icon(Icons.error),
                                        );
                                      },
                                    ),
                            ),
                          ),
                        );
                      },
                    ),
                    BlocBuilder<ImageCounterCubit, int>(
                      builder: (context, pageIndex) {
                        return BlocBuilder<CounterOpacityCubit, double>(
                          bloc: counterOpacityCubit,
                          builder: (context, opacity) {
                            return Positioned(
                              bottom: 1.h,
                              right: 2.w,
                              child: AnimatedOpacity(
                                opacity: opacity,
                                duration: const Duration(milliseconds: 300),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 1.w,
                                    horizontal: 2.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: CustomText(
                                    text:
                                        '${pageIndex + 1}/${complaint!.media.length}',
                                    color: Colors.white,
                                    size: 4.sp,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 1.5.h),
        CustomButton(
          function: () async {
            if (await InternetServices().isInternetAvailable()) {
              CommonFunctions().handlePermission(
                key: 'location',
                context: context,
                onGranted: () {
                  context.router.push(
                    MapRoute(
                      currentPosition: LatLng(
                        double.parse(complaint!.lat),
                        double.parse(complaint!.lng),
                      ),
                      isForShow: true,
                    ),
                  );
                },
                isForShow: true,
              );
            } else {
              CommonFunctions().showDialogue(
                context,
                'please connect to the internet to open the map',
                '',
                () {},
                () {},
              );
            }
          },
          color: Theme.of(context).colorScheme.surface,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Iconsax.location,
                size: 6.w,
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: CustomText(
                  text: complaint!.address,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 0.5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Iconsax.clock,
              size: 6.w,
              color: Theme.of(context).textTheme.bodyMedium!.color,
            ),
            SizedBox(width: 2.w),
            CustomText(
              text: _formatDate(complaint!.date),
            ),
          ],
        ),
        SizedBox(height: 1.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonFunctions().getUploadStatusIcon(complaint!.uploadStatus, context),
            SizedBox(width: 2.w),
            CustomText(
              text: complaint!.uploadStatus == 'waiting'
                  ? 'this complaint has not been uploaded online yet'.tr()
                  : 'this complaint has been uploaded online'.tr(),
            ),
          ],
        ),
      ],
    );
  }

  String _formatDate(String isoDate) {
    DateTime dateTime = DateTime.parse(isoDate).toLocal();
    return DateFormat('yyyy-MM-dd, EEEE, hh:mm a').format(dateTime);
  }

  String capitalizeFirstLetter(String word) {
    if (word.isEmpty) return word;
    return word[0].toUpperCase() + word.substring(1);
  }
}
