import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'equipement_state.dart';

class EquipementCubit extends Cubit<EquipementState> {
  EquipementCubit() : super(EquipementInitial());
}
