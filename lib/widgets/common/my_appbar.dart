import 'package:flutter/material.dart';
import 'package:flutter_iems/helpers/constants.dart';

class MyAppBar extends StatelessWidget  with PreferredSizeWidget{
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar( 
        title: const Text("This is title"),
        centerTitle: true,
        elevation: 0,
        actions: [
          PopupMenuButton(
            padding: const EdgeInsets.all(0),
            iconSize: 25,
            icon: const Icon(
              Icons.more_vert_outlined,
              color: Colors.black,
            ),
            elevation: 0,
            itemBuilder: (context) => [
              PopupMenuItem(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.call_outlined, color: black,),
                    const SizedBox(width: 4,),
                    const Text(
                      "HelpLine",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ),
              PopupMenuItem(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                value: 2,
                child: Row(
                  children: [
                    Icon(Icons.logout, color: black,),
                    const SizedBox(width: 4,),
                    const Text(
                      "Logout",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}