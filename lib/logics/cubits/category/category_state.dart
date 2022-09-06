part of 'category_cubit.dart';

class CategoryState extends Equatable {
  final CategoryStatus categoryStatus;
  final List<Category> categories;
  final CustomError error;

  CategoryState({
    required this.categoryStatus,
    required this.categories,
    required this.error,
  });

  factory CategoryState.loading() {
    return CategoryState(
      categoryStatus: CategoryStatus.loading,
      categories: [],
      error: CustomError(),
    );
  }

  @override
  List<Object> get props => [categoryStatus, categories, error];

  @override
  bool get stringify => true;

  CategoryState copyWith({
    CategoryStatus? categoryStatus,
    List<Category>? categories,
    CustomError? error,
  }) {
    return CategoryState(
      categoryStatus: categoryStatus ?? this.categoryStatus,
      categories: categories ?? this.categories,
      error: error ?? this.error,
    );
  }
}
