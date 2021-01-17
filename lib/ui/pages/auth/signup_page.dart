import 'package:cloudart/ui/constants/size_config.dart';
import 'package:cloudart/ui/pages/auth/signin_page.dart';
import 'package:cloudart/ui/pages/auth/splash_page.dart';
import 'package:cloudart/ui/widgets/auth_btn.dart';
import 'package:cloudart/ui/widgets/date_picker.dart';
import 'package:cloudart/ui/widgets/input_field.dart';
import 'package:cloudart/ui/widgets/progress.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isUploading = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey _formKey = GlobalKey<FormState>();
  TextEditingController fNameCntlr = TextEditingController();
  TextEditingController lNameCntlr = TextEditingController();
  TextEditingController artistNameCntlr = TextEditingController();
  TextEditingController emailCntlr = TextEditingController();
  TextEditingController passwordCntlr = TextEditingController();
  TextEditingController cPasswordCntlr = TextEditingController();

  _buildInputForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: SizeConfig.widthMultiplier * 5),
              Expanded(
                child: InputField(
                  hint: "First Name",
                  isShortFiedl: true,
                  controller: fNameCntlr,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: InputField(
                  hint: "Last Name",
                  isShortFiedl: true,
                  controller: lNameCntlr,
                ),
              ),
              SizedBox(width: SizeConfig.widthMultiplier * 5),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          InputField(
            hint: "Artist Name",
            controller: artistNameCntlr,
          ),
          SizedBox(
            height: 10.0,
          ),
          InputField(
            hint: "Email or Phone",
            controller: emailCntlr,
          ),
          SizedBox(
            height: 10.0,
          ),
          MyDatePicker(),
          SizedBox(
            height: 10.0,
          ),
          InputField(
            hint: "Password",
            controller: passwordCntlr,
            isPassField: true,
          ),
          SizedBox(
            height: 10.0,
          ),
          InputField(
            hint: "Confirm Password",
            isPassField: true,
            controller: cPasswordCntlr,
          )
        ],
      ),
    );
  }

  _handleSaveData() async {
    if (fNameCntlr.text.isEmpty ||
        lNameCntlr.text.isEmpty ||
        artistNameCntlr.text.isEmpty ||
        emailCntlr.text.isEmpty ||
        passwordCntlr.text.isEmpty ||
        cPasswordCntlr.text.isEmpty) {
      SnackBar snackBar = SnackBar(
        content: Text("Please fill all fields."),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        width: SizeConfig.widthMultiplier * 100,
        height: SizeConfig.heightMultiplier * 100,
        padding: EdgeInsets.only(
          top: SizeConfig.heightMultiplier * 7,
        ),
        decoration: BoxDecoration(
          gradient: themeController.getGrad(),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("CloudArt",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.heightMultiplier * 5.5,
                      fontWeight: FontWeight.w600)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Lorem ipsum dolor sit amet, consetetu dipscing elitr, sed diam nonum eirmote",
                  style: TextStyle(
                      color: Colors.white70, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20.0),
              Text("Sign Up",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.heightMultiplier * 3.5,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 20.0),
              _buildInputForm(),
              SizedBox(height: 40.0),
              AuthButton(
                label: "Sign Up",
                isLoading: isUploading,
                loader: circularProgress(),
                onTap: () {
                  _handleSaveData();
                },
                btnClr: themeController.priClr,
                borderClr: themeController.priClr,
              ),
              SizedBox(height: 30.0),
              GestureDetector(
                child: Center(
                  child: Text("Already have an account?",
                      style: TextStyle(
                          color: Colors.grey[100],
                          fontSize: SizeConfig.heightMultiplier * 2,
                          fontWeight: FontWeight.w400)),
                ),
              ),
              SizedBox(height: 30.0),
              AuthButton(
                label: "Sign In",
                borderClr: Colors.white24,
                btnClr: Colors.white10,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return SigninPage();
                    }),
                  );
                },
              ),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
