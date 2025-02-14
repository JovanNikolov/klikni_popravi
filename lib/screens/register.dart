import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  final String role;
  const RegisterPage({super.key, required this.role});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
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
          Text("Register", textAlign: TextAlign.center),
        ],
      )),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //NAME
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(border: OutlineInputBorder(),
                          focusColor: Colors.green, labelText: "Name", hintText: "Enter Name"),
                    ),
                  ),
                  //EMAIL
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(border: OutlineInputBorder(),
                          focusColor: Colors.green, labelText: "Email", hintText: "Enter Email"),
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

                  //PASSWORD
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(focusColor: Colors.green, border: const OutlineInputBorder(),
                        labelText: "Password", hintText: "Enter password",
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

                  //PHONE
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: phoneController,
                      decoration: const InputDecoration(border: OutlineInputBorder(),
                          focusColor: Colors.green, labelText: "Phone", hintText: "Enter Phone"),
                    ),
                  ),

                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    TextButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
                    }, child: const Text("Already have an account? Sing In!")),
                  ]),

                  Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                    child: Center(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.check_circle_outline_sharp),
                        onPressed: () async{
                          if (_formKey.currentState!.validate()) {
                            await AuthService().register(emailController.text, passwordController.text, widget.role, context);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please fill input')),
                            );
                          }
                        },
                        label: const Text('Register'),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
