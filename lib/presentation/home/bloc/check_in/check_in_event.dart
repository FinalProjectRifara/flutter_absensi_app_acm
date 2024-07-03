part of 'check_in_bloc.dart';

@freezed
class CheckInEvent with _$CheckInEvent {
  const factory CheckInEvent.started() = _Started;
    const factory CheckInEvent.checkin(String latitute, String longitude) = _Checkin;
}