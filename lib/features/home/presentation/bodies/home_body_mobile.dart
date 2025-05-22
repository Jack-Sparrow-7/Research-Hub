import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:research_hub/core/constants/color_pallete.dart';
import 'package:research_hub/features/home/presentation/bloc/home_data_bloc.dart';
import 'package:research_hub/features/home/presentation/widgets/dash_board_card.dart';
import 'package:research_hub/features/home/presentation/widgets/domain_card.dart';

class HomeBodyMobile extends StatelessWidget {
  const HomeBodyMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeDataBloc, HomeDataState>(
      builder: (context, state) {
        if (state is HomeDataLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is HomeDataLoaded) {
          final domainList = state.domainList;
          final dashBoardList = state.dashBoardList;
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.w),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Welcome back,\nJack! 👋",
                    style: GoogleFonts.inter(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorPallete.primaryColor,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Discover amazing student projects",
                    style: GoogleFonts.inter(fontSize: 18.sp),
                  ),
                ),
                Gap(25.w),
                Column(
                  children: List.generate(dashBoardList.length, (index) {
                    final dashBoard = dashBoardList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0).w,
                      child: DashBoardCard(
                        title: dashBoard.title,
                        subtitle: dashBoard.subtitle,
                        image: dashBoard.image,
                      ),
                    );
                  }),
                ),
                Gap(15.w),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Popular Domains",
                    style: GoogleFonts.inter(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Gap(20.w),
                Column(
                  children: List.generate(domainList.length, (index) {
                    final domain = domainList[index];
                    return DomainCard(domain: domain);
                  }),
                ),
              ],
            ),
          );
        } else if (state is HomeDataError) {
          return Center(child: Text(state.message));
        }
        return Container();
      },
    );
  }
}
