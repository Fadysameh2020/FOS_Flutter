class EditProfileModel {
  final String firstName;
  final String lastName;
  final String phone;
  final String governorateId;
  final dynamic file;

  EditProfileModel({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.governorateId,
    this.file,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phone'] = phone;
    data['governorate'] = governorateId;
    if (file != null) {
      data['image'] = file;
    }
    return data;
  }
}
