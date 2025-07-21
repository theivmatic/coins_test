import 'package:coin_cap_test/src/core/di/service_locator.dart';
import 'package:coin_cap_test/src/core/observers/bloc_observer.dart';
import 'package:coin_cap_test/src/feature/coins/domain/bloc/coins_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // Initialize
  WidgetsFlutterBinding.ensureInitialized();

  // Orientation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // BLoC
  Bloc.observer = AppBlocObserver();

  await setupLocator();

  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => CoinsBloc(getIt()))],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
