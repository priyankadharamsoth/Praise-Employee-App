import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/utils/assets_gen/assets.gen.dart';
import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/styles/colors/ui_colors_light.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../providers/core/router_provider.dart';

// final landingScreenIndexProvider = StateProvider.autoDispose<int>(
//   (ref) {
//     return 0;
//   },
//   name: "LandingScreenIndexProvider",
// );

@RoutePage()
class LandingScreen extends ConsumerWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final currentIndex = ref.watch(landingScreenIndexProvider);
    // final indexController = useTabController(initialLength: 2);
    //? Using annotated region here only for the reason as when scaffold not having app bar set, the status bar color will not change
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: context.theme.appBarTheme.systemOverlayStyle!,
      child: AutoTabsRouter.tabBar(
          routes: const [
            EmployeeRoute(),
            PraisesRoute(),
          ],
          builder: (context, child, pageController) {
            final tabsRouter = AutoTabsRouter.of(context);
            return Scaffold(
              // body: TabBarView(
              //   controller: indexController,
              //   children: const [HomeScreen(), ProfileScreen()],
              // ),
              body: child,
              bottomNavigationBar: NavigationBar(
                // labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                animationDuration: const Duration(seconds: 1),
                onDestinationSelected: tabsRouter.setActiveIndex,
                selectedIndex: tabsRouter.activeIndex,
                destinations: <Widget>[
                  NavigationDestination(
                    selectedIcon: Assets.images.users.image(
                        height: 18.sp, color: UIColorsLight().surfaceTint),
                    icon: Assets.images.users.image(
                        height: 18.sp,
                        color: UIColorsLight().customColors.blackColor),
                    label: "Employees",
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(
                      Icons.settings,
                      color: UIColorsLight().surfaceTint,
                    ),
                    icon: const Icon(Icons.settings),
                    label: "Praises",
                  ),
                ],
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionButton(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(UIDimensions.buttonR28)),
                onPressed: () {
                  ref.read(appRouterProvider).push(const EmployeeFormRoute());
                },
                backgroundColor: UIColorsLight().surfaceTint,
                heroTag: "landing",
                child: Assets.images.addUser.image(
                    height: 24.h,
                    color: UIColorsLight().customColors.whiteColor),
              ),
            );
          }),
    );
  }
}
