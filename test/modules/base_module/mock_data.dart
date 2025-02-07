import 'dart:convert';

import 'package:app/_shared/_shared.dart';

var mockLocationsModel = [
  Location(
    id: 0,
    location: 'locationA',
    zone: 'zoneA',
  ),
  Location(
    id: 1,
    location: 'locationB',
    zone: 'zoneA',  
  ),
  Location(
    id: 2,
    location: 'locationA',
    zone: 'zoneB',
  ),
  Location(
    id: 3,
    location: 'locationB',
    zone: 'zoneB',
  ),
];

var mockLocationJson = jsonEncode([
  {'id': 0, 'localizacao': 'locationA', 'zona': 'zoneA'},
  {'id': 1, 'localizacao': 'locationB', 'zona': 'zoneA'},
  {'id': 2, 'localizacao': 'locationA', 'zona': 'zoneB'},
  {'id': 3, 'localizacao': 'locationB', 'zona': 'zoneB'},
]);

var mockLocationsMap = {
  mockLocationsModel[0].zone: [mockLocationsModel[0], mockLocationsModel[1]],
  mockLocationsModel[2].zone: [mockLocationsModel[2], mockLocationsModel[3]],
};
