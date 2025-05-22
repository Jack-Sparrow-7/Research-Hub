import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:research_hub/features/explore/domain/entities/category_entity.dart';
import 'package:research_hub/features/explore/domain/usecases/get_categories_usecase.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final GetCategoriesUsecase _getCategoriesUsecase;
  ExploreBloc(this._getCategoriesUsecase) : super(ExploreInitial()) {
    on<FetCategories>((event, emit) async {
      emit(CategoriesLoading());
      try {
        final categories = await _getCategoriesUsecase.call();
        emit(CategoriesLoaded(categories: categories));
      } catch (e) {
        emit(CategoriesError(errorMessage: "Failed to fetch Data!"));
      }
    });
  }
}
