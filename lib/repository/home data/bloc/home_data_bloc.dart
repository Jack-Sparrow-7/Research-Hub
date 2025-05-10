import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:research_hub/model/assets_model.dart';
import 'package:research_hub/model/dash_board_model.dart';
import 'package:research_hub/model/domain_model.dart';

part 'home_data_event.dart';
part 'home_data_state.dart';

class HomeDataBloc extends Bloc<HomeDataEvent, HomeDataState> {
  final FirebaseFirestore _firestore;
  HomeDataBloc(this._firestore) : super(HomeDataInitial()) {
    on<FetchHomeData>((event, emit) => _onFetchHomeData(event, emit));
  }

  Future<void> _onFetchHomeData(
    FetchHomeData event,
    Emitter<HomeDataState> emit,
  ) async {
    emit(HomeDataLoading());
    try {
      final assetSnapShot =
          await _firestore.collection('assets').doc('images').get();
      final domainSnapShot = await _firestore.collection('domains').get();
      final dashBoardSnapShot = await _firestore.collection('dash_board').get();
      final assets = AssetsModel.fromMap(assetSnapShot.data() ?? {});
      final domainList =
          domainSnapShot.docs.map((doc) {
            return DomainModel(
              title: doc['title'],
              projectsCount: doc['count'],
              fundedProjectsCount: doc['funded'],
              image: doc['image'],
              sub_1: doc['sub_1'],
              sub_2: doc['sub_2'],
              projects: doc['projects'],
              description: doc['description'],
            );
          }).toList();
      final dashBoardList =
          dashBoardSnapShot.docs.map((doc) {
            return DashBoardModel.fromMap(doc.data());
          }).toList();
      emit(
        HomeDataLoaded(
          dashBoardList: dashBoardList,
          domainList: domainList,
          assets: assets,
        ),
      );
    } catch (e) {
      emit(HomeDataError(message: "Failed to Fetch Data!"));
    }
  }
}
