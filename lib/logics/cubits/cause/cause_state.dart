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
}
