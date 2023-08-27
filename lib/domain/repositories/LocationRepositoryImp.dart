import 'package:madhur_app/data/model/CityResponse.dart';
import 'package:madhur_app/data/model/CountryResponse.dart';
import 'package:madhur_app/data/model/StateResponse.dart';
import 'package:madhur_app/data/model/VillageResponse.dart';
import 'package:madhur_app/data/remote/api_service.dart';
import 'package:madhur_app/data/repositories/LocationRespository.dart';

class LocationRepositoryImp extends LocationRepository {
  final ApiService apiService;

  LocationRepositoryImp({required this.apiService});

  @override
  Future<CityResponse> getCity() async {
    CityResponse response = await apiService.getAllCity();
    return response;
  }

  @override
  Future<CountryResponse> getCountry() async {
    CountryResponse response = await apiService.getAllCountries();
    return response;
  }

  @override
  Future<StateResponse> getState() async {
    StateResponse response = await apiService.getAllStates();
    return response;
  }

  @override
  Future<VillageResponse> getVillage() async {
    VillageResponse response = await apiService.getAllVillage();
    return response;
  }
}
