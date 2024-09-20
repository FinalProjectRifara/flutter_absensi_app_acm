// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_absensi_app_acm/data/datasources/cuti_remote_datasource.dart';

part 'add_cuti_bloc.freezed.dart';
part 'add_cuti_event.dart';
part 'add_cuti_state.dart';

class AddCutiBloc extends Bloc<AddCutiEvent, AddCutiState> {
  final CutiRemoteDatasource datasource;
  AddCutiBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_AddCuti>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.addCuti(
        event.date,
        event.reason,
        // event.image,
      );
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(const _Success()),
      );
    });
  }
}
