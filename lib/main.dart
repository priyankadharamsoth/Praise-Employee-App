import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/app_bootstrapper.dart';
import 'core/configs/http_config.dart';
import 'core/logger/riverpod_observer_log.dart';
import 'data/data_service_providers.dart';
import 'presentation/ui/app.dart';

Future<void> main() async {
  final container = ProviderContainer();
  final loggerService = container.read(loggerServiceProvider);
  HttpOverrides.global = CustomHttpOverrides();
  runZonedGuarded(() async {
    await AppBootStrapper.initialize();
    runApp(
      ProviderScope(
        observers: [
          RiverpodObserverLog(loggerService),
        ],
        child: const App(),
      ),
    );
  }, (ex, s) {
    loggerService.errorLog(ex, s);
  });
}
