import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:picreqapplication/features/auth/data/models/user_model.dart';
import 'package:picreqapplication/features/auth/presentaion/views/widgets/Use_name_section.dart';
import 'package:picreqapplication/features/auth/presentaion/views/widgets/email_section.dart';
import 'package:picreqapplication/features/auth/presentaion/views/widgets/password_section.dart';
import 'package:picreqapplication/features/auth/presentaion/views/widgets/phone_number_section.dart';
import '../../../../../constants.dart';
import '../../../../../core/helper/snak_bar.dart';
import '../../../../home/presentaion/views/home_view.dart';
import 'Custom_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: CircleAvatar(
              backgroundColor: Color(0xfff8fbfb),
              radius: kPrimaryPadding * 5,
              foregroundImage: AssetImage(
                kPrimaryLogo,
              ),
            ),
          ),
          UserNameSection(user: widget.user),
          PhoneNumberSection(user: widget.user),
          EmailSection(user: widget.user),
          PasswordSection(
            user: widget.user,
          ),
          CustomButton(
            onpressed: () async {
              if (formKey.currentState!.validate()) {
                await loginUser(context);
              }
            },
            topPadding: 10,
            leftPadding: 50,
            rightPadding: 50,
            label: "LogIn",
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account ? "),
                Text(
                  "Sign up",
                  style: TextStyle(
                      color: kPrimaryColor, fontSize: kPimaryFontSize),
                )
              ],
            ),
          ),
          Divider(
            height: 8,
            thickness: 1,
            color: Colors.grey.withOpacity(.5),
            endIndent: 100,
            indent: 100,
          ),
          const Center(child: Text("or continue with :")),
          CustomButton(
            onpressed: () {
              handleSignIn();
            },
            icon: "assets/icons/Google.f863aef4d15f1498abe6f2d498cdc987.png",
            topPadding: 10,
            leftPadding: 50,
            rightPadding: 50,
          )
        ],
      ),
    );
  }

  Future<void> loginUser(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: widget.user.emialAdress!,
        password: widget.user.password!,
      );
      Navigator.pushNamed(context, HomeView.id);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnakBar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showSnakBar(context, 'Wrong password provided for that user.');
      }
    }
  }
}

Future<void> handleSignIn() async {
  try {
    await googleSignIn.signIn();
  } catch (error) {
    debugPrint('$error');
  }
}

GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);
