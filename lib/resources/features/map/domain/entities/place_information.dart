import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mahallaty/resources/features/map/domain/entities/place_entity.dart';

class PlaceInformation {
  final PlaceEntity place;
  final LatLng coordinates;

  PlaceInformation({required this.place, required this.coordinates});
}
