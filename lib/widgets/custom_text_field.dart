import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?) validator;
  final bool obscureText;
  final void Function(String?)? onSaved;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.validator,
    this.obscureText = false,
    this.onSaved,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}


class _CustomTextFieldState extends State<CustomTextField> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            labelText: widget.labelText,
            border: const OutlineInputBorder(),
            suffixIcon: widget.obscureText ? GestureDetector(
              onTap: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
              child: Icon(
                _showPassword ? Icons.visibility : Icons.visibility_off,
              ),
            ) : null,
          ),
          obscureText: !_showPassword && widget.obscureText,
          validator: widget.validator,
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}