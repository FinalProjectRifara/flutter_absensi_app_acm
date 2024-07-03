part of 'is_checked_in_bloc.dart';

@freezed
class IsCheckedInEvent with _$IsCheckedInEvent {
  const factory IsCheckedInEvent.started() = _Started;
  const factory IsCheckedInEvent.isCheckedIn() = _IsCheckedIn;
}