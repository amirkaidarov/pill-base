import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../home/home_page.dart';
import '../main/main_page.dart';

import '../../application/auth/auth/auth_bloc.dart';
import '../sign_in/sign_in_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const routeName = '/splash-page';

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) {
            Navigator.pushReplacementNamed(
              context,
              // MainPage.routeName,
              HomePage.routeName,
            );
          },
          unauthenticated: (_) {
            Navigator.pushReplacementNamed(
              context,
              SignInPage.routeName,
            );
          },
        );
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
