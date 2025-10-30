part of 'cratftsmen_in_category_cubit.dart';

@immutable
sealed class CratftsmenInCategoryState {}

final class CratftsmenInCategoryInitial extends CratftsmenInCategoryState {}

final class CratftsmenInCategoryLoading extends CratftsmenInCategoryState {}

final class CratftsmenInCategorySuccess extends CratftsmenInCategoryState {
  final Data craftsmenList;
  CratftsmenInCategorySuccess(this.craftsmenList);
}

final class CratftsmenInCategoryFailure extends CratftsmenInCategoryState {
  final ApiErrorModel apiErrorModel;
  CratftsmenInCategoryFailure(this.apiErrorModel);
}
