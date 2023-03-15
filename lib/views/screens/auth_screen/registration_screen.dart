// ignore_for_file: avoid_print

import 'package:fakestore/controller/auth_controller.dart';
import 'package:fakestore/views/screens/auth_screen/login_screen.dart';
import 'package:fakestore/views/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final AuthController authCtrl = Get.put(AuthController());
    return Scaffold(
      body: SizedBox(
        height: _height,
        width: _width,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Form(
            key: authCtrl.formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: _height / 5,
                  ),
                  const Text(
                    "Registration",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    labelText: "Name",
                    hintText: "John Snow",
                    controller: authCtrl.nameCtrl,
                  ),
                  CustomTextField(
                    labelText: "Email",
                    hintText: "example@email.com",
                    controller: authCtrl.emailCtrl,
                  ),
                  Obx(
                    () => CustomTextField(
                      labelText: "Password",
                      hintText: "********",
                      controller: authCtrl.passCtrl,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: authCtrl.isObsecurePass.value,
                      suffixIcon: IconButton(
                          onPressed: () {
                            authCtrl.changePasswordVisibility();
                          },
                          icon: Icon(authCtrl.isObsecurePass.value
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      autofillHints: const [AutofillHints.password],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                      // if (validateAndSave(_formKey)) {
                      //   _registerUser();
                      // }
                    },
                    child: const Text(
                      "Create",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offAll(const LoginScreen());
                    },
                    child: const Text(
                      "Already Have an Account?",
                      style: TextStyle(
                        fontSize: 20,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
