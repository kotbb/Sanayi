import 'package:sanayi_app/core/helpers/constants.dart';

class AppState {
  final RequestsStatus changeBottomNavStatus;
  final RequestsStatus changeCraftmanBottomNavStatus;

  const AppState({
    this.changeCraftmanBottomNavStatus = RequestsStatus.initial,
    this.changeBottomNavStatus = RequestsStatus.initial,
  });

  AppState copyWith({
    RequestsStatus? changeBottomNavStatus,
    RequestsStatus? changeCraftmanBottomNavStatus,
  }) {
    return AppState(
      changeBottomNavStatus:
          changeBottomNavStatus ?? this.changeBottomNavStatus,
      changeCraftmanBottomNavStatus:
          changeCraftmanBottomNavStatus ?? this.changeCraftmanBottomNavStatus,
    );
  }
}
