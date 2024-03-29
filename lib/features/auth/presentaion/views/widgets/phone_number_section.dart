import 'package:flutter/material.dart';
import 'package:picreqapplication/features/auth/data/models/user_model.dart';

import 'custom_field.dart';
import 'text_feild.dart';

class PhoneNumberSection extends StatelessWidget {
  const PhoneNumberSection({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Field(field: "Phone number"),
        CustomTextField(
          hinttext: "01012345678",
          icon: Icons.phone_iphone,
          onchanged: (data) {
            user.phoneNumber = data;
          },
          validator: (data) {
            if (data!.isEmpty || data == "") {
              return "required feild";
            } else if (data.length != 11) {
              return 'Mobile Number must be of 10 digit';
            } else if (data.isEmpty) {
              return "required feild";
            } else {
              return null;
            }
          },
          label: "Phone number",
        ),
      ],
    );
  }
}
