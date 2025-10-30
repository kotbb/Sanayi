part of 'profile_cubit.dart';

class ProfileState {
  const ProfileState({
    this.errorModel,
    this.profileData,
    this.isLoading,
    this.isSuccess,
    this.isUpdating,

  });

  final ApiErrorModel? errorModel;
  final GetMyProfileResponseModel? profileData;
  final bool? isLoading;
  final bool? isSuccess;
  final bool? isUpdating;

  ProfileState copyWith({
    ApiErrorModel? errorModel,
    GetMyProfileResponseModel? profileData,
    bool? isLoading,
    bool? isSuccess,
    bool? isUpdating,
  }) {
    return ProfileState(
      errorModel: errorModel ?? this.errorModel,
      profileData: profileData ?? this.profileData,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isUpdating: isUpdating ?? this.isUpdating,
    );
  }
}
