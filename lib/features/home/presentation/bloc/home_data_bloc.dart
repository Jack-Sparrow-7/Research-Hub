import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:research_hub/features/home/domain/entities/dash_board_entitiy.dart';
import 'package:research_hub/features/home/domain/entities/domain_entitiy.dart';
import 'package:research_hub/features/home/domain/usecases/get_home_data_usecase.dart';

part 'home_data_event.dart';
part 'home_data_state.dart';

class HomeDataBloc extends Bloc<HomeDataEvent, HomeDataState> {
  final GetHomeDataUsecase fetchHomeDataUseCase;

  HomeDataBloc(this.fetchHomeDataUseCase) : super(HomeDataInitial()) {
    on<FetchHomeData>(_onFetchHomeData);
  }

  Future<void> _onFetchHomeData(
    FetchHomeData event,
    Emitter<HomeDataState> emit,
  ) async {
    emit(HomeDataLoading());
    try {
      final (domains, dashboard) = await fetchHomeDataUseCase();
      emit(HomeDataLoaded(domainList: domains, dashBoardList: dashboard));
    } catch (e) {
      emit(HomeDataError(message: 'Failed to fetch home data.'));
    }
  }
}
