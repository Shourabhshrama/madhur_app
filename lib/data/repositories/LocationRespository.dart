import 'package:madhur_app/data/model/CityResponse.dart';
import 'package:madhur_app/data/model/CountryResponse.dart';
import 'package:madhur_app/data/model/StateResponse.dart';
import 'package:madhur_app/data/model/VillageResponse.dart';

abstract class LocationRepository {
  Future<CountryResponse> getCountry();

  Future<StateResponse> getState();

  Future<CityResponse> getCity();

  Future<VillageResponse> getVillage();
}
