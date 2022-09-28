import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear/presentations/screens/login_screen.dart';

import '../../constants/enums.dart';
import '../../logics/blocs/auth/auth_bloc.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String id = 'splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.authStatus == AuthStatus.unauthanticated) {
          Navigator.pushReplacementNamed(context, LoginScreen.id);
        } else if (state.authStatus == AuthStatus.authenticated) {
          Navigator.pushReplacementNamed(context, HomeScreen.id);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xFF3B4254),
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
