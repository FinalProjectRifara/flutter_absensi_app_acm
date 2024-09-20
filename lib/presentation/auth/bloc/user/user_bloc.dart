// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_absensi_app_acm/data/models/response/update_user_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_absensi_app_acm/data/datasources/user_remote_datasource.dart';
import 'package:flutter_absensi_app_acm/data/models/response/user_api_response_model.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRemoteDatasource datasource;
  UserBloc(
    this.datasource,
  ) : super(const _Initial()) {
    // Get User
    on<_GetUser>((event, emit) async {
      emit(const UserState.loading());

      final response = await datasource.getUser();

      response.fold(
        // (l) => emit(_Error(l)),
        (l) {
          log("Error saat mengambil data user: $l");
          emit(const UserState.error('Internal Server Error'));
        },
        (r) {
          log("Data user berhasil diambil: ${r.toJson()}");
          emit(_Loaded(r));
        },
      );
    });

    // Edit Data
    on<_UpdateUser>((event, emit) async {
      emit(const UserState.loading());

      final response = await datasource.updateUser(
        event.name,
        event.email,
        event.phone,
        // event.address,
      );
      response.fold(
        (l) {
          log("Error saat memperbarui data user: $l");
          emit(const UserState.error('Internal Server Error'));
        },
        (r) {
          log("Data user berhasil diperbarui: ${r.toJson()}");
          emit(UserState.updated(r));
        },
      );
    });
  }
}
