import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Message extends StatelessWidget {
   Message({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Future signin() async {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    }

    return Scaffold(
      // extendBody: true,
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bk/img6.jpg"),
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
                  child: const TextField(
                    // controller: emailController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      prefixIcon: Icon(FontAwesomeIcons.userLock),
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
                  child: const TextField(
                    // controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      prefixIcon: Icon(FontAwesomeIcons.lockOpen),
                      suffixIcon: Icon(FontAwesomeIcons.solidEye),
                      border: InputBorder.none,
                      labelText: 'Password',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
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
                    onPressed: signin,
                    child: const Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have account ? ",
                      style: TextStyle(),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Signup"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Or Connect with",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton.extended(
                      label: const Text('Google'), // <-- Text
                      backgroundColor: const Color.fromARGB(255, 200, 175, 224),
                      icon: const Icon(
                        FontAwesomeIcons.google,
                        size: 24.0,
                      ),
                      onPressed: () {},
                    ),
                    FloatingActionButton.extended(
                      label: const Text('Github'),
                      backgroundColor: const Color.fromARGB(255, 200, 175, 224),
                      icon: const Icon(
                        FontAwesomeIcons.github,
                        size: 24.0,
                      ),
                      onPressed: () {},
                    ),
                    FloatingActionButton.extended(
                      label: const Text('Facebook'), // <-- Text
                      backgroundColor: const Color.fromARGB(255, 200, 175, 224),
                      icon: const Icon(
                        FontAwesomeIcons.facebook,
                        size: 24.0,
                      ),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ) /* add child content here */,
        ),
      ),
    );
  }
}
