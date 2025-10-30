part of 'craftsmen_cubit.dart';

@immutable
sealed class CraftsmenState {}

final class CraftsmenInitial extends CraftsmenState {}

final class CraftsmenLoading extends CraftsmenState {}

final class CraftsmenSuccess extends CraftsmenState {
  final List<CarftsmanModel> craftsmen;
  CraftsmenSuccess(this.craftsmen);
}

final class CraftsmenFailure extends CraftsmenState {
  final ApiErrorModel apiErrorModel;
  CraftsmenFailure(this.apiErrorModel);
}
