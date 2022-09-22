// ignore_for_file: public_member_api_docs, sort_constructors_first

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryStatus': categoryStatus.toString(),
      'categories': categories.map((x) => x.toMap()).toList(),
      'error': error.toString(),
    };
  }

  factory CategoryState.fromMap(Map<String, dynamic> map) {
    return CategoryState(
      categoryStatus: map['categoryStatus'],
      categories: List<Category>.from(
        (map['categories'] as List<int>).map<Category>(
          (x) => Category.fromMap(x as Map<String, dynamic>),
        ),
      ),
      error: map['error'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryState.fromJson(String source) =>
      CategoryState.fromMap(json.decode(source) as Map<String, dynamic>);
}
