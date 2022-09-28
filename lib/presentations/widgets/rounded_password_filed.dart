import 'package:flutter/material.dart';

class RoundedPasswordFiled extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;
  const RoundedPasswordFiled(
      {Key? key, required this.onChanged, required this.validator})
      : super(key: key);

  @override
  State<RoundedPasswordFiled> createState() => _RoundedPasswordFiledState();
}

class _RoundedPasswordFiledState extends State<RoundedPasswordFiled> {
  bool obscurText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscurText,
      decoration: InputDecoration(
        filled: true,
        prefixIcon: Icon(
          Icons.lock_outlined,
          color: Colors.white,
        ),
        suffixIcon: IconButton(
          splashColor: Colors.transparent,
          onPressed: () {
            setState(() {
              obscurText = !obscurText;
            });
          },
          icon: obscurText == true
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
          color: Colors.white24,
        ),
        border: InputBorder.none,
        hintText: 'Mot de Passe',
        hintStyle: TextStyle(color: Colors.white24),
      ),
      onChanged: widget.onChanged,
      validator: widget.validator,
    );
  }
}
