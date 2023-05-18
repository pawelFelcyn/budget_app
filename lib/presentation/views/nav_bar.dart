import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../controllers/nav_bar_controller.dart';
import '../utils/styles.dart';

class NavBar extends StatelessWidget {
  final NavBarController _controller = NavBarController();

  NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 100,),
                    TextButton(
                      style: Styles.flyoutActionButtonStyle,
                      onPressed: (){}, 
                      child: const Text('My expenses'))
                  ],
                ),
              ),),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextButton(
                          onPressed: _controller.logout,
                          style: Styles.primaryButtonStyle,
                          child: const Text('Sign out',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ]
                ),
              ),
            ))
        ],))
    );
  }
}