import 'dart:convert';

class UpdateUserResponseModel {
    final String? message;
    final User? user;

    UpdateUserResponseModel({
        this.message,
        this.user,
    });

    factory UpdateUserResponseModel.fromJson(String str) => UpdateUserResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UpdateUserResponseModel.fromMap(Map<String, dynamic> json) => UpdateUserResponseModel(
        message: json["message"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "user": user?.toMap(),
    };
}

class User {
    final int? id;
    final String? name;
    final String? email;
    final String? fcmId;
    final String? phone;
    final String? roles;
    final String? address;
    final DateTime? emailVerifiedAt;
    final dynamic twoFactorSecret;
    final dynamic twoFactorRecoveryCodes;
    final dynamic twoFactorConfirmedAt;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    User({
        this.id,
        this.name,
        this.email,
        this.fcmId,
        this.phone,
        this.roles,
        this.address,
        this.emailVerifiedAt,
        this.twoFactorSecret,
        this.twoFactorRecoveryCodes,
        this.twoFactorConfirmedAt,
        this.createdAt,
        this.updatedAt,
    });

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        fcmId: json["fcm_id"],
        phone: json["phone"],
        roles: json["roles"],
        address: json["address"],
        emailVerifiedAt: json["email_verified_at"] == null ? null : DateTime.parse(json["email_verified_at"]),
        twoFactorSecret: json["two_factor_secret"],
        twoFactorRecoveryCodes: json["two_factor_recovery_codes"],
        twoFactorConfirmedAt: json["two_factor_confirmed_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "fcm_id": fcmId,
        "phone": phone,
        "roles": roles,
        "address": address,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "two_factor_secret": twoFactorSecret,
        "two_factor_recovery_codes": twoFactorRecoveryCodes,
        "two_factor_confirmed_at": twoFactorConfirmedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
