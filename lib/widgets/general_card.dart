import 'package:flutter/material.dart';
import 'package:flutter_iems/helpers/constants.dart';
class GeneralCard extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;
  const GeneralCard({
    Key? key,
    required this.title,
    required this.image,
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
      leading: IconButton(
        onPressed: () {},
        icon: Image.asset(image),
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
