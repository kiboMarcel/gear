import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../constants/enums.dart';
import '../../../data/models/custom_error.dart';
import '../../../data/models/equipement.dart';
import '../../../data/repositories/equipements_repository.dart';

part 'equipement_state.dart';

class EquipementCubit extends Cubit<EquipementState> {
  final EquipementRepository equipementRepository;
  EquipementCubit({required this.equipementRepository})
      : super(EquipementState.loading());

  Future<void> getEquipement({required String catid}) async {
    emit(state.copyWith(equipmentStatus: EquipmentStatus.loading));

    final List<Equipement> equipements =
        await equipementRepository.getEquipment(catId: catid);

    emit(state.copyWith(
        equipmentStatus: EquipmentStatus.loaded, equipments: equipements));

    try {} on CustomError catch (e) {
      emit(state.copyWith(equipmentStatus: EquipmentStatus.error, error: e));
    }
  }

  @override
  EquipementState? fromJson(Map<String, dynamic> json) {
    return EquipementState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(EquipementState state) {
    return state.toMap();
  }
}
