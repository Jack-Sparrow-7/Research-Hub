import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/route_manager.dart';
import 'package:research_hub/core/responsive/responsive_layout.dart';
import 'package:research_hub/features/projects/domain/entities/project_entity.dart';
import 'package:research_hub/features/projects/presentation/screens/project_desktop.dart';
import 'package:research_hub/features/projects/presentation/screens/project_mobile.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  late final ProjectEntity project;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final args = Get.arguments;
    project = args['project'];
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: ProjectMobile(project: project),
      tablet: ProjectMobile(project: project),
      desktop: ProjectDesktop(),
    );
  }
}
