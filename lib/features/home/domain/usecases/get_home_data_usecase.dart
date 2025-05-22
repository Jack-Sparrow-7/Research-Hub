import 'package:research_hub/features/home/domain/entities/dash_board_entitiy.dart';
import 'package:research_hub/features/home/domain/entities/domain_entitiy.dart';
import 'package:research_hub/features/home/domain/repositories/home_repository.dart';

class GetHomeDataUsecase {
  final HomeRepository _homeRepository;

  GetHomeDataUsecase({required HomeRepository homeRepository})
    : _homeRepository = homeRepository;

  Future<(List<DomainEntitiy>, List<DashBoardEntitiy>)> call() async {
    final domains = await _homeRepository.getDomains();
    final dashBoards = await _homeRepository.getDashBoard();
    return (domains, dashBoards);
  }
}
