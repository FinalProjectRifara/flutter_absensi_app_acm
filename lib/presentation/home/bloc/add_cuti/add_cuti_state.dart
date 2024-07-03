part of 'add_cuti_bloc.dart';

@freezed
class AddCutiState with _$AddCutiState {
  const factory AddCutiState.initial() = _Initial;
  const factory AddCutiState.loading() = _Loading;
  const factory AddCutiState.success() = _Success;
  const factory AddCutiState.error(String message) = _Error;
}
