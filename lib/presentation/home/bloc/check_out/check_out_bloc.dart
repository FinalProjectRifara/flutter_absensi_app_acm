// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_absensi_app_acm/data/models/request/checkinout_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_absensi_app_acm/data/datasources/attendance_remote_datasource.dart';
import 'package:flutter_absensi_app_acm/data/models/response/checkinout_response_model.dart';

part 'check_out_bloc.freezed.dart';
part 'check_out_event.dart';
part 'check_out_state.dart';

class CheckOutBloc extends Bloc<CheckOutEvent, CheckOutState> {
  final AttendanceRemoteDatasource datasource;
  CheckOutBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_Checkout>((event, emit) async {
      emit(const _Loading());
      final requestModel = CheckInOutRequestModel(
        latitude: event.latitute,
        longitude: event.longitude,
      );
      final result = await datasource.checkout(requestModel);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
