import 'package:equatable/equatable.dart';

class EquipmentFunction extends Equatable {
  final String id;
  final String name;
  final String catId;

  EquipmentFunction({
    required this.id,
    required this.name,
    required this.catId,
  });

  factory EquipmentFunction.format(element) {
    late String id;
    late String name;
    late String catId;
    try {
      id = element['id'];
      name = element['data']['name'];
      catId = element['data']['cat_id'];
    } catch (e) {
      print(e);
    }

    return EquipmentFunction(
      id: id,
      name: name,
      catId: catId,
    );
  }

  @override
  List<Object> get props => [id, name, catId];

  EquipmentFunction copyWith({
    String? id,
    String? name,
    String? catId,
  }) {
    return EquipmentFunction(
      id: id ?? this.id,
      name: name ?? this.name,
      catId: catId ?? this.catId,
    );
  }

  @override
  bool get stringify => true;
}
