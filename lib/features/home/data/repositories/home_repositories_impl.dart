import 'package:research_hub/features/home/data/data%20source/home_data_source.dart';
import 'package:research_hub/features/home/domain/entities/dash_board_entitiy.dart';
import 'package:research_hub/features/home/domain/entities/domain_entitiy.dart';
import 'package:research_hub/features/home/domain/repositories/home_repository.dart';

class HomeRepositoriesImpl implements HomeRepository {
  final HomeDataSource _homeDataSource;

  HomeRepositoriesImpl({required HomeDataSource homeDataSource})
    : _homeDataSource = homeDataSource;

  @override
  Future<List<DashBoardEntitiy>> getDashBoard(){
    return _homeDataSource.getDashBoard();
  }

  @override
  Future<List<DomainEntitiy>> getDomains(){
    return _homeDataSource.getDomains();
  }
}
