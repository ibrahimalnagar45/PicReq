import 'package:flutter/material.dart';
import 'package:picreqapplication/features/auth/data/models/user_model.dart';

import 'custom_field.dart';
import 'text_feild.dart';

class UserNameSection extends StatelessWidget {
  const UserNameSection({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Field(field: "Full name"),
        CustomTextField(
          hinttext: "your name",
          icon: Icons.abc_rounded,
          onchanged: (data) {
            user.userName = data;
          },
          validator: (data) {
            if (data!.isEmpty || data == "") {
              return "required feild";
            } else if (data.length < 3) {
              return "the name must be more than 3 letters";
            } else {
              return null;
            }
          },
          label: "Full name",
        )
      ],
    );
  }
}
