import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/enums.dart';
import '../../../data/models/custom_error.dart';
import '../../../data/models/equipment_function.dart';
import '../../../data/repositories/equipment_function_repository.dart';

part 'equipment_function_state.dart';

class EquipmentFunctionCubit extends Cubit<EquipmentFunctionState> {
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
}
