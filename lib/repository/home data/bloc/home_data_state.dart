part of 'home_data_bloc.dart';

sealed class HomeDataState {}

final class HomeDataInitial extends HomeDataState {}

final class HomeDataLoading extends HomeDataState {}

final class HomeDataLoaded extends HomeDataState {
  final List<DashBoardModel> dashBoardList;
  final List<DomainModel> domainList;
  final AssetsModel assets;

  HomeDataLoaded({required this.assets,required this.dashBoardList, required this.domainList});
}

final class HomeDataError extends HomeDataState {
  final String message;

  HomeDataError({required this.message});
}
