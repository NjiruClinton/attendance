import 'package:flutter/material.dart';


class InputField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  const InputField({super.key,  required this.hintText, required this.controller});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isHidden=true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.hintText=="Password"?isHidden:false,
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon:widget.hintText=="Password"? IconButton(
          onPressed: (){
            setState(() {
              isHidden =!isHidden;
            });
          },
          icon: Icon(isHidden? Icons.remove_red_eye_rounded:Icons.password),
          ):null,
        fillColor: Colors.grey.shade100,
        filled: true,
        hintText:widget.hintText,
        border: OutlineInputBorder(
          borderRadius:BorderRadius.circular(15)
        )
      )
    );
  }
}