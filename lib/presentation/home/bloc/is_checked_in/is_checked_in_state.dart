part of 'is_checked_in_bloc.dart';

@freezed
class IsCheckedInState with _$IsCheckedInState {
  const factory IsCheckedInState.initial() = _Initial;
  const factory IsCheckedInState.loading() = _Loading;
  const factory IsCheckedInState.success(AbsenStatus data) = _Success;
  const factory IsCheckedInState.error(String message) = _Error;
}
