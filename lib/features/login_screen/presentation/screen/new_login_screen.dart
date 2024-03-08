import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:apibinding_project_steps/features/login_screen/login_screen_controller.dart';

class NewLoginScreen extends StatefulWidget {
  const NewLoginScreen({super.key}) ;

  @override
  _NewLoginScreenState createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<NewLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginController>(
      create: (context) => LoginController(context),
      child: Consumer<LoginController>(
        builder: (context, data, child) {
          return Scaffold(
            body: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: data.usernameControllar,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User ID',
                      hintText: 'Enter User ID',
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    controller: data.passwordControllar,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter Password',
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      data.onLoginSuccess(context);
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}




// import 'package:apibinding_project_steps/features/login_screen/login_screen_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import 'package:provider/provider.dart';
//
// class NewLoginScreen extends StatefulWidget {
//   const NewLoginScreen({super.key});
//
//   @override
//   _NewLoginScreenState createState() => _NewLoginScreenState();
// }
//
// class _NewLoginScreenState extends State<NewLoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return    ChangeNotifierProvider<LoginController>(
//       create: (context) => LoginController(context),
//       child: Consumer<LoginController>(
//         builder: (context, data, child) {
//           return Scaffold(
//             body: Container(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   TextField(
//                      controller: data.usernameControllar,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'user id',
//                         hintText: 'Enter user id'),
//                   ),
//                   TextField(
//                     controller: data.passwordControllar,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Password',
//                         hintText: 'Enter password'),
//                   ),
//                   Center(
//                     child: ElevatedButton(onPressed: () {
//                         data.onLoginSuccess(context);
//                     }, child: Text('Login')),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//
//
//
//   }
// }
//
//
