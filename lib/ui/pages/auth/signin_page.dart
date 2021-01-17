import 'package:cloudart/ui/constants/size_config.dart';
import 'package:cloudart/ui/pages/auth/signup_page.dart';
import 'package:cloudart/ui/pages/auth/splash_page.dart';
import 'package:cloudart/ui/pages/home/roothome.dart';
import 'package:cloudart/ui/pages/profile/user_profile.dart';
import 'package:cloudart/ui/widgets/auth_btn.dart';
import 'package:cloudart/ui/widgets/input_field.dart';
import 'package:cloudart/ui/widgets/progress.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  GlobalKey _formKey = GlobalKey<FormState>();
  bool isAuth = false;
  bool isUploading = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailCntlr = TextEditingController();
  TextEditingController passwordCntlr = TextEditingController();

  _buildInputForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputField(
            hint: "Email or Phone",
            controller: emailCntlr,
          ),
          SizedBox(
            height: 10.0,
          ),
          InputField(
            hint: "Password",
            controller: passwordCntlr,
            isPassField: true,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        width: SizeConfig.widthMultiplier * 100,
        height: SizeConfig.heightMultiplier * 100,
        decoration: BoxDecoration(
          gradient: themeController.getGrad(),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.heightMultiplier * 7,
              ),
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
              Text("Sign In",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.heightMultiplier * 3.5,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 20.0),
              _buildInputForm(),
              SizedBox(height: 20.0),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                GestureDetector(
                  child: Center(
                    child: Text("Forgot Password?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.heightMultiplier * 2,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.widthMultiplier * 5,
                ),
              ]),
              SizedBox(height: 40.0),
              AuthButton(
                label: "Sign In",
                btnClr: themeController.priClr,
                borderClr: themeController.priClr,
                isLoading: isUploading,
                loader: circularProgress(),
                onTap: () {
                  // _handleSignin();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RootHomePage();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 30.0),
              GestureDetector(
                child: Center(
                  child: Text("Don't have an account?",
                      style: TextStyle(
                          color: Colors.grey[100],
                          fontSize: SizeConfig.heightMultiplier * 2,
                          fontWeight: FontWeight.w400)),
                ),
              ),
              SizedBox(height: 30.0),
              AuthButton(
                label: "Continue with Google",
                borderClr: Colors.white24,
                btnClr: Colors.white10,
                onTap: () {},
              ),
              SizedBox(
                height: 8.0,
              ),
              AuthButton(
                label: "Continue with Facebook",
                borderClr: Colors.white24,
                btnClr: Colors.white10,
                onTap: () {},
              ),
              SizedBox(
                height: 10.0,
              ),
              AuthButton(
                label: "Create CloudArt account",
                borderClr: Colors.white24,
                btnClr: Colors.white10,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return SignupPage();
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
