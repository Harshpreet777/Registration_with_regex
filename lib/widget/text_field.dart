import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  final String hinttext;
  final IconData images;
  final IconData? suffixImages;
  // final FormFieldValidator validator;
  final bool obscuretext;
  final TextEditingController controller;
  Function? onChange;
  Color? errorColor;
  Color? focusedBorder;
  
  // bool passVisible = true;
  // bool confirmPassVisible = false;
  VoidCallback? onhideShowButton;

  TextFieldWidget(
      {super.key,
      required this.hinttext,
      required this.images,
      // required this.validator,
      required this.obscuretext,
      required this.controller,
      this.suffixImages,
      this.onChange,
      this.errorColor,
      this.onhideShowButton,
      this.focusedBorder,
      });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(7),
      color: Colors.blue,
      child: TextFormField(
        cursorColor: Colors.white,
        controller: controller,
        obscureText: obscuretext,
        style: const TextStyle(color: Colors.white),
        onChanged: (value) {
          if (onChange != null) {
            onChange!(value);
          }
        },
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: errorColor ?? Colors.transparent)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: focusedBorder ?? Colors.transparent)),
            errorStyle: const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
            prefixIcon: Icon(images),
            prefixIconColor: Colors.white,
            suffixIcon: IconButton(onPressed: onhideShowButton, icon: Icon(suffixImages)),
            suffixIconColor: Colors.white,
            hintText: hinttext,
            hintStyle: const TextStyle(color: Colors.white),
            fillColor: Colors.blue,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
