// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'cause_cubit.dart';

class CauseState extends Equatable {
  final CauseStatus causeStatus;
  final List<Cause> causes;
  final CustomError error;

  CauseState({
    required this.causeStatus,
    required this.causes,
    required this.error,
  });

  factory CauseState.loading() {
    return CauseState(
      causeStatus: CauseStatus.loading,
      causes: [],
      error: CustomError(),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [causeStatus, causes, error];

  CauseState copyWith({
    CauseStatus? causeStatus,
    List<Cause>? causes,
    CustomError? error,
  }) {
    return CauseState(
      causeStatus: causeStatus ?? this.causeStatus,
      causes: causes ?? this.causes,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'causeStatus': causeStatus.toString(),
      'causes': causes.map((x) => x.toMap()).toList(),
      'error': error.toString(),
    };
  }

  factory CauseState.fromMap(Map<String, dynamic> map) {
    return CauseState(
      causeStatus: map['causeStatus'],
      causes: List<Cause>.from(
        (map['causes'] as List<int>).map<Cause>(
          (x) => Cause.fromMap(x as Map<String, dynamic>),
        ),
      ),
      error: map['error'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CauseState.fromJson(String source) =>
      CauseState.fromMap(json.decode(source) as Map<String, dynamic>);
}
