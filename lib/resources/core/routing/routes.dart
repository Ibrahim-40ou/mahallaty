import 'package:auto_route/auto_route.dart';
import 'package:mahallaty/resources/core/routing/routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: InitialRoute.page, initial: true, path: '/initial'),
        AutoRoute(
          page: LandingNavigatorRoute.page,
          path: '/landing',
          children: [
            AutoRoute(
              page: LandingRoute.page,
              initial: true,
              path: 'landing',
            ),
            AutoRoute(page: LoginRoute.page, path: 'login'),
            AutoRoute(page: RegisterRoute.page, path: 'register'),
            AutoRoute(page: OTPRoute.page, path: 'otp'),
          ],
        ),
        AutoRoute(
          page: AppRoute.page,
          path: '/app',
          children: [
            AutoRoute(
              page: ComplaintsNavigatorRoute.page,
              path: 'complaintsNavigator',
              children: [
                AutoRoute(
                  page: ComplaintsRoute.page,
                  path: 'complaints',
                  initial: true,
                ),
                AutoRoute(page: AddComplaintRoute.page, path: 'addComplaint'),
                AutoRoute(page: ComplaintDetailsRoute.page, path: 'details/:id'),
                AutoRoute(page: ImageViewerRoute.page, path: 'viewer'),
                AutoRoute(page: MapRoute.page, path: 'map'),
                AutoRoute(page: SearchRoute.page, path: 'search'),
              ],
            ),
            AutoRoute(
              page: StatisticsNavigatorRoute.page,
              path: 'statisticsNavigator',
              children: [
                AutoRoute(
                  page: StatisticsRoute.page,
                  path: 'statistics',
                  initial: true,
                ),
                AutoRoute(page: ComplaintDetailsRoute.page, path: 'details'),
                AutoRoute(page: ImageViewerRoute.page, path: 'viewer'),
                AutoRoute(page: MapRoute.page, path: 'map'),
              ],
            ),
            AutoRoute(
              page: SettingsNavigatorRoute.page,
              path: 'settingsNavigator',
              children: [
                AutoRoute(
                  page: SettingsRoute.page,
                  path: 'settings',
                  initial: true,
                ),
                AutoRoute(page: ProfileInformationRoute.page, path: 'profile'),
              ],
            ),
          ],
        ),
        // AutoRoute(page: InitialRoute.page, initial: true),
        // AutoRoute(page: LandingRoute.page),
        // AutoRoute(page: LoginRoute.page),
        // AutoRoute(page: RegisterRoute.page),
        // AutoRoute(page: OTPRoute.page),
        // AutoRoute(page: AppRoute.page),
        // AutoRoute(page: SettingsRoute.page),
        // AutoRoute(page: StatisticsRoute.page),
        // AutoRoute(page: ProfileInformationRoute.page),
        // AutoRoute(page: ComplaintsRoute.page),
        // AutoRoute(page: AddComplaintRoute.page),
        // AutoRoute(page: ImageViewerRoute.page),
        // AutoRoute(page: ComplaintDetailsRoute.page),
        // AutoRoute(page: MapRoute.page),
        // AutoRoute(page: SearchRoute.page),
      ];
}
//
//
// import 'package:auto_route/auto_route.dart';
// import 'package:mahallaty/resources/core/routing/routes.gr.dart';
//
// @AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
// class AppRouter extends RootStackRouter {
//   @override
//   List<AutoRoute> get routes => [
//     AutoRoute(page: InitialRoute.page, initial: true, path: '/initial'),
//     AutoRoute(
//       page: LandingNavigatorRoute.page,
//       path: '/landing',
//       children: [
//         AutoRoute(
//           page: LandingRoute.page,
//           initial: true,
//           path: 'landing',
//         ),
//         AutoRoute(page: LoginRoute.page, path: 'login'),
//         AutoRoute(page: RegisterRoute.page, path: 'register'),
//         AutoRoute(page: OTPRoute.page, path: 'otp'),
//       ],
//     ),
//     AutoRoute(
//       page: AppRoute.page,
//       path: '/app',
//       children: [
//         AutoRoute(
//           page: ComplaintsNavigatorRoute.page,
//           path: 'complaintsNavigator',
//           children: [
//             AutoRoute(
//               page: DetailsNavigatorRoute.page,
//               path: 'detailsNavigator',
//               initial: true,
//               children: [
//                 AutoRoute(
//                   page: ComplaintsRoute.page,
//                   path: 'complaints',
//                   initial: true,
//                 ),
//                 AutoRoute(
//                   page: ComplaintDetailsRoute.page,
//                   path: 'details/:id',
//                   // initial: true,
//                 ),
//               ],
//             ),
//             // AutoRoute(
//             //   page: ComplaintsRoute.page,
//             //   path: 'complaints',
//             //   initial: true,
//             //   children: [
//             //
//             //   ],
//             // ),
//             AutoRoute(page: AddComplaintRoute.page, path: 'addComplaint'),
//             AutoRoute(page: ImageViewerRoute.page, path: 'viewer'),
//             AutoRoute(page: MapRoute.page, path: 'map'),
//             AutoRoute(page: SearchRoute.page, path: 'search'),
//           ],
//         ),
//         AutoRoute(
//           page: StatisticsNavigatorRoute.page,
//           path: 'statisticsNavigator',
//           children: [
//             AutoRoute(
//               page: StatisticsRoute.page,
//               path: 'statistics',
//               initial: true,
//             ),
//             AutoRoute(page: ComplaintDetailsRoute.page, path: 'details'),
//             AutoRoute(page: ImageViewerRoute.page, path: 'viewer'),
//             AutoRoute(page: MapRoute.page, path: 'map'),
//           ],
//         ),
//         AutoRoute(
//           page: SettingsNavigatorRoute.page,
//           path: 'settingsNavigator',
//           children: [
//             AutoRoute(
//               page: SettingsRoute.page,
//               path: 'settings',
//               initial: true,
//             ),
//             AutoRoute(page: ProfileInformationRoute.page, path: 'profile'),
//           ],
//         ),
//       ],
//     ),
//     // AutoRoute(page: InitialRoute.page, initial: true),
//     // AutoRoute(page: LandingRoute.page),
//     // AutoRoute(page: LoginRoute.page),
//     // AutoRoute(page: RegisterRoute.page),
//     // AutoRoute(page: OTPRoute.page),
//     // AutoRoute(page: AppRoute.page),
//     // AutoRoute(page: SettingsRoute.page),
//     // AutoRoute(page: StatisticsRoute.page),
//     // AutoRoute(page: ProfileInformationRoute.page),
//     // AutoRoute(page: ComplaintsRoute.page),
//     // AutoRoute(page: AddComplaintRoute.page),
//     // AutoRoute(page: ImageViewerRoute.page),
//     // AutoRoute(page: ComplaintDetailsRoute.page),
//     // AutoRoute(page: MapRoute.page),
//     // AutoRoute(page: SearchRoute.page),
//   ];
// }
