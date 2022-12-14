import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice2/layout/cubit/states.dart';
import 'package:practice2/models/login_model.dart';
import 'package:practice2/modules/screen_four/screen_four.dart';
import 'package:practice2/modules/screen_one/screen_one.dart';
import 'package:practice2/modules/screen_three/screen_three.dart';
import 'package:practice2/modules/screen_two/screen_two.dart';
import 'package:practice2/shared/components/constants.dart';
import 'package:practice2/shared/network/end_points.dart';
import 'package:practice2/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    const ScreenOne(),
    const ScreenTwo(),
    const ScreenThree(),
    ScreenFour(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }

  late LoginModel userModel;

  void getUserData() {
    emit(AppLoadingUserDataState());

    DioHelper.getData(
      url: profile,
      token: token,
    ).then((value) {
      userModel = LoginModel.fromJson(value.data);
      if (kDebugMode) {
        print(userModel.data?.name);
      }

      emit(AppSuccessUserDataState(userModel));
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(AppErrorUserDataState());
    });
  }

  void updateUserData({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(AppLoadingUpdateUserState());

    DioHelper.putData(
      url: updateProfile,
      token: token,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value) {
      userModel = LoginModel.fromJson(value.data);

      if (kDebugMode) {
        print(userModel.data?.name);
      }

      emit(AppSuccessUpdateUserState(userModel));
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(AppErrorUpdateUserState());
    });
  }
}
