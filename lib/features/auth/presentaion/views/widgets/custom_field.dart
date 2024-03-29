import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class Field extends StatelessWidget {
  const Field({
    super.key,
    required this.field,
    this.fontsize = kPimaryFontSize,
  });
  final String field;
  final double fontsize;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: kPrimaryPadding, bottom: 10),
      child: Text(
        field,
        style: TextStyle(
          fontSize: fontsize,
          color: Colors.black.withOpacity(.9),
        ),
      ),
    );
  }
}
