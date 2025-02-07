// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';

import '../../core/core/entities/_entities.dart';

class Location extends Equatable implements LocationEntity {
  @override
  late final int id;

  @override
  late final String location;

  @override
  late final String zone;

  Location({
    required this.id,
    required this.location,
    required this.zone,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      location: json['localizacao'],
      zone: json['zona'],
    );
  }

  @override
  List<Object?> get props => [id, location, zone];
}
