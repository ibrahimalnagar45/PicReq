import 'package:flutter/material.dart';
import 'package:picreqapplication/features/auth/data/models/user_model.dart';
import 'custom_field.dart';
import 'text_feild.dart';

class PasswordSection extends StatelessWidget {
  const PasswordSection({
    super.key,
    required this.user,
  });

  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Field(field: "Password"),
        CustomTextField(
          obscureText: true,
          icon: Icons.security_outlined,
          onchanged: (data) {
            user.password = data;
          },
          validator: (data) {
            if (data!.isEmpty) {
              return "required feild";
            } else if (data.length < 8) {
              return "the password must be more than 8 letters ";
            } else if (!data.contains('@') ||
                !data.contains('*') ||
                !data.contains('_') ||
                !data.contains('#') ||
                !data.contains('\$')) {
              return "weak password the password must contain _ or special sing as # or * ";
            } else {
              return null;
            }
          },
          label: "Password",
        ),
      ],
    );
  }
}
