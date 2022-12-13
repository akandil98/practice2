import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:practice2/modules/login/login_screen.dart';
import 'package:practice2/shared/components/componants.dart';
import 'package:practice2/shared/components/constants.dart';
import 'package:practice2/shared/network/local/cache_helper.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () {
              CacheHelper.removeData(key: 'token').then((value) {
                if (value) {
                  navigateAndFinish(context, LoginScreen());
                  if (kDebugMode) {
                    print('Logged out successfully');
                  }
                }
              });
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
