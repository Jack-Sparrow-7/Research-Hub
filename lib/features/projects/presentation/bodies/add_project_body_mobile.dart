import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:research_hub/core/constants/color_pallete.dart';
import 'package:research_hub/features/explore/presentation/bloc/explore_bloc.dart';
import 'package:research_hub/features/home/presentation/bloc/home_data_bloc.dart';
import 'package:research_hub/features/projects/presentation/cubit/team_members_cubit.dart';
import 'package:research_hub/features/projects/presentation/widgets/drop_down.dart';
import 'package:research_hub/features/projects/presentation/widgets/shadow_card.dart';

class AddProjectBodyMobile extends StatefulWidget {
  const AddProjectBodyMobile({super.key});

  @override
  State<AddProjectBodyMobile> createState() => _AddProjectBodyMobileState();
}

class _AddProjectBodyMobileState extends State<AddProjectBodyMobile> {
  final titleController = TextEditingController();
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final teamMembersCubit = context.read<TeamMembersCubit>();
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.w),
      child: ShadowCard(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0).w,
          child: FormBuilder(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Add New Project",
                    style: GoogleFonts.inter(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Gap(30.w),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Fill in the details below to create a new project. Fields marked with * are required.",
                    style: GoogleFonts.inter(fontSize: 18.sp),
                  ),
                ),
                Gap(40.w),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: ColorPallete.tileColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Project Details",
                        style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Gap(20.w),
                      _buildLabel(text: "Project Title *"),
                      Gap(5.w),
                      FilledOutlinedFormField(
                        name: 'Project Title',
                        hintText: "e.g.,Smart Home,Home Automation",
                      ),
                      Gap(20.w),
                      _buildLabel(text: "Domain *"),
                      Gap(5.w),
                      BlocBuilder<HomeDataBloc, HomeDataState>(
                        builder: (context, state) {
                          if (state is HomeDataLoaded) {
                            final domainList = state.domainList;
                            return FilledOutlinedDropDown(
                              list: domainList,
                              hintText: "Select Domain",
                            );
                          } else {
                            return Text("Failed to fetch details!");
                          }
                        },
                      ),
                      Gap(20.w),
                      _buildLabel(text: "Category *"),
                      Gap(5.w),
                      BlocBuilder<ExploreBloc, ExploreState>(
                        builder: (context, state) {
                          if (state is CategoriesLoaded) {
                            final categoryList = state.categories;
                            return FilledOutlinedDropDown(
                              list: categoryList,
                              hintText: "Select Category",
                            );
                          } else {
                            return Text("Failed to fetch details!");
                          }
                        },
                      ),
                      Gap(20.w),
                      _buildLabel(text: "Team Members *"),
                      Gap(5.w),
                      BlocBuilder<
                        TeamMembersCubit,
                        List<Map<String, dynamic>>
                      >(
                        builder: (context, state) {
                          final teamMembers = state;
                          return Column(
                            children:
                                teamMembers.asMap().entries.map((e) {
                                  final index = e.key;
                                  final num = index + 1;
                                  return Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 15.0).w,
                                    child: Column(
                                      spacing: 15.w,
                                      children: [
                                        FilledOutlinedFormField(
                                          name: 'Team Member $index Name',
                                          hintText: "Team Member $num - Name",
                                        ),
                                        FilledOutlinedFormField(
                                          name: 'Team Member $index Role',
                                          hintText: 'Team Member $num - Role',
                                        ),
                                        if (teamMembers.length > 1)
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: TextButton.icon(
                                              style: TextButton.styleFrom(
                                                foregroundColor: Colors.red,
                                              ),
                                              onPressed:
                                                  () => teamMembersCubit
                                                      .removeMember(
                                                        index: index,
                                                      ),
                                              icon: Icon(Icons.delete),
                                              label: Text(
                                                "Remove",
                                                style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                          );
                        },
                      ),
                      Gap(20.w),
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          foregroundColor: ColorPallete.primaryColor,
                        ),
                        onPressed: teamMembersCubit.addMember,
                        icon: Icon(Iconsax.add_copy, size: 20.w),
                        label: Text(
                          "Add Team Member",
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text _buildLabel({required String text}) =>
      Text(text, style: GoogleFonts.inter(fontSize: 16.sp));
}

class FilledOutlinedFormField extends StatelessWidget {
  const FilledOutlinedFormField({
    super.key,
    required this.name,
    required this.hintText,
  });

  final String name;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      validator: (value) {
        if (value != null && value.isNotEmpty) {
          return null;
        }
        return "This field is required";
      },
      name: name,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 15.w),
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        hintStyle: GoogleFonts.inter(
          fontSize: 16.sp,
          color: const Color.fromRGBO(156, 163, 175, 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: ColorPallete.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Color.fromRGBO(209, 213, 219, 1)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
