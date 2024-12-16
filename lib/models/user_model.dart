import 'package:equatable/equatable.dart';

import 'location_model.dart';

class UserModel extends Equatable {
  final String? id;
  final String? image;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final Governorate? governorate;

  UserModel({
    this.id = '',
    this.image = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.phone = '',
    this.governorate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      image: json['image'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      governorate: json['governorate'] != null
          ? Governorate.fromJson(json['governorate'])
          : null,
    );
  }

  @override
  List<Object?> get props => [
        id,
      ];
}
