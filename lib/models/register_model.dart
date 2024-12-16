class RegisterModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String governorateId;
  final String password;
  final String confirmPassword;

  RegisterModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.governorateId,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['governorate'] = governorateId;
    data['password'] = password;
    data['confirmPassword'] = confirmPassword;
    return data;
  }
}
