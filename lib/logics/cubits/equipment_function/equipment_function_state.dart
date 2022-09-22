// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'equipment_function_cubit.dart';

class EquipmentFunctionState extends Equatable {
  final EquipFunctionStatus equipFunctionStatus;
  final List<EquipmentFunction> equipmentFunctions;
  final CustomError error;

  EquipmentFunctionState({
    required this.equipFunctionStatus,
    required this.equipmentFunctions,
    required this.error,
  });

  factory EquipmentFunctionState.loading() {
    return EquipmentFunctionState(
      equipFunctionStatus: EquipFunctionStatus.loading,
      equipmentFunctions: [],
      error: CustomError(),
    );
  }

  @override
  List<Object> get props => [equipFunctionStatus, equipmentFunctions, error];

  EquipmentFunctionState copyWith({
    EquipFunctionStatus? equipFunctionStatus,
    List<EquipmentFunction>? equipmentFunctions,
    CustomError? error,
  }) {
    return EquipmentFunctionState(
      equipFunctionStatus: equipFunctionStatus ?? this.equipFunctionStatus,
      equipmentFunctions: equipmentFunctions ?? this.equipmentFunctions,
      error: error ?? this.error,
    );
  }

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'equipFunctionStatus': equipFunctionStatus.toString(),
      'equipmentFunctions': equipmentFunctions.map((x) => x.toMap()).toList(),
      'error': error.toString(),
    };
  }

  factory EquipmentFunctionState.fromMap(Map<String, dynamic> map) {
    return EquipmentFunctionState(
      equipFunctionStatus: map['equipFunctionStatus'],
      equipmentFunctions: List<EquipmentFunction>.from(
        (map['equipmentFunctions'] as List<int>).map<EquipmentFunction>(
          (x) => EquipmentFunction.fromMap(x as Map<String, dynamic>),
        ),
      ),
      error: map['error'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EquipmentFunctionState.fromJson(String source) =>
      EquipmentFunctionState.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
