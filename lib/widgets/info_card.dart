import 'package:flutter/material.dart';

import 'package:flutter_iems/helpers/constants.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const InfoCard({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      trailing: const Icon(
        Icons.navigate_next,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: kTitleTextstyle.copyWith(
          color: black.withOpacity(0.86),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
