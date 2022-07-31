import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../forms/input_decoration.dart';
import '../providers/providers.dart';
import '../theme/mytheme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String routerName = 'login';
  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(image: AssetImage(imgLogoApp)),
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecorations.loginInputDecoration(
                'luis.mayta@gmail.com',
                'Correo Electronico',
                Colors.purple,
                Icons.person),
            onChanged: (value) => email = value,
          ),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Colors.black),
              obscureText: true,
              decoration: InputDecorations.loginInputDecoration('****',
                  'Contraseña', Colors.purple, Icons.lock_clock_outlined),
              onChanged: (value) => password = value),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            disabledColor: Colors.grey,
            color: Colors.purple,
            onPressed: () async {
              if (email.isNotEmpty) {
                final String? resp = await loginProvider.login(email, password);
                if (resp == 'se guardo token') {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, 'home');
                }
              }
            },
            child: const Text(
              'INGRESAR',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
