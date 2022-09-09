part of 'symptom_cubit.dart';

class SymptomState extends Equatable {
  final SymptomStatus symptomStatus;
  final List<Symptom> symptomsByEquipemet;
  final List<Symptom> symptomByFonction;
  final CustomError error;

  SymptomState({
    required this.symptomStatus,
    required this.symptomsByEquipemet,
    required this.symptomByFonction,
    required this.error,
  });

  factory SymptomState.loading() {
    return SymptomState(
      symptomStatus: SymptomStatus.loading,
      symptomsByEquipemet: [],
      symptomByFonction: [],
      error: CustomError(),
    );
  }

  @override
  List<Object> get props =>
      [symptomStatus, symptomsByEquipemet, symptomByFonction, error];

  SymptomState copyWith({
    SymptomStatus? symptomStatus,
    List<Symptom>? symptomsByEquipemet,
    List<Symptom>? symptomByFonction,
    CustomError? error,
  }) {
    return SymptomState(
      symptomStatus: symptomStatus ?? this.symptomStatus,
      symptomsByEquipemet: symptomsByEquipemet ?? this.symptomsByEquipemet,
      symptomByFonction: symptomByFonction ?? this.symptomByFonction,
      error: error ?? this.error,
    );
  }

  @override
  bool get stringify => true;
}
