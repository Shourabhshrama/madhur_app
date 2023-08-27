
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:madhur_app/core/constant/constant.dart';
import 'package:madhur_app/data/remote/api_service.dart';
import 'package:madhur_app/data/repositories/AuthenticationRepository.dart';
import 'package:madhur_app/data/repositories/LocationRespository.dart';
import 'package:madhur_app/domain/repositories/AuthenticationRepositoryImpl.dart';
import 'package:madhur_app/domain/repositories/LocationRepositoryImp.dart';
import 'package:madhur_app/domain/usecases/imp/AuthenticateUserImpl.dart';
import 'package:madhur_app/domain/usecases/imp/location_usecase_imp.dart';
import 'package:madhur_app/domain/usecases/location_usecase.dart';
import 'package:madhur_app/presentation/bloc/AuthBloc/AuthenticationBloc.dart';
import 'package:madhur_app/presentation/bloc/changePassBloc/ChangePassBloc.dart';
import 'package:madhur_app/presentation/bloc/connectivityBloc/connectivity_bloc.dart';
import 'package:madhur_app/presentation/bloc/connectivityBloc/connectivity_state.dart';
import 'package:madhur_app/presentation/bloc/locationBloc/LocationBloc.dart';
import 'package:madhur_app/presentation/bloc/resetPassBloc/ResetPassBloc.dart';
import 'package:madhur_app/presentation/pages/Splash.dart';
import 'package:madhur_app/presentation/pages/no_intenet_screen.dart';
import 'package:provider/provider.dart';
import 'data/session/SessionManager.dart';
import 'domain/usecases/AuthenticateUser.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SessionManager().init();
  final GetIt locator = GetIt.instance;
  setupDependency(locator);
  runApp(MultiProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(
                authenticateUser: locator<AuthenticateUser>())),
        BlocProvider<ConnectivityBloc>(create: (context) => ConnectivityBloc()),
        BlocProvider<ChangePassBloc>(
            create: (context) => ChangePassBloc(
                authenticateUser: GetIt.instance<AuthenticateUser>())),
        BlocProvider<ResetPassWordBloc>(
            create: (context) => ResetPassWordBloc(
                authenticateUser: locator<AuthenticateUser>())),
        BlocProvider<StateBloc>(
            create: (context) =>
                StateBloc(useCase: locator<LocationUseCase>()))
      ],
      builder: (context, child) {
        return MaterialApp(
          home: MyApp(),
          title: "madhur_app",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(),
        );
      }));
}

setupDependency(GetIt locator) {

  locator
      .registerSingleton<ApiService>(ApiService(baseUrl: BASE_URL));

  locator.registerSingleton<AuthenticationRepository>(
      AuthenticationRepositoryImpl(apiService: locator<ApiService>()));
  locator.registerSingleton<AuthenticateUser>(AuthenticateUserImpl(
      authenticationRepository: locator<AuthenticationRepository>()));

  locator.registerSingleton<LocationRepository>(
      LocationRepositoryImp(apiService: locator<ApiService>()));
  locator.registerSingleton<LocationUseCase>(
      LocationUseCaseImp(repository: locator<LocationRepository>()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
        builder: (context, state) {
      if (state is ConnectivityAvailableState) {
        return SplashScreen();
      } else {
        return NoInternetScreen();
      }
    });
  }
}
