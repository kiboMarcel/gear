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
}
