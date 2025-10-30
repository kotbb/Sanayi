import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sanayi_app/core/networking/api_error_model.dart';
import 'package:sanayi_app/features/bottom_nav/data/models/category_model.dart';
import 'package:sanayi_app/features/bottom_nav/data/repos/home_repo.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final HomeRepo _categoriesRepo;
  CategoriesCubit(this._categoriesRepo) : super(CategoriesInitial());

  void fetchCategories() async {
    emit(CategoriesLoading());

    final response = await _categoriesRepo.getAllCategories();

    if (response.isSuccess) {
      emit(CategoriesSuccess(response.data!.data.categories));
    } else {
      emit(CategoriesFailure(response.errorModel!));
    }
  }
}
