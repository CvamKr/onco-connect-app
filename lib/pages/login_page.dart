import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onco_app/controllers/auth_controller.dart';
import 'package:onco_app/pages/home_page.dart';

import '../widgets/my_text_form_field.dart';
import 'sign_up_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthController authController = Get.find<AuthController>();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("O N C O"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth <= 750) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: login(context),
              );
            } else {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.3),
                child: login(context),
              );
            }
          },
        ),
      ),
    );
  }

  Widget login(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          const Text(
            "Log in",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextFormfield(
            text: 'Email',
            controller: emailController,
            validator: (txt) {
              if (txt!.isEmpty) {
                return ("Email is required");
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 15,
          ),
          MyTextFormfield(
            text: 'Password',
            controller: passwordController,
            validator: (txt) {
              if (txt == null || txt.isEmpty) {
                return "Password Required";
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Checkbox(
                  value: false,
                  onChanged: (value) {
                    value = true;
                  }),
              const Text(
                "Don't forget me!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forget Password?",
                    style: TextStyle(color: Colors.orange),
                  )),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () async {
                if (_formkey.currentState!.validate()) {
                  authController.signIn(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
              ),
              child: Text("Log in", style: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Create an account?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextButton(
                  style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
                  onPressed: () {
                    Get.to(() => SignUpPage());
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.orange, fontSize: 15),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
