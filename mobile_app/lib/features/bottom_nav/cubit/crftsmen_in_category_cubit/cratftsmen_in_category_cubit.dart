import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sanayi_app/core/networking/api_error_model.dart';
import 'package:sanayi_app/features/bottom_nav/data/models/get_all_craftsmen_in_categoties_response_model.dart.dart';
import 'package:sanayi_app/features/bottom_nav/data/repos/home_repo.dart';

part 'cratftsmen_in_category_state.dart';

class CratftsmenInCategoryCubit extends Cubit<CratftsmenInCategoryState> {
  CratftsmenInCategoryCubit(this.homeRepo)
    : super(CratftsmenInCategoryInitial());
  final HomeRepo homeRepo;

  Future<void> getAllCraftsmenInCategory(String categoryId) async {
    emit(CratftsmenInCategoryLoading());
    final result = await homeRepo.getAllCraftsmenInCategory(categoryId);

    if (result.isSuccess) {
      emit(CratftsmenInCategorySuccess(result.data!));
    } else if (result.isFailure) {
      emit(CratftsmenInCategoryFailure(result.errorModel!));
    }
  }
}
