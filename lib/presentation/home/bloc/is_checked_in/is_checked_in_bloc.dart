// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_absensi_app/presentation/home/model/absen_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_absensi_app/data/datasources/attendance_remote_datasource.dart';

part 'is_checked_in_bloc.freezed.dart';
part 'is_checked_in_event.dart';
part 'is_checked_in_state.dart';

class IsCheckedInBloc extends Bloc<IsCheckedInEvent, IsCheckedInState> {
  final AttendanceRemoteDatasource datasource;
  IsCheckedInBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_IsCheckedIn>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.isCheckedin();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(
          _Success(
            AbsenStatus(
              isCheckedin: r.$1,
              isCheckedOut: r.$2,
            ),
          ),
        ),
      );
    });
  }
}
