part of 'add_cuti_bloc.dart';

@freezed
class AddCutiEvent with _$AddCutiEvent {
  const factory AddCutiEvent.started() = _Started;
    const factory AddCutiEvent.addPermission({
    required String date,
    required String reason,
    // required XFile? image,
  }) = _AddCuti;
}