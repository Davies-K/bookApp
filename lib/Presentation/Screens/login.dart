import 'dart:io';

import 'package:book_app/AppConfig/app_config.dart';
import 'package:book_app/Core/Enums/loading.dart';
import 'package:book_app/Providers/auth_providers.dart';
import 'package:book_app/Utils/app_utils.dart';
import 'package:book_app/widgets/labelled_single_form.dart';
import 'package:book_app/widgets/outlined_button.dart';
import 'package:book_app/widgets/primary_round_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

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
            child: SafeArea(child: SingleChildScrollView(
              child: Consumer<AuthenticationProvider>(
                  builder: (context, provider, child) {
                return Column(
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
                      SizedBox(height: AppSizes.HEIGHT_40),
                      provider.loadingState == LoadingState.busy
                          ? Platform.isAndroid
                              ? Center(child: CircularProgressIndicator())
                              : Center(child: CupertinoActivityIndicator())
                          : Column(children: [
                              PrimaryRoundButton(
                                  color: Colors.blue,
                                  label: "  Continue with Email",
                                  icon: Icons.email),
                              SizedBox(height: AppSizes.HEIGHT_14),
                              PrimaryRoundButton(
                                  color: Colors.red,
                                  label: "  Google Sign In.",
                                  onButtonPressed: () async {
                                    provider.signInwithGoogle();
                                  },
                                  icon: Icons.alternate_email),
                              SizedBox(height: AppSizes.HEIGHT_14),
                              PrimaryRoundButton(
                                  color: Colors.black,
                                  label: "  Sign In Anonymously",
                                  onButtonPressed: () async {
                                    provider.signInAnonymously();
                                  },
                                  icon: FontAwesomeIcons.ghost),
                            ])
                    ]);
              }),
            ))));
  }
}
