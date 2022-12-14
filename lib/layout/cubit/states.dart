import 'package:practice2/models/login_model.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeBottomNavState extends AppStates {}

class AppLoadingUserDataState extends AppStates {}

class AppSuccessUserDataState extends AppStates {
  final LoginModel? loginModel;

  AppSuccessUserDataState(this.loginModel);
}

class AppErrorUserDataState extends AppStates {}

class AppLoadingUpdateUserState extends AppStates {}

class AppSuccessUpdateUserState extends AppStates {
  final LoginModel? loginModel;

  AppSuccessUpdateUserState(this.loginModel);
}

class AppErrorUpdateUserState extends AppStates {}
