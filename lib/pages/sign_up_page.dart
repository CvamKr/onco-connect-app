import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onco_app/controllers/auth_controller.dart';
import 'package:onco_app/pages/login_page.dart';
import 'package:onco_app/widgets/my_text_form_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final bool checkValue = false;
  final _formkey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("O N C O"),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 750) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: signup(),
            );
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.35),
              child: signup(),
            );
          }
        },
      ),
    );
  }

  Widget signup() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "Sign Up",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "Create an account and get started",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                MyTextFormfield(
                  controller: usernameController,
                  text: "Username",
                  validator: (txt) {
                    var nonNullValue = txt ?? '';
                    if (nonNullValue.isEmpty) {
                      return ("Username is required");
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextFormfield(
                  controller: passwordController,
                  text: "Password",
                  validator: (txt) {
                    if (txt == null || txt.isEmpty) {
                      return "Password Required";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextFormfield(
                  text: "Email",
                  controller: emailController,
                  validator: ((txt) {
                    var nonNullValue = txt ?? '';
                    if (nonNullValue.isEmpty) {
                      return "Enter Email";
                    } else if (RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                        .hasMatch(nonNullValue)) {
                      return null;
                    } else {
                      return "Enter valid email";
                    }
                  }),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextFormfield(
                  text: "Phone Number",
                  controller: phoneNoController,
                  validator: ((txt) {
                    var nonNullValue = txt ?? '';
                    if (nonNullValue.isEmpty) {
                      return "Enter Phone No";
                    }
                    if (nonNullValue.length != 10) {
                      return "Length should be 10";
                    }
                  }),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      child: Checkbox(
                        value: checkValue,
                        onChanged: (checkValue) {
                          checkValue = true;
                        },
                      ),
                    ),
                    const Text(
                      "Agree to terms & conditions",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        Get.find<AuthController>().signUp(
                            emailController.text,
                            passwordController.text,
                            usernameController.text,
                            phoneNoController.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                    ),
                    child: const Text("Create Account",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0)),
                        onPressed: () {
                          Get.to(() => LoginPage());
                        },
                        child: const Text(
                          "Log in",
                          style: TextStyle(color: Colors.orange, fontSize: 15),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
