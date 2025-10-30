import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sanayi_app/core/networking/api_error_model.dart';
import 'package:sanayi_app/features/auth/data/repos/auth_repo.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this.authRepo) : super(LogoutInitial());
  final AuthRepo authRepo;


  void logout() async {
    emit(LogoutLoading());
    final result = await authRepo.logout();

    if (result.isSuccess) {
      emit(LogoutSuccess(message: result.data!.message));
    } else if (result.isFailure) {
      emit(LogoutFailure(errorModel: result.errorModel!));
    }
  }
}
