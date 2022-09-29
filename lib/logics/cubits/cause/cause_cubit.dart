import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../constants/enums.dart';
import '../../../data/models/cause.dart';
import '../../../data/models/custom_error.dart';
import '../../../data/repositories/cause_repository.dart';

part 'cause_state.dart';

class CauseCubit extends Cubit<CauseState> {
  final CauseRepository causeRepository;
  CauseCubit({required this.causeRepository}) : super(CauseState.loading());

  Future<void> getCause({required String symptomId}) async {
    emit(state.copyWith(causeStatus: CauseStatus.loading));

    try {
      final List<Cause> causes =
          await causeRepository.getCause(symptomId: symptomId);

      emit(state.copyWith(causeStatus: CauseStatus.loaded, causes: causes));
    } on CustomError catch (e) {
      emit(state.copyWith(causeStatus: CauseStatus.error, error: e));
    }
  }
}
