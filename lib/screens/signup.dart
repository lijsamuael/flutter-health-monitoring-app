import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health/main.dart';
import 'package:health/screens/Login.dart';

import '../service/authentication.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final fullNameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Future signup() async {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            )
            .then((value) => { 
           emailController.clear(),
           passwordController.clear(),
           phoneNumberController.clear(),
           fullNameController.clear()

            });
      } on FirebaseAuthException catch (e) {
        print(e);
      }
    }
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: size.height,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bK/img6.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.8,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 200, 175, 224),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextField(
                    controller: fullNameController,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.person),
                      border: InputBorder.none,
                      labelText: 'Full Name',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: size.width * 0.8,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 200, 175, 224),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    controller: emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? 'Enter a valid email!'
                            : null,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.email),
                      border: InputBorder.none,
                      labelText: 'Email',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: size.width * 0.8,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 200, 175, 224),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextField(
                    controller: phoneNumberController,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      prefixIcon: Icon(FontAwesomeIcons.phone),
                      border: InputBorder.none,
                      labelText: 'Phone number',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: size.width * 0.8,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 200, 175, 224),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      prefixIcon: Icon(FontAwesomeIcons.lockOpen),
                      suffixIcon: Icon(FontAwesomeIcons.solidEye),
                      border: InputBorder.none,
                      labelText: 'Password',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: size.width * 0.8,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 200, 175, 224),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextButton(
                    onPressed: signup,
                    child: const Text(
                      "Signup",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Have an account?",
                      style: TextStyle(),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: const Text("Login"),
                    ),
                  ],
                ),
                // const SizedBox(
                //   height: 50,
                // ),
                // const Text(
                //   "Or Connect with",
                //   style: TextStyle(
                //       fontSize: 16,
                //       fontWeight: FontWeight.w600,
                //       color: Colors.black),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Flexible(
                //       child: FloatingActionButton.extended(
                //         label: const Text('Google'), // <-- Text
                //         backgroundColor:
                //             const Color.fromARGB(255, 200, 175, 224),
                //         icon: const Icon(
                //           FontAwesomeIcons.google,
                //           size: 24.0,
                //         ),
                //         onPressed: () {},
                //       ),
                //     ),
                //     Flexible(
                //       child: FloatingActionButton.extended(
                //         label: const Text('Github'),
                //         backgroundColor:
                //             const Color.fromARGB(255, 200, 175, 224),
                //         icon: const Icon(
                //           FontAwesomeIcons.github,
                //           size: 24.0,
                //         ),
                //         onPressed: () {},
                //       ),
                //     ),
                //     Flexible(
                //       child: FloatingActionButton.extended(
                //         label: const Text('Facebook'), // <-- Text
                //         backgroundColor:
                //             const Color.fromARGB(255, 200, 175, 224),
                //         icon: const Icon(
                //           FontAwesomeIcons.facebook,
                //           size: 24.0,
                //         ),
                //         onPressed: () {},
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ) /* add child content here */,
        ),
      ),
    );
  }
}
