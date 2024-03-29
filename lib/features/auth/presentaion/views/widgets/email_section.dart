import 'package:flutter/material.dart';
import 'package:picreqapplication/features/auth/data/models/user_model.dart';

import 'custom_field.dart';
import 'text_feild.dart';

class EmailSection extends StatelessWidget {
  const EmailSection({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Field(field: "Emial"),
        CustomTextField(
          hinttext: "username@gmial.com",
          icon: Icons.email,
          onchanged: (data) {
            user.emialAdress = data;
          },
          validator: (data) {
            if (data!.isEmpty || data == "") {
              return "required feild";
            }
            String pattern =
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            RegExp regex = RegExp(pattern);
            if (!regex.hasMatch(data)) {
              return 'Enter Valid Email';
            } else {
              return null;
            }
          },
          label: "Email adress",
        ),
      ],
    );
  }
}
