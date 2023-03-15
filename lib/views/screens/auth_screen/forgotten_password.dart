import 'package:fakestore/views/screens/auth_screen/login_screen.dart';
import 'package:flutter/material.dart';

class ForgottenPassword extends StatelessWidget {
  const ForgottenPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Password Reset"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email/Phone",
                    hintText: "example@email.com"),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: const Text("Send")),
            ],
          ),
        ));
  }
}
