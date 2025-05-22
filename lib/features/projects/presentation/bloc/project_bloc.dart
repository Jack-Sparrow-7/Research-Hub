import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:research_hub/features/projects/domain/entities/project_entity.dart';
import 'package:research_hub/features/projects/domain/usecases/get_projects_usecase.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final GetProjectsUsecase _getProjectsUsecase;
  ProjectBloc(this._getProjectsUsecase) : super(ProjectInitial()) {
    on<FetchProjects>((event, emit) async {
      emit(ProjectsLoading());
      try {
        final projects = await _getProjectsUsecase.call();
        Map<String, List<ProjectEntity>> groupedProjects = {};
        for (var project in projects) {
          groupedProjects.putIfAbsent(project.domainId, () => []).add(project);
          groupedProjects.putIfAbsent(project.categoryId, () => []).add(project);
        }
        emit(
          ProjectsLoaded(projects: projects, groupedProjects: groupedProjects),
        );
      } catch (e) {
        emit(ProjectsError(errorMessage: "Failed to fetch!"));
      }
    });
  }
}
