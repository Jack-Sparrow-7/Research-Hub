part of 'project_bloc.dart';

@immutable
sealed class ProjectState {}

final class ProjectInitial extends ProjectState {}

final class ProjectsLoading extends ProjectState {}

final class ProjectsLoaded extends ProjectState {
  final List<ProjectEntity> projects;
  final Map<String, List<ProjectEntity>> groupedProjects;

  ProjectsLoaded({required this.groupedProjects, required this.projects});
}

final class ProjectsError extends ProjectState {
  final String errorMessage;

  ProjectsError({required this.errorMessage});
}
