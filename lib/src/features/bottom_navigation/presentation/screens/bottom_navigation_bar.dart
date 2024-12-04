import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kz_h/src/core/routes/app_router.gr.dart';
import 'package:kz_h/src/core/themes/colors.dart';

@RoutePage()
class BottomNavigationBarPage extends StatelessWidget {
  const BottomNavigationBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [HomeFeed(), ProfileRoute()],
      bottomNavigationBuilder: (context, tabsRouter) {
        return PreferredSize(
          preferredSize: Size.fromHeight(100.h),
          child: BottomNavigationBar(
            backgroundColor: AppColors.bottomNavigationBarColor,
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            selectedItemColor: AppColors.bluePurpleColor,
            unselectedItemColor: AppColors.disabledBottomBarIconColor,
            items: [
              _buildBottomNavigationBarItem(
                path: "lib/assets/icons/bottom_nav_bar_home.svg",
                label: 'Home',
                isActive: tabsRouter.activeIndex == 0,
              ),
              _buildBottomNavigationBarItem(
                path: "lib/assets/icons/bottom_nav_bar_profile.svg",
                label: 'Profile',
                isActive: tabsRouter.activeIndex == 1,
              ),
            ],
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required String path,
    required String label,
    required bool isActive,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: SvgIconViewer(
          path: path,
          size: 24,
          isActive: isActive,
          color: AppColors.disabledBottomBarIconColor,
          activeColor: AppColors.bluePurpleColor,
        ),
      ),
      label: label,
    );
  }
}

class SvgIconViewer extends StatelessWidget {
  const SvgIconViewer({
    super.key,
    required this.path,
    required this.size,
    required this.isActive,
    this.activeColor,
    required this.color,
  });

  final String path;
  final double size;
  final bool isActive;
  final Color? activeColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(
        isActive ? (activeColor ?? Colors.blue) : color,
        BlendMode.srcIn,
      ),
    );
  }
}
