part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.started() = _Started;
  const factory UserEvent.getUser() = _GetUser;
  const factory UserEvent.updateUser(
    String name,
    String email,
    String phone,
    // String address,
  ) = _UpdateUser; // Tambahkan event updateUser
}
