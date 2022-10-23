import 'package:flutter/material.dart';
import 'package:flutter_iems/helpers/constants.dart';
import 'package:flutter_iems/widgets/common/my_appbar.dart';
import 'package:flutter_iems/widgets/common/my_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      drawer: MyDrawer(),
      appBar: MyAppBar(),
      
    );
  }
}