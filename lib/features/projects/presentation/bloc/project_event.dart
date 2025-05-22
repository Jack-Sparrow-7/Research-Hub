part of 'project_bloc.dart';

@immutable
sealed class ProjectEvent {}

final class FetchProjects extends ProjectEvent{}