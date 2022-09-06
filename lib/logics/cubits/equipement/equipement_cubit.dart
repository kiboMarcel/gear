import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'equipement_state.dart';

class EquipementCubit extends Cubit<EquipementState> {
  EquipementCubit() : super(EquipementInitial());
}
