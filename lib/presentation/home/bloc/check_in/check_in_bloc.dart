// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_absensi_app_acm/data/models/request/checkinout_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_absensi_app_acm/data/datasources/attendance_remote_datasource.dart';
import 'package:flutter_absensi_app_acm/data/models/response/checkinout_response_model.dart';

part 'check_in_bloc.freezed.dart';
part 'check_in_event.dart';
part 'check_in_state.dart';

class CheckInBloc extends Bloc<CheckInEvent, CheckInState> {
  final AttendanceRemoteDatasource datasource;
  CheckInBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_Checkin>((event, emit) async {
      emit(const _Loading());
      final requestModel = CheckInOutRequestModel(
        latitude: event.latitute,
        longitude: event.longitude,
      );

      final result = await datasource.checkin(requestModel);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
