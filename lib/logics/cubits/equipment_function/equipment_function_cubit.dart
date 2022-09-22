import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../constants/enums.dart';
import '../../../data/models/custom_error.dart';
import '../../../data/models/equipment_function.dart';
import '../../../data/repositories/equipment_function_repository.dart';

part 'equipment_function_state.dart';

class EquipmentFunctionCubit extends Cubit<EquipmentFunctionState>
    with HydratedMixin {
  final EquipementFunctionRepository equipementFunctionRepository;
  EquipmentFunctionCubit({required this.equipementFunctionRepository})
      : super(EquipmentFunctionState.loading());

  Future<void> getEquipementfunctions({required String catName}) async {
    emit(state.copyWith(equipFunctionStatus: EquipFunctionStatus.loading));

    try {
      final List<EquipmentFunction> equiFunctionList =
          await equipementFunctionRepository.getEquipmentFunction(
              catName: catName);

      emit(state.copyWith(
          equipFunctionStatus: EquipFunctionStatus.loaded,
          equipmentFunctions: equiFunctionList));
    } on CustomError catch (e) {
      emit(state.copyWith(
          equipFunctionStatus: EquipFunctionStatus.error, error: e));
    }
  }

  @override
  EquipmentFunctionState? fromJson(Map<String, dynamic> json) {
    return EquipmentFunctionState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(EquipmentFunctionState state) {
    return state.toMap();
  }
}
