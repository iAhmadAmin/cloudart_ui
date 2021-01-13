import 'package:flutter/material.dart';

Container circularProgress() {
  return Container(
    child: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.purple),
      ),
    ),
  );
}

Container linearProgress() {
  return Container(
    padding: EdgeInsets.only(bottom: 10.0),
    child: LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.white),
    ),
  );
}
