import 'package:book_app/AppConfig/app_config.dart';
import 'package:book_app/Utils/app_utils.dart';
import 'package:book_app/widgets/labelled_single_form.dart';
import 'package:book_app/widgets/outlined_button.dart';
import 'package:book_app/widgets/primary_round_button.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(20.0),
            child: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Text('Welcome 🎉',
                        style: Theme.of(context).textTheme.headline3),
                    SizedBox(height: AppSizes.SIZE_10),
                    Text(
                      StringConst.SIGNIN_TITLE,
                      style: AppUtils.getTextTheme(context)
                          .bodyText1!
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height: 30),
                    LabelledSingleInput(
                        placeholder: "Name",
                        keyboardType: "text",
                        controller: _nameController,
                        obscureText: obscureText,
                        label: "Your Name"),
                    SizedBox(height: 15),
                    LabelledSingleInput(
                        placeholder: "Password",
                        keyboardType: "text",
                        controller: _passController,
                        obscureText: obscureText,
                        label: "Your Password"),
                    SizedBox(height: 40),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButtonWithImage(
                            width: 180,
                            imageUrl: "assets/google_icon.png",
                            onButtonPressed: () {},
                          ),
                          PrimaryRoundButton(
                              Label: "  Sign In Anonymously", icon: Icons.email)
                        ]),
                  ]),
            ))));
  }
}
