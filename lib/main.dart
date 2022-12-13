import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice2/layout/app_layout.dart';
import 'package:practice2/modules/login/login_screen.dart';
import 'package:practice2/modules/on_boarding/on_boarding_screen.dart';
import 'package:practice2/shared/bloc_observer.dart';
import 'package:practice2/shared/network/local/cache_helper.dart';
import 'package:practice2/shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  Widget widget;

  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  String? token = await CacheHelper.getData(key: 'token');

  if (kDebugMode) {
    print('Token: $token');
  }

  if (onBoarding != null) {
    if (token != null) {
      widget = const AppLayout();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = const OnBoardingScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;

  const MyApp({
    super.key,
    this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: startWidget,
    );
  }
}
