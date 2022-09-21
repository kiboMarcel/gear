// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'symptom_cubit.dart';

class SymptomState extends Equatable {
  final SymptomStatus symptomStatus;
  final List<Symptom> allSymptoms;
  final List<Symptom> symptomsByEquipemet;
  final List<Symptom> symptomByFonction;
  final CustomError error;

  SymptomState({
    required this.symptomStatus,
    required this.allSymptoms,
    required this.symptomsByEquipemet,
    required this.symptomByFonction,
    required this.error,
  });

  factory SymptomState.loading() {
    return SymptomState(
      symptomStatus: SymptomStatus.loading,
      allSymptoms: [],
      symptomsByEquipemet: [],
      symptomByFonction: [],
      error: CustomError(),
    );
  }

  @override
  List<Object> get props => [
        symptomStatus,
        allSymptoms,
        symptomsByEquipemet,
        symptomByFonction,
        error
      ];

  @override
  bool get stringify => true;

  SymptomState copyWith({
    SymptomStatus? symptomStatus,
    List<Symptom>? allSymptoms,
    List<Symptom>? symptomsByEquipemet,
    List<Symptom>? symptomByFonction,
    CustomError? error,
  }) {
    return SymptomState(
      symptomStatus: symptomStatus ?? this.symptomStatus,
      allSymptoms: allSymptoms ?? this.allSymptoms,
      symptomsByEquipemet: symptomsByEquipemet ?? this.symptomsByEquipemet,
      symptomByFonction: symptomByFonction ?? this.symptomByFonction,
      error: error ?? this.error,
    );
  }
}
