import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/enums.dart';
import '../../../data/models/custom_error.dart';
import '../../../data/models/symptom.dart';
import '../../../data/repositories/symptom_repository.dart';

part 'symptom_state.dart';

class SymptomCubit extends Cubit<SymptomState> {
  final SymptomRepositpory symptomRepositpory;
  SymptomCubit({required this.symptomRepositpory})
      : super(SymptomState.loading());

  Future<void> getSymptomByEquip({required String equipementName}) async {
    emit(state.copyWith(symptomStatus: SymptomStatus.loading));

    try {
      final List<Symptom> symptom = await symptomRepositpory.getSymptomByEquip(
          equipementName: equipementName);

      emit(state.copyWith(
          symptomStatus: SymptomStatus.loaded,
          symptomsByEquipemet: symptom,
          symptomByFonction: []));
    } on CustomError catch (e) {
      emit(state.copyWith(symptomStatus: SymptomStatus.error, error: e));
    }
  }

  Future<void> getSymptomByFonction({required String fonctionName}) async {
    emit(state.copyWith(symptomStatus: SymptomStatus.loading));

    try {
      final List<Symptom> symptom = await symptomRepositpory
          .getSymptomByFonction(fonctionName: fonctionName);

      emit(state.copyWith(
          symptomStatus: SymptomStatus.loaded,
          symptomByFonction: symptom,
          symptomsByEquipemet: []));
    } on CustomError catch (e) {
      emit(state.copyWith(symptomStatus: SymptomStatus.error, error: e));
    }
  }
}
