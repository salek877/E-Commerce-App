// ignore_for_file: avoid_print
import 'package:fakestore/controller/auth_controller.dart';
import 'package:fakestore/views/screens/auth_screen/forgotten_password.dart';
import 'package:fakestore/views/screens/auth_screen/registration_screen.dart';
import 'package:fakestore/views/screens/home_screen/home_screen.dart';
import 'package:fakestore/views/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final AuthController authCtrl = Get.put(AuthController());
    return Scaffold(
      body: SizedBox(
        height: _height,
        width: _width,
        child: Center(
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
                    Image.asset(
                      "assets/images/wolf2.png",
                      width: 100,
                      height: 130,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      labelText: "Email",
                      hintText: "example@email.com",
                      controller: authCtrl.emailCtrl,
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [AutofillHints.email],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your e-mail address";
                        }
                        //  else if (!validateEmail(value)) {
                        //   return "Email is not valid";
                        // }
                        return null;
                      },
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
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgottenPassword()));
                          },
                          child: const Text("Forgotten Password?"),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        //TODO For Test Perpose now
                        Get.offAll(const HomeScreen());

                        // if (validateAndSave(_formKey)) {
                        //   await CustomEassyLoading().startLoading();
                        //   await _signin();
                        //   EasyLoading.dismiss();
                        // }
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.offAll(const RegistrationScreen());
                      },
                      child: const Text(
                        "Create New Account",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
