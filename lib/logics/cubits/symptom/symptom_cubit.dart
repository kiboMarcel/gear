import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../constants/enums.dart';
import '../../../data/models/custom_error.dart';
import '../../../data/models/symptom.dart';
import '../../../data/repositories/symptom_repository.dart';

part 'symptom_state.dart';

class SymptomCubit extends Cubit<SymptomState> with HydratedMixin {
  final SymptomRepositpory symptomRepositpory;
  SymptomCubit({required this.symptomRepositpory})
      : super(SymptomState.loading());

  Future<void> getAllSymptom() async {
    try {
      final List<Symptom> allsymptom = await symptomRepositpory.getAllSymptom();

      emit(state.copyWith(
        allSymptoms: allsymptom,
      ));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getSymptomByEquip({required String equipementid}) async {
    emit(state.copyWith(
        symptomStatus: SymptomStatus.loading, symptomsByEquipemet: []));

    try {
      if (state.allSymptoms.isEmpty) {
        getAllSymptom();
      }

      final List<Symptom> symptom = await symptomRepositpory.getSymptomByEquip(
          equipementid: equipementid);

      emit(state.copyWith(
          symptomStatus: SymptomStatus.loaded,
          symptomsByEquipemet: symptom,
          symptomByFonction: []));
    } on CustomError catch (e) {
      emit(state.copyWith(symptomStatus: SymptomStatus.error, error: e));
    }
  }

  Future<void> getSymptomByFonction({required String fonctionId}) async {
    emit(state
        .copyWith(symptomStatus: SymptomStatus.loading, symptomByFonction: []));

    try {
      if (state.allSymptoms.isEmpty) {
        getAllSymptom();
      }

      final List<Symptom> symptom =
          await symptomRepositpory.getSymptomByFonction(fonctionId: fonctionId);

      emit(state.copyWith(
          symptomStatus: SymptomStatus.loaded,
          symptomByFonction: symptom,
          symptomsByEquipemet: []));
    } on CustomError catch (e) {
      emit(state.copyWith(symptomStatus: SymptomStatus.error, error: e));
    }
  }

  @override
  SymptomState? fromJson(Map<String, dynamic> json) {
    return SymptomState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SymptomState state) {
    return state.toMap();
  }
}
