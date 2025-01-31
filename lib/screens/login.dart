import 'package:flutter/material.dart';
import 'package:klikni_popravi/screens/register.dart';
import '../services/auth_service.dart';
// import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  bool isValidEmail(String email) {
    RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
      caseSensitive: false,
    );

    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [

        ],
      )),
      body: Container(
        // color: Colors.grey.shade400,
        child: Column(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('lib/assets/images/logo.png'),
              radius: 100,
            ),
            const SizedBox(width: 50, height: 30,),
            const Text("Welcome to KlikniPopravi!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 50, height: 50,),
            Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(border: OutlineInputBorder(),
                            focusColor: Colors.green, labelText: "Enter Your Email", hintText: "Enter Email"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!isValidEmail(value)) {
                            return 'Email not valid!';
                          }
                          return null;
                        },
                      ),
                    ),

                    Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(focusColor: Colors.green,
                          border: OutlineInputBorder(), labelText: "Enter Your Password", hintText: "Enter password",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 6) {
                            return 'Password should not have less than 6 characters.';
                          }
                          return null;
                        },
                      ),
                    ),
                    Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      TextButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterPage(role: "customer"))); //TODO
                      }, child: const Text("Create customer account.")),
                      TextButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterPage(role: "partner"))); //TODO
                      }, child: const Text("Create partner account.")),
                    ]),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                      child: Center(
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await AuthService().login(emailController.text,passwordController.text, "customer", context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Please fill input')),
                              );
                            }
                          },
                          label: const Text('Login'),
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                      child: Center(
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await AuthService().login(emailController.text,passwordController.text, "partner", context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Please fill input')),
                              );
                            }
                          },
                          label: const Text('Login as partner'),
                        ),
                      ),
                    ),
                  ]),
              ),
            ),
          ]
        )
      )
    );
  }
}

