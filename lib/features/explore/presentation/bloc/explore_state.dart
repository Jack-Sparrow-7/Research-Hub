part of 'explore_bloc.dart';

@immutable
sealed class ExploreState {}

final class ExploreInitial extends ExploreState {}

final class CategoriesLoading extends ExploreState {}

final class CategoriesLoaded extends ExploreState {
  final List<CategoryEntity> categories;

  CategoriesLoaded({required this.categories});
}

final class CategoriesError extends ExploreState {
  final String errorMessage;

  CategoriesError({required this.errorMessage});
}
