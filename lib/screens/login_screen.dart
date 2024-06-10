import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../constants/regex.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _submitted = false;

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }

    if (!maxAndMinSymbolsRegex.hasMatch(value)) {
      return 'Password must be 8-64 characters long';
    }

    if (!atLeastOneUppercaseRegex.hasMatch(value)) {
      return 'At least one uppercase letter';
    }

    if (!atLeastOnNumberRegex.hasMatch(value)) {
      return 'At least one number';
    }

    if (value.contains(' ')) {
      return 'No spaces';
    }

    return null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: _submitted
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Column(
            children: [
              CustomTextField(
                controller: _emailController,
                labelText: 'Email',
                validator: _validateEmail,
              ),
              CustomTextField(
                controller: _passwordController,
                labelText: 'Password',
                validator: _validatePassword,
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _submitted = true;
                  });
                  if (_formKey.currentState?.validate() ?? false) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Congratulations'),
                          content: const Text('Your have successfully signed up'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}