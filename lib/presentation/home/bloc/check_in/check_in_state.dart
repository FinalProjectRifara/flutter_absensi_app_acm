part of 'check_in_bloc.dart';

@freezed
class CheckInState with _$CheckInState {
  const factory CheckInState.initial() = _Initial;
  const factory CheckInState.loading() = _Loading;
  const factory CheckInState.loaded(
      CheckInOutResponseModel responseModel) = _Loaded;
  const factory CheckInState.error(String message) = _Error;
}
