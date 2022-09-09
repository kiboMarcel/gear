part of 'equipement_cubit.dart';

class EquipementState extends Equatable {
  final EquipmentStatus equipmentStatus;
  final List<Equipement> equipments;
  final CustomError error;

  EquipementState({
    required this.equipmentStatus,
    required this.equipments,
    required this.error,
  });

  factory EquipementState.loading() {
    return EquipementState(
      equipmentStatus: EquipmentStatus.loading,
      equipments: [],
      error: CustomError(),
    );
  }

  @override
  List<Object> get props => [equipmentStatus, equipments, error];

  EquipementState copyWith({
    EquipmentStatus? equipmentStatus,
    List<Equipement>? equipments,
    CustomError? error,
  }) {
    return EquipementState(
      equipmentStatus: equipmentStatus ?? this.equipmentStatus,
      equipments: equipments ?? this.equipments,
      error: error ?? this.error,
    );
  }

  @override
  bool get stringify => true;
}
