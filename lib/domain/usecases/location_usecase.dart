import 'package:dartz/dartz.dart';
import 'package:madhur_app/data/model/CityResponse.dart';
import 'package:madhur_app/data/model/CountryResponse.dart';
import 'package:madhur_app/data/model/StateResponse.dart';
import 'package:madhur_app/data/model/VillageResponse.dart';

abstract class LocationUseCase {
  Future<Either<Exception, CountryResponse>> getAllCountry();

  Future<Either<Exception, StateResponse>> getAllState();

  Future<Either<Exception, CityResponse>> getAllCity();

  Future<Either<Exception, VillageResponse>> getAllVillage();


  // Future<Either<Exception, VillageResponse>> getDashBoardDetail();



}
