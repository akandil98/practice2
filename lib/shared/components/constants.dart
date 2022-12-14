import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:practice2/modules/login/login_screen.dart';
import 'package:practice2/shared/components/componants.dart';
import 'package:practice2/shared/network/local/cache_helper.dart';

String token = '';

void signOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      navigateAndFinish(context, LoginScreen());
      if (kDebugMode) {
        print('Logged out successfully');
      }
    }
  });
}
