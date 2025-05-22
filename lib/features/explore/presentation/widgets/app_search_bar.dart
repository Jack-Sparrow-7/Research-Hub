import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:research_hub/core/constants/color_pallete.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    super.key,
    required this.searchController,
    required this.items,
  });

  final SearchController searchController;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return SearchAnchor.bar(
      isFullScreen: false,
      searchController: searchController,
      onSubmitted: (value) {
        FocusScope.of(context).unfocus();
      },
      viewHintText: "Search for Projects",
      viewHeaderHintStyle: GoogleFonts.inter(color: ColorPallete.greyColor),
      viewShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.r),
      ),
      viewSide: BorderSide(color: ColorPallete.fieldBorder),
      barSide: WidgetStatePropertyAll(
        BorderSide(color: ColorPallete.fieldBorder),
      ),
      barLeading: Icon(
        Iconsax.search_normal_1_copy,
        color: ColorPallete.greyColor,
      ),
      barHintText: "Search for Projects",
      barHintStyle: WidgetStatePropertyAll(
        GoogleFonts.inter(color: ColorPallete.greyColor),
      ),
      barBackgroundColor: WidgetStatePropertyAll(Colors.white),
      barElevation: WidgetStatePropertyAll(.3),
      barShape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
      ),
      viewBackgroundColor: Colors.white,
      suggestionsBuilder: (context, controller) {
        final text = controller.text.toLowerCase();
        final suggestions =
            items.where((item) => item.toLowerCase().contains(text)).toList();
        return suggestions.map((suggestion) {
          return ListTile(title: Text(suggestion));
        }).toList();
      },
    );
  }
}