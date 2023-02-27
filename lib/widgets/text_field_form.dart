import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPasswd;
  final String hintText;
  final TextInputType textInputType;
   const TextFieldInput({super.key, required this.textEditingController, this.isPasswd=false, required this.hintText, required this.textInputType});

  @override
  Widget build(BuildContext context) {
    final inputBorder=OutlineInputBorder(
          borderSide: Divider.createBorderSide(context)
        );
    return TextField(
      controller:textEditingController ,
      decoration: InputDecoration(
        hintText: hintText,
        border:inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        filled: true,
        contentPadding: EdgeInsets.all(8)
      ),
      keyboardType:textInputType ,
      obscureText:isPasswd ,
    );
  }
}