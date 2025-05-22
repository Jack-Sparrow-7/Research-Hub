import 'package:research_hub/features/home/domain/entities/dash_board_entitiy.dart';

class DashBoardModel extends DashBoardEntitiy {
  DashBoardModel({
    required super.title,
    required super.subtitle,
    required super.image,
  });

  factory DashBoardModel.fromMap(Map<String, dynamic> map) {
    return DashBoardModel(
      title: map['title'],
      subtitle: map['count'],
      image: map['image'],
    );
  }
}
