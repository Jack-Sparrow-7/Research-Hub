import 'package:research_hub/features/home/domain/entities/dash_board_entitiy.dart';
import 'package:research_hub/features/home/domain/entities/domain_entitiy.dart';

abstract interface class HomeRepository {
  Future<List<DashBoardEntitiy>> getDashBoard();
  Future<List<DomainEntitiy>> getDomains();
}
