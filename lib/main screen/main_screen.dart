import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:research_hub/core/responsive/responsive_layout.dart';
import 'package:research_hub/features/explore/presentation/bloc/explore_bloc.dart';
import 'package:research_hub/features/home/presentation/bloc/home_data_bloc.dart';
import 'package:research_hub/main%20screen/main_desktop.dart';
import 'package:research_hub/main%20screen/main_mobile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeDataBloc>().add(FetchHomeData());
    context.read<ExploreBloc>().add(FetCategories());
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: MainMobile(),
      tablet: MainMobile(),
      desktop: MainDesktop(),
    );
  }
}
