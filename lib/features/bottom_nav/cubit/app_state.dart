import 'package:sanayi_app/core/helpers/constants.dart';

class AppState {
  final RequestsStatus changeBottomNavStatus;

  const AppState({this.changeBottomNavStatus = RequestsStatus.initial});

  AppState copyWith({RequestsStatus? changeBottomNavStatus}) {
    return AppState(
      changeBottomNavStatus:
          changeBottomNavStatus ?? this.changeBottomNavStatus,
    );
  }
}
