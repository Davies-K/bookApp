import 'package:book_app/AppConfig/app_config.dart';
import 'package:book_app/Presentation/Screens/profile.dart';
import 'package:book_app/widgets/bottom_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'book_list.dart';
import 'favourites.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ValueNotifier<int> bottomNavigatorTrigger = ValueNotifier(0);
  final List<Widget> screens = [
    BookListPage(),
    Favourites(title: StringConst.FAVORITES),
    ProfilePage(title: StringConst.PROFILE)
  ];
  Widget currentScreen = BookListPage();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: bottomNavigatorTrigger,
          builder: (BuildContext context, _, __) {
            return PageStorage(
                child: screens[bottomNavigatorTrigger.value], bucket: bucket);
          }),
      bottomNavigationBar: BottomAppBar(
          child: Container(
              height: AppSizes.HEIGHT_60,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    BottomNavigationItem(
                      label: "Home",
                      icon: FeatherIcons.home,
                      itemIndex: 0,
                      notifier: bottomNavigatorTrigger,
                    ),
                    BottomNavigationItem(
                      label: "Favourites",
                      icon: FeatherIcons.heart,
                      itemIndex: 1,
                      notifier: bottomNavigatorTrigger,
                    ),
                    BottomNavigationItem(
                      label: "Profile",
                      icon: FeatherIcons.user,
                      itemIndex: 2,
                      notifier: bottomNavigatorTrigger,
                    ),
                  ]))),
    );
  }
}
