import 'package:dartz/dartz.dart';
import 'package:madhur_app/data/model/CityResponse.dart';
import 'package:madhur_app/data/model/CountryResponse.dart';
import 'package:madhur_app/data/model/StateResponse.dart';
import 'package:madhur_app/data/model/VillageResponse.dart';
import 'package:madhur_app/data/repositories/LocationRespository.dart';
import 'package:madhur_app/domain/usecases/location_usecase.dart';

class LocationUseCaseImp extends LocationUseCase {
  final LocationRepository repository;

  LocationUseCaseImp({required this.repository});


  @override
  Future<Either<Exception, CountryResponse>> getAllCountry() async {
    try {
      final country = await repository.getCountry();
      return Right(country);
    } catch (e) {
      return Left(e as Exception);
    }
  }

  @override
  Future<Either<Exception, StateResponse>> getAllState() async {
    try {
      final state = await repository.getState();
      return Right(state);
    } catch (e) {
      return Left(e as Exception);
    }
  }

  @override
  Future<Either<Exception, VillageResponse>> getAllVillage() async {
    try {
      final village = await repository.getVillage();
      return Right(village);
    } catch (e) {
      return Left(e as Exception);
    }
  }



  @override
  Future<Either<Exception, CityResponse>> getAllCity() async {
    try {
      final city = await repository.getCity();
      return Right(city);
    } catch (e) {
      return Left(e as Exception);
    }
  }
}
