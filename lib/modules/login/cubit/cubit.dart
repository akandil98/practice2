import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice2/models/login_model.dart';
import 'package:practice2/modules/login/cubit/states.dart';
import 'package:practice2/shared/network/end_points.dart';
import 'package:practice2/shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  late LoginModel loginModel;

  void userLogin({
    required email,
    required password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: login,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      if (kDebugMode) {
        print(value.data);
      }
      loginModel = LoginModel.fromJson(value.data);
      if (kDebugMode) {
        print('status: ${loginModel.status}');
        print('message: ${loginModel.message}');
        print('token: ${loginModel.data?.token}');
        print('name: ${loginModel.data?.name}');
        print('email: ${loginModel.data?.email}');
        print('id: ${loginModel.data?.id}');
      }
      emit(LoginSuccessState(loginModel));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibilityState());
  }
}
