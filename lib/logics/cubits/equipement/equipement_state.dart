// ignore_for_file: public_member_api_docs, sort_constructors_first

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'equipmentStatus': equipmentStatus.toString(),
      'equipments': equipments.map((x) => x.toMap()).toList(),
      'error': error.toString(),
    };
  }

  factory EquipementState.fromMap(Map<String, dynamic> map) {
    return EquipementState(
      equipmentStatus: map['equipmentStatus'],
      equipments: List<Equipement>.from(
        (map['equipments'] as List<int>).map<Equipement>(
          (x) => Equipement.fromMap(x as Map<String, dynamic>),
        ),
      ),
      error: map['error'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EquipementState.fromJson(String source) =>
      EquipementState.fromMap(json.decode(source) as Map<String, dynamic>);
}
