import 'package:book_app/AppConfig/app_config.dart';
import 'package:book_app/Core/Enums/loading.dart';
import 'package:book_app/Providers/auth_providers.dart';
import 'package:book_app/widgets/page_title.dart';
import 'package:book_app/widgets/primary_round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  final String title;
  const ProfilePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    print(firebaseUser.displayName);
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.SIZE_32),
      child:
          Consumer<AuthenticationProvider>(builder: (context, provider, child) {
        return provider.loadingState == LoadingState.busy
            ? Center(child: CircularProgressIndicator())
            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const SizedBox(height: AppSizes.HEIGHT_20),
                PageTitle(title: title),
                const SizedBox(height: AppSizes.HEIGHT_20),
                Expanded(
                    child: Center(
                        child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    firebaseUser.photoURL == null
                        ? CircleAvatar(
                            radius: AppSizes.SIZE_80,
                            child: Center(
                              child: Icon(FeatherIcons.user,
                                  color: AppColors.white,
                                  size: AppSizes.SIZE_80),
                            ),
                          )
                        : CircleAvatar(
                            backgroundImage:
                                NetworkImage(firebaseUser.photoURL!),
                            radius: 20,
                          ),
                    Text(
                        firebaseUser.displayName == null
                            ? "Anonymous"
                            : firebaseUser.displayName!,
                        style: Theme.of(context).textTheme.headline1),
                    firebaseUser.email == null
                        ? Text("N/A")
                        : Text(firebaseUser.email!),
                    SizedBox(height: AppSizes.HEIGHT_18),
                    PrimaryRoundButton(
                        width: 150,
                        color: Colors.blue,
                        onButtonPressed: () {
                          provider.signOut();
                        },
                        label: "   Log out",
                        icon: FeatherIcons.logOut)
                  ],
                )))
              ]);
      }),
    ));
  }
}
