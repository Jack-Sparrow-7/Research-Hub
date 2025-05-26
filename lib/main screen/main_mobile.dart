import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:research_hub/core/constants/color_pallete.dart';
import 'package:research_hub/features/auth/presentation/cubit/auth_status_cubit.dart';
import 'package:research_hub/features/explore/presentation/bodies/explore_body_mobile.dart';
import 'package:research_hub/features/favorites/presentation/bodies/favorites_body_mobile.dart';
import 'package:research_hub/features/home/presentation/bodies/home_body_mobile.dart';
import 'package:research_hub/features/profile/presentation/bodies/profile_body_mobile.dart';
import 'package:research_hub/features/projects/presentation/bodies/add_project_body_mobile.dart';
import 'package:research_hub/features/projects/presentation/bodies/your_projects_body_mobile.dart';
import 'package:research_hub/main%20screen/cubit/page_index_cubit.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final isAdmin = context.watch<AuthStatusCubit>().state;
    final bodies = [
      HomeBodyMobile(),
      ExploreBodyMobile(),
      FavoritesBodyMobile(),
      ProfileBodyMobile(),
      if (isAdmin) AddProjectBodyMobile(),
      if (isAdmin) YourProjectsBodyMobile(),
    ];
    final String? image = FirebaseAuth.instance.currentUser!.photoURL;
    final bool isImage = image != null;
    return Scaffold(
      backgroundColor: ColorPallete.scaffoldColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Text("Research Hub"),
        titleTextStyle: GoogleFonts.pacifico(
          fontWeight: FontWeight.w500,
          fontSize: 27.sp,
          color: ColorPallete.primaryColor,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Iconsax.notification_copy)),
          Gap(10.r),
          GestureDetector(
            onTap: () => context.read<PageIndexCubit>().onPressed(3),
            child: CircleAvatar(
              radius: 18.w,
              foregroundImage:
                  isImage
                      ? CachedNetworkImageProvider(image)
                      : AssetImage('assets/images/profile.png'),
            ),
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
                  child: CircleAvatar(
                    foregroundImage: AssetImage('assets/images/favicon.png'),
                    backgroundColor: ColorPallete.primaryColor,
                    radius: 70.w,
                  ),
                ),
                ListTile(
                  onTap: () => context.read<PageIndexCubit>().onPressed(0),
                  selected: state == 0 ? true : false,
                  selectedColor: ColorPallete.primaryColor,
                  title: Text("Home"),
                  leading: Icon(Iconsax.home_2),
                ),
                ListTile(
                  onTap: () => context.read<PageIndexCubit>().onPressed(1),

                  selected: state == 1 ? true : false,
                  selectedColor: ColorPallete.primaryColor,
                  title: Text("Explore"),
                  leading: Icon(Iconsax.category_2),
                ),
                ListTile(
                  onTap: () => context.read<PageIndexCubit>().onPressed(2),

                  selected: state == 2 ? true : false,
                  selectedColor: ColorPallete.primaryColor,
                  title: Text("Favorites"),
                  leading: Icon(Iconsax.heart),
                ),
                ListTile(
                  onTap: () => context.read<PageIndexCubit>().onPressed(3),

                  selected: state == 3 ? true : false,
                  selectedColor: ColorPallete.primaryColor,
                  title: Text("Profile"),
                  leading: Icon(Iconsax.user),
                ),
                if (isAdmin)
                  ListTile(
                    onTap: () => context.read<PageIndexCubit>().onPressed(4),

                    selected: state == 4 ? true : false,
                    selectedColor: ColorPallete.primaryColor,
                    title: Text("Add Project"),
                    leading: Icon(Iconsax.add_circle),
                  ),
                if (isAdmin)
                  ListTile(
                    onTap: () => context.read<PageIndexCubit>().onPressed(5),

                    selected: state == 5 ? true : false,
                    selectedColor: ColorPallete.primaryColor,
                    title: Text("Your Projects"),
                    leading: Icon(Iconsax.folder_open),
                  ),
              ],
            ),
          );
        },
      ),
      body: BlocBuilder<PageIndexCubit, int>(
        builder: (context, state) => bodies[state],
      ),
    );
  }
}
