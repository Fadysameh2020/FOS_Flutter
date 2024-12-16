import 'package:equatable/equatable.dart';

class Country extends Equatable {
  final String? id;
  final String? name;

  Country({
    this.id = '',
    this.name = '',
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
    );
  }

  @override
  List<Object?> get props => [id, name];
}

class Governorate extends Equatable {
  final String? id;
  final String? name;
  final Country? country;

  Governorate({
    this.id = '',
    this.name = '',
    this.country,
  });

  factory Governorate.fromJson(Map<String, dynamic> json) {
    return Governorate(
      id: json['_id'],
      name: json['name'],
      country:
          json['country'] != null ? Country.fromJson(json['country']) : null,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
