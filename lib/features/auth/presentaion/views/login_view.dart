import 'package:flutter/material.dart';
import 'package:picreqapplication/features/auth/data/models/user_model.dart';
import 'package:picreqapplication/features/auth/presentaion/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String id = "LoginView";
  // final UserModel userModel=UserModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: LoginViewBody(
        user: UserModel(),
      ),
    );
  }
}
