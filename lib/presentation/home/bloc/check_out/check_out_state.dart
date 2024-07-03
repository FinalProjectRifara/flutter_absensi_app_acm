part of 'check_out_bloc.dart';

@freezed
class CheckOutState with _$CheckOutState {
  const factory CheckOutState.initial() = _Initial;
  const factory CheckOutState.loading() = _Loading;
  const factory CheckOutState.loaded(CheckInOutResponseModel responseModel) =
      _Loaded;
  const factory CheckOutState.error(String message) = _Error;
}
