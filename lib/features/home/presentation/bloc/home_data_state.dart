part of 'home_data_bloc.dart';

abstract class HomeDataState {}

class HomeDataInitial extends HomeDataState {}

class HomeDataLoading extends HomeDataState {}

class HomeDataLoaded extends HomeDataState {
  final List<DashBoardEntitiy> dashBoardList;
  final List<DomainEntitiy> domainList;

  HomeDataLoaded({required this.domainList, required this.dashBoardList});
}

class HomeDataError extends HomeDataState {
  final String message;

  HomeDataError({required this.message});
}
