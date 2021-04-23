import 'package:averia_electronics/interactor/cards/cards_interactor.dart';
import 'package:averia_electronics/interactor/cards/repository/cards_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class Injector {
  Injector() {
    getIt.registerSingleton<GlobalKey<NavigatorState>>(
      GlobalKey<NavigatorState>(),
      signalsReady: false,
    );
    getIt.registerSingleton<GlobalKey<ScaffoldState>>(
      GlobalKey<ScaffoldState>(),
      signalsReady: false,
    );
    getIt.registerSingleton<GlobalKey<ScaffoldMessengerState>>(
      GlobalKey<ScaffoldMessengerState>(),
      signalsReady: false,
    );

    getIt.registerSingletonAsync<CardsRepository>(
      () async => CardsRepository(),
    );

    getIt.registerSingletonWithDependencies<CardsInteractor>(
      () => CardsInteractor(),
      signalsReady: false,
      dependsOn: [CardsRepository],
    );
  }
}
