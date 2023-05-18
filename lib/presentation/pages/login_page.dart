import 'package:budget_app/presentation/controllers/login_controller.dart';
import 'package:flutter/material.dart';

import '../utils/styles.dart';

class LoginPage extends StatelessWidget{
  final LoginController _controller = LoginController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (value){
                    _controller.dto.value.email = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 1.5
                      )
                    )
                  ),
                ),
                const SizedBox(height: 10,),
                TextField(
                  onChanged: (value){
                    _controller.dto.value.password = value;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 1.5
                      )
                    )
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(  
                      onPressed: _controller.login,
                      style: Styles.primaryButtonStyle, 
                      child: const Text('Sign in',
                      style: TextStyle(color: Colors.white),),),
                    )
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                      onPressed: _controller.goToRegistration,
                      style: Styles.secondaryButtonStyle, 
                      child: const Text('Sign up',
                      style: TextStyle(color: Colors.green),),),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      )
    );
  }

}