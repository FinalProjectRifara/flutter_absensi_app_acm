// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_absensi_app_acm/data/datasources/permisson_remote_datasource.dart';

part 'add_permissions_bloc.freezed.dart';
part 'add_permissions_event.dart';
part 'add_permissions_state.dart';

class AddPermissionsBloc
    extends Bloc<AddPermissionsEvent, AddPermissionsState> {
  final PermissonRemoteDatasource datasource;
  AddPermissionsBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_AddPermission>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.addPermission(
        event.date,
        event.reason,
        event.image,
      );
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(const _Success()),
      );
    });
  }
}
