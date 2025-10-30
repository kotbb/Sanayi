import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sanayi_app/core/networking/api_error_model.dart';
import 'package:sanayi_app/features/bottom_nav/data/models/carftsman_model.dart';
import 'package:sanayi_app/features/bottom_nav/data/repos/home_repo.dart';

part 'craftsmen_state.dart';

class CraftsmenCubit extends Cubit<CraftsmenState> {
  CraftsmenCubit(this._homeRepo) : super(CraftsmenInitial());
  final HomeRepo _homeRepo;

  void getAllCraftsmen() async {
    emit(CraftsmenLoading());
    final response = await _homeRepo.getAllCraftsmen();
    if(response.isSuccess){
      emit(CraftsmenSuccess(response.data!.craftsmen));
    } else {
      emit(CraftsmenFailure(response.errorModel!));
    }
  }
}
