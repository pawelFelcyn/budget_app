import 'package:budget_app/presentation/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RegisterPage extends StatelessWidget{
  final RegisterController _controller = RegisterController();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: Colors.green,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SizedBox(
          width: 300,
          child: 
          Column(children: [
            const SizedBox(height: 20,),
            const Text('Enter your registration data:',
            style: TextStyle(
              color: Colors.green,
              fontSize: 15
            ),),
            const SizedBox(height: 20,),
            // const TextField(
            //       decoration: InputDecoration(
            //         hintText: 'Name',
            //         border: OutlineInputBorder(),
            //         focusedBorder: OutlineInputBorder(
            //           borderSide: BorderSide(
            //             color: Colors.green,
            //             width: 1.5
            //           )
            //         )
            //       ),
            //     ),
            // const SizedBox(height: 10,),
            TextField(
              onChanged: ((value) {
                    _controller.dto.value.email = value;
              }),
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
            // const TextField(
            //       obscureText: true,
            //       decoration: InputDecoration(
            //         hintText: 'Confirm password',
            //         border: OutlineInputBorder(),
            //         focusedBorder: OutlineInputBorder(
            //           borderSide: BorderSide(
            //             color: Colors.green,
            //             width: 1.5
            //           )
            //         )
            //       ),
            //     ),
            // const SizedBox(height: 10,),
            Row(
                  children: [
                    Expanded(
                      child: TextButton(
                      onPressed: _controller.register,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                        overlayColor: MaterialStateProperty.all<Color>(Colors.lightGreen),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(color: Colors.green)
                          )
                        )
                      ), 
                      child: const Text('Sign up',
                      style: TextStyle(color: Colors.white),),),
                    )
                  ],
                ),
          ]),
        )
      ]),
    );
  }
}