import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:research_hub/repository/home%20data/bloc/home_data_bloc.dart';
import 'package:research_hub/ui/components/cards/dash_board_card.dart';
import 'package:research_hub/ui/components/cards/domain_card.dart';
import 'package:research_hub/ui/components/names%20and%20texts/color_name.dart';

class HomeBodyMobile extends StatelessWidget {
  const HomeBodyMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 956.h,
      width: 440.w,
      child: BlocBuilder<HomeDataBloc, HomeDataState>(
        builder: (context, state) {
          if (state is HomeDataLoading) {
            return Center(
              child: CircularProgressIndicator(color: ColorName.primaryColor),
            );
          } else if (state is HomeDataLoaded) {
            final dashBoardList = state.dashBoardList;
            final domainList = state.domainList;
            return SingleChildScrollView(
              child: Center(
                child: SizedBox(
                  width: 404.w,
                  child: Column(
                    children: [
                      Gap(27.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Welcome back,\nJack! 👋",
                          style: GoogleFonts.inter(
                            fontSize: 36.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorName.primaryColor,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Discover amazing student projects",
                          style: GoogleFonts.inter(fontSize: 18.r),
                        ),
                      ),
                      Gap(25.h),
                      Column(
                        children: List.generate(dashBoardList.length, (index) {
                          final dashBoard = dashBoardList[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20.0).h,
                            child: DashBoardCard(
                              title: dashBoard.title,
                              subtitle: dashBoard.subtitle,
                              image: dashBoard.image,
                            ),
                          );
                        }),
                      ),
                      Gap(15.h),
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
                      Gap(20.h),
                      Column(
                        children: List.generate(domainList.length, (index) {
                          final domain = domainList[index];
                          return DomainCard(domain: domain);
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is HomeDataError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  state.message,
                  style: GoogleFonts.inter(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                IconButton(
                  iconSize: 35.w,
                  color: ColorName.primaryColor,
                  onPressed:
                      () => context.read<HomeDataBloc>().add(FetchHomeData()),
                  icon: Icon(Icons.refresh),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
