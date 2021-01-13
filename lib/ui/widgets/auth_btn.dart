import 'package:cloudart/ui/constants/size_config.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final Color borderClr;
  final Color btnClr;
  final Function onTap;
  final String label;
  final bool isLoading;
  final Widget loader;

  AuthButton(
      {this.borderClr,
      this.btnClr,
      this.onTap,
      this.label,
      this.isLoading,
      this.loader});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55.0,
        width: SizeConfig.widthMultiplier * 90,
        decoration: BoxDecoration(
            border: Border.all(color: borderClr),
            color: btnClr,
            borderRadius: BorderRadius.circular(40.0)),
        child: Center(
          child: isLoading == false || isLoading == null
              ? Text(label,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600))
              : loader,
        ),
      ),
    );
  }
}
