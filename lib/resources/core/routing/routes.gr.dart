// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i21;
import 'package:flutter/cupertino.dart' as _i24;
import 'package:flutter/material.dart' as _i22;
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i23;
import 'package:mahallaty/resources/core/routing/pages/app.dart' as _i2;
import 'package:mahallaty/resources/core/routing/pages/initial_route.dart'
    as _i5;
import 'package:mahallaty/resources/core/routing/pages/wrappers/details_wrapper.dart'
    as _i3;
import 'package:mahallaty/resources/core/routing/pages/wrappers/landing_wrapper.dart'
    as _i6;
import 'package:mahallaty/resources/core/routing/pages/wrappers/settings_wrapper.dart'
    as _i14;
import 'package:mahallaty/resources/core/routing/pages/wrappers/statistics_wrapper.dart'
    as _i16;
import 'package:mahallaty/resources/core/routing/pages/wrappers/complaints_wrapper.dart'
    as _i19;
import 'package:mahallaty/resources/core/widgets/image_viewer/widget/image_viewer.dart'
    as _i4;
import 'package:mahallaty/resources/features/auth/presentation/pages/landing.dart'
    as _i7;
import 'package:mahallaty/resources/features/auth/presentation/pages/login.dart'
    as _i8;
import 'package:mahallaty/resources/features/auth/presentation/pages/otp.dart'
    as _i10;
import 'package:mahallaty/resources/features/auth/presentation/pages/register.dart'
    as _i12;
import 'package:mahallaty/resources/features/map/presentation/pages/map.dart'
    as _i9;
import 'package:mahallaty/resources/features/map/presentation/pages/search.dart'
    as _i13;
import 'package:mahallaty/resources/features/statistics/presentation/pages/statistics.dart'
    as _i17;
import 'package:mahallaty/resources/features/complaints/domain/entities/complaint_entity.dart'
    as _i25;
import 'package:mahallaty/resources/features/complaints/presentation/pages/add_complaint.dart'
    as _i1;
import 'package:mahallaty/resources/features/complaints/presentation/pages/complaint_details.dart'
    as _i18;
import 'package:mahallaty/resources/features/complaints/presentation/pages/complaints.dart'
    as _i20;
import 'package:mahallaty/resources/features/user_information/presentation/pages/profile.dart'
    as _i11;
import 'package:mahallaty/resources/features/user_information/presentation/pages/settings.dart'
    as _i15;

/// generated route for
/// [_i1.AddComplaintPage]
class AddComplaintRoute extends _i21.PageRouteInfo<AddComplaintRouteArgs> {
  AddComplaintRoute({
    _i22.Key? key,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          AddComplaintRoute.name,
          args: AddComplaintRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddComplaintRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<AddComplaintRouteArgs>(orElse: () => const AddComplaintRouteArgs());
      return _i1.AddComplaintPage(key: args.key);
    },
  );
}

class AddComplaintRouteArgs {
  const AddComplaintRouteArgs({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return 'AddComplaintRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.AppPage]
class AppRoute extends _i21.PageRouteInfo<AppRouteArgs> {
  AppRoute({
    _i22.Key? key,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          AppRoute.name,
          args: AppRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AppRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<AppRouteArgs>(orElse: () => const AppRouteArgs());
      return _i2.AppPage(key: args.key);
    },
  );
}

class AppRouteArgs {
  const AppRouteArgs({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return 'AppRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.DetailsNavigatorPage]
class DetailsNavigatorRoute extends _i21.PageRouteInfo<void> {
  const DetailsNavigatorRoute({List<_i21.PageRouteInfo>? children})
      : super(
          DetailsNavigatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'DetailsNavigatorRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i3.DetailsNavigatorPage();
    },
  );
}

/// generated route for
/// [_i4.ImageViewerPage]
class ImageViewerRoute extends _i21.PageRouteInfo<ImageViewerRouteArgs> {
  ImageViewerRoute({
    _i22.Key? key,
    required List<String> imageUrls,
    int initialIndex = 0,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          ImageViewerRoute.name,
          args: ImageViewerRouteArgs(
            key: key,
            imageUrls: imageUrls,
            initialIndex: initialIndex,
          ),
          initialChildren: children,
        );

  static const String name = 'ImageViewerRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ImageViewerRouteArgs>();
      return _i4.ImageViewerPage(
        key: args.key,
        imageUrls: args.imageUrls,
        initialIndex: args.initialIndex,
      );
    },
  );
}

class ImageViewerRouteArgs {
  const ImageViewerRouteArgs({
    this.key,
    required this.imageUrls,
    this.initialIndex = 0,
  });

  final _i22.Key? key;

  final List<String> imageUrls;

  final int initialIndex;

  @override
  String toString() {
    return 'ImageViewerRouteArgs{key: $key, imageUrls: $imageUrls, initialIndex: $initialIndex}';
  }
}

/// generated route for
/// [_i5.InitialScreen]
class InitialRoute extends _i21.PageRouteInfo<void> {
  const InitialRoute({List<_i21.PageRouteInfo>? children})
      : super(
          InitialRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i5.InitialScreen();
    },
  );
}

/// generated route for
/// [_i6.LandingNavigatorPage]
class LandingNavigatorRoute extends _i21.PageRouteInfo<void> {
  const LandingNavigatorRoute({List<_i21.PageRouteInfo>? children})
      : super(
          LandingNavigatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingNavigatorRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i6.LandingNavigatorPage();
    },
  );
}

/// generated route for
/// [_i7.LandingPage]
class LandingRoute extends _i21.PageRouteInfo<void> {
  const LandingRoute({List<_i21.PageRouteInfo>? children})
      : super(
          LandingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i7.LandingPage();
    },
  );
}

/// generated route for
/// [_i8.LoginPage]
class LoginRoute extends _i21.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i22.Key? key,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<LoginRouteArgs>(orElse: () => const LoginRouteArgs());
      return _i8.LoginPage(key: args.key);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.MapPage]
class MapRoute extends _i21.PageRouteInfo<MapRouteArgs> {
  MapRoute({
    _i22.Key? key,
    required _i23.LatLng currentPosition,
    required bool isForShow,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          MapRoute.name,
          args: MapRouteArgs(
            key: key,
            currentPosition: currentPosition,
            isForShow: isForShow,
          ),
          initialChildren: children,
        );

  static const String name = 'MapRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MapRouteArgs>();
      return _i9.MapPage(
        key: args.key,
        currentPosition: args.currentPosition,
        isForShow: args.isForShow,
      );
    },
  );
}

class MapRouteArgs {
  const MapRouteArgs({
    this.key,
    required this.currentPosition,
    required this.isForShow,
  });

  final _i22.Key? key;

  final _i23.LatLng currentPosition;

  final bool isForShow;

  @override
  String toString() {
    return 'MapRouteArgs{key: $key, currentPosition: $currentPosition, isForShow: $isForShow}';
  }
}

/// generated route for
/// [_i10.OTPPage]
class OTPRoute extends _i21.PageRouteInfo<OTPRouteArgs> {
  OTPRoute({
    _i22.Key? key,
    required String phoneNumber,
    required bool registering,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          OTPRoute.name,
          args: OTPRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
            registering: registering,
          ),
          initialChildren: children,
        );

  static const String name = 'OTPRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OTPRouteArgs>();
      return _i10.OTPPage(
        key: args.key,
        phoneNumber: args.phoneNumber,
        registering: args.registering,
      );
    },
  );
}

class OTPRouteArgs {
  const OTPRouteArgs({
    this.key,
    required this.phoneNumber,
    required this.registering,
  });

  final _i22.Key? key;

  final String phoneNumber;

  final bool registering;

  @override
  String toString() {
    return 'OTPRouteArgs{key: $key, phoneNumber: $phoneNumber, registering: $registering}';
  }
}

/// generated route for
/// [_i11.ProfileInformationPage]
class ProfileInformationRoute
    extends _i21.PageRouteInfo<ProfileInformationRouteArgs> {
  ProfileInformationRoute({
    _i22.Key? key,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          ProfileInformationRoute.name,
          args: ProfileInformationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ProfileInformationRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileInformationRouteArgs>(
          orElse: () => const ProfileInformationRouteArgs());
      return _i11.ProfileInformationPage(key: args.key);
    },
  );
}

class ProfileInformationRouteArgs {
  const ProfileInformationRouteArgs({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return 'ProfileInformationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.RegisterPage]
class RegisterRoute extends _i21.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    _i24.Key? key,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return _i12.RegisterPage(key: args.key);
    },
  );
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final _i24.Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.SearchPage]
class SearchRoute extends _i21.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({
    _i22.Key? key,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          SearchRoute.name,
          args: SearchRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<SearchRouteArgs>(orElse: () => const SearchRouteArgs());
      return _i13.SearchPage(key: args.key);
    },
  );
}

class SearchRouteArgs {
  const SearchRouteArgs({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i14.SettingsNavigatorPage]
class SettingsNavigatorRoute extends _i21.PageRouteInfo<void> {
  const SettingsNavigatorRoute({List<_i21.PageRouteInfo>? children})
      : super(
          SettingsNavigatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsNavigatorRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i14.SettingsNavigatorPage();
    },
  );
}

/// generated route for
/// [_i15.SettingsPage]
class SettingsRoute extends _i21.PageRouteInfo<void> {
  const SettingsRoute({List<_i21.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i15.SettingsPage();
    },
  );
}

/// generated route for
/// [_i16.StatisticsNavigatorPage]
class StatisticsNavigatorRoute extends _i21.PageRouteInfo<void> {
  const StatisticsNavigatorRoute({List<_i21.PageRouteInfo>? children})
      : super(
          StatisticsNavigatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'StatisticsNavigatorRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i16.StatisticsNavigatorPage();
    },
  );
}

/// generated route for
/// [_i17.StatisticsPage]
class StatisticsRoute extends _i21.PageRouteInfo<StatisticsRouteArgs> {
  StatisticsRoute({
    _i22.Key? key,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          StatisticsRoute.name,
          args: StatisticsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'StatisticsRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StatisticsRouteArgs>(
          orElse: () => const StatisticsRouteArgs());
      return _i17.StatisticsPage(key: args.key);
    },
  );
}

class StatisticsRouteArgs {
  const StatisticsRouteArgs({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return 'StatisticsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i18.ComplaintDetailsPage]
class ComplaintDetailsRoute extends _i21.PageRouteInfo<ComplaintDetailsRouteArgs> {
  ComplaintDetailsRoute({
    _i22.Key? key,
    _i25.ComplaintEntity? complaint,
    String? id,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          ComplaintDetailsRoute.name,
          args: ComplaintDetailsRouteArgs(
            key: key,
            complaint: complaint,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'ComplaintDetailsRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ComplaintDetailsRouteArgs>(
          orElse: () => ComplaintDetailsRouteArgs(id: pathParams.optString('id')));
      return _i18.ComplaintDetailsPage(
        key: args.key,
        complaint: args.complaint,
        id: args.id,
      );
    },
  );
}

class ComplaintDetailsRouteArgs {
  const ComplaintDetailsRouteArgs({
    this.key,
    this.complaint,
    this.id,
  });

  final _i22.Key? key;

  final _i25.ComplaintEntity? complaint;

  final String? id;

  @override
  String toString() {
    return 'ComplaintDetailsRouteArgs{key: $key, complaint: $complaint, id: $id}';
  }
}

/// generated route for
/// [_i19.ComplaintsNavigatorPage]
class ComplaintsNavigatorRoute extends _i21.PageRouteInfo<void> {
  const ComplaintsNavigatorRoute({List<_i21.PageRouteInfo>? children})
      : super(
          ComplaintsNavigatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'ComplaintsNavigatorRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i19.ComplaintsNavigatorPage();
    },
  );
}

/// generated route for
/// [_i20.ComplaintsPage]
class ComplaintsRoute extends _i21.PageRouteInfo<ComplaintsRouteArgs> {
  ComplaintsRoute({
    _i22.Key? key,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          ComplaintsRoute.name,
          args: ComplaintsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ComplaintsRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<ComplaintsRouteArgs>(orElse: () => const ComplaintsRouteArgs());
      return _i20.ComplaintsPage(key: args.key);
    },
  );
}

class ComplaintsRouteArgs {
  const ComplaintsRouteArgs({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return 'ComplaintsRouteArgs{key: $key}';
  }
}