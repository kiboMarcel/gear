import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../constants/enums.dart';
import '../../../data/models/category.dart';
import '../../../data/models/custom_error.dart';
import '../../../data/repositories/category_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository categoryRepository;
  CategoryCubit({required this.categoryRepository})
      : super(CategoryState.loading());

  Future<void> getCategories() async {
    emit(state.copyWith(categoryStatus: CategoryStatus.loading));

    try {
      final List<Category> catList = await categoryRepository.getCategory();

      emit(state.copyWith(
          categoryStatus: CategoryStatus.loaded, categories: catList));
    } on CustomError catch (e) {
      emit(state.copyWith(categoryStatus: CategoryStatus.error, error: e));
    }
  }

  @override
  CategoryState? fromJson(Map<String, dynamic> json) {
    return CategoryState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CategoryState state) {
    return state.toMap();
  }
}
