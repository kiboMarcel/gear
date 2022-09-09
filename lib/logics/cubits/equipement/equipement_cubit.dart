import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/enums.dart';
import '../../../data/models/custom_error.dart';
import '../../../data/models/equipement.dart';
import '../../../data/repositories/equipements_repository.dart';

part 'equipement_state.dart';

class EquipementCubit extends Cubit<EquipementState> {
  final EquipementRepository equipementRepository;
  EquipementCubit({required this.equipementRepository})
      : super(EquipementState.loading());

  Future<void> getEquipement({required String catName}) async {
    emit(state.copyWith(equipmentStatus: EquipmentStatus.loading));

    final List<Equipement> equipements =
        await equipementRepository.getEquipment(catName: catName);

    emit(state.copyWith(
        equipmentStatus: EquipmentStatus.loaded, equipments: equipements));

    try {} on CustomError catch (e) {
      emit(state.copyWith(equipmentStatus: EquipmentStatus.error, error: e));
    }
  }
}
