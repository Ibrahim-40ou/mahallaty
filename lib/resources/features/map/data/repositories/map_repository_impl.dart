import 'package:mahallaty/resources/core/utils/result.dart';
import 'package:mahallaty/resources/features/map/data/datasources/map_datasource.dart';
import 'package:mahallaty/resources/features/map/domain/repositories/map_repository.dart';

class MapRepositoryImpl implements MapRepository {
  final MapDatasource mapDatasource;

  MapRepositoryImpl({required this.mapDatasource});

  @override
  Future<Result<void>> fetchPlaces(String placeName) async {
    return await mapDatasource.fetchPlaces(placeName);
  }

  @override
  Future<Result<void>> fetchLatLng(String placeID) async {
    return await mapDatasource.fetchLatLng(placeID);
  }
}
