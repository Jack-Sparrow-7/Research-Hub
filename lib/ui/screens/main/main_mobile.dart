import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:research_hub/repository/authentication/bloc/auth_bloc.dart';
import 'package:research_hub/repository/cubit/page_index_cubit.dart';
import 'package:research_hub/repository/home%20data/bloc/home_data_bloc.dart';
import 'package:research_hub/ui/components/names%20and%20texts/color_name.dart';
import 'package:research_hub/ui/screens/main/bodies/mobile/explore_body_mobile.dart';
import 'package:research_hub/ui/screens/main/bodies/mobile/favorites_body_mobile.dart';
import 'package:research_hub/ui/screens/main/bodies/mobile/home_body_mobile.dart';
import 'package:research_hub/ui/screens/main/bodies/mobile/profile_body_mobile.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    kIsWasm ? debugPrint("Wasm") : debugPrint("web");
    final List<Widget> bodies = [
      HomeBodyMobile(),
      ExploreBodyMobile(),
      FavoritesBodyMobile(),
      ProfileBodyMobile(),
    ];
    return Scaffold(
      backgroundColor: ColorName.scaffoldColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Text("Research Hub"),
        titleTextStyle: GoogleFonts.pacifico(
          fontWeight: FontWeight.w500,
          fontSize: 27.w,
          color: ColorName.primaryColor,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Iconsax.notification_copy)),
          Gap(10.r),
          // Inside your `actions` in AppBar:
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, authState) {
              return CircleAvatar(
                radius: 18.w,
                foregroundImage:
                    authState is Authenticated && authState.imageUrl != null
                        ? CachedNetworkImageProvider(authState.imageUrl!)
                        : AssetImage('assets/images/profile.png'),
              );
            },
          ),
        ],
        actionsPadding: EdgeInsets.symmetric(horizontal: 20.r),
      ),
      drawer: BlocBuilder<PageIndexCubit, int>(
        builder: (context, state) {
          return Drawer(
            backgroundColor: Colors.white,
            width: 200.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10.h,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: BlocBuilder<HomeDataBloc, HomeDataState>(
                    builder: (context, state) {
                      final isLoaded = state is HomeDataLoaded;
                      return CircleAvatar(
                        foregroundImage:
                            isLoaded
                                ? CachedNetworkImageProvider(
                                  state.assets.favicon,
                                )
                                : null,
                        backgroundColor: ColorName.primaryColor,
                        radius: 70.w,
                      );
                    },
                  ),
                ),
                ListTile(
                  onTap: () => context.read<PageIndexCubit>().onPressed(0),
                  selected: state == 0 ? true : false,
                  selectedColor: ColorName.primaryColor,
                  title: Text("Home"),
                  leading: Icon(Iconsax.home_2),
                ),
                ListTile(
                  onTap: () => context.read<PageIndexCubit>().onPressed(1),

                  selected: state == 1 ? true : false,
                  selectedColor: ColorName.primaryColor,
                  title: Text("Explore"),
                  leading: Icon(Iconsax.category_2),
                ),
                ListTile(
                  onTap: () => context.read<PageIndexCubit>().onPressed(2),

                  selected: state == 2 ? true : false,
                  selectedColor: ColorName.primaryColor,
                  title: Text("Favorites"),
                  leading: Icon(Iconsax.heart),
                ),
                ListTile(
                  onTap: () => context.read<PageIndexCubit>().onPressed(3),

                  selected: state == 3 ? true : false,
                  selectedColor: ColorName.primaryColor,
                  title: Text("Profile"),
                  leading: Icon(Iconsax.user),
                ),
              ],
            ),
          );
        },
      ),
      // bottomNavigationBar:
      //     kIsWeb
      //         ? null
      //         : BlocBuilder<PageIndexCubit, int>(
      //           builder:
      //               (context, state) => ClipRRect(
      //                 borderRadius: BorderRadius.vertical(
      //                   top: Radius.circular(25.r),
      //                 ),
      //                 child: BottomNavigationBar(
      //                   currentIndex: state,
      //                   onTap: (value) {
      //                     context.read<PageIndexCubit>().onPressed(value);
      //                   },
      //                   iconSize: 24.r,
      //                   selectedFontSize: 14.r,
      //                   showSelectedLabels: true,
      //                   selectedItemColor: ColorName.primaryColor,
      //                   unselectedItemColor: ColorName.iconColor,
      //                   items: [
      //                     BottomNavigationBarItem(
      //                       backgroundColor: Colors.white,
      //                       icon: Icon(Iconsax.home_2),
      //                       label: "Home",
      //                     ),
      //                     BottomNavigationBarItem(
      //                       backgroundColor: Colors.white,
      //                       icon: Icon(Iconsax.category_2),
      //                       label: "Explore",
      //                     ),
      //                     BottomNavigationBarItem(
      //                       backgroundColor: Colors.white,
      //                       icon: Icon(Iconsax.heart),
      //                       label: "Favorites",
      //                     ),
      //                     BottomNavigationBarItem(
      //                       backgroundColor: Colors.white,
      //                       icon: Icon(Iconsax.user),
      //                       label: "Profile",
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //         ),
      body: BlocBuilder<PageIndexCubit, int>(
        builder: (context, state) => bodies[state],
      ),
    );
  }
}
