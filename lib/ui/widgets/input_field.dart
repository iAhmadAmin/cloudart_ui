import 'package:cloudart/ui/constants/size_config.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isPassField;
  final bool isShortFiedl;

  InputField({this.hint, this.controller, this.isPassField, this.isShortFiedl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isShortFiedl != null
          ? EdgeInsets.only()
          : EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5),
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 7),
      height: 55,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white30),
          color: Colors.white24,
          borderRadius: BorderRadius.circular(40.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: controller,
            obscureText: isPassField != null ? true : false,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16.0),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white10,
                  width: 0,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white10,
                  width: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
