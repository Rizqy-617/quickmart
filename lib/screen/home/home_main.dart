import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickmart/screen/home/cart_screen.dart';
import 'package:quickmart/screen/home/categories_screen.dart';
import 'package:quickmart/screen/home/home_screen.dart';
import 'package:quickmart/screen/home/profile.dart';
import 'package:quickmart/screen/home/wishlist_screen.dart';
import 'package:quickmart/store/action/action.dart';
import 'package:quickmart/store/config/app_state.dart';
import 'package:quickmart/store/reducers/reducer.dart';
import 'package:quickmart/store/reducers/route_reducer.dart';
import 'package:quickmart/template/route.dart';
import 'package:quickmart/template/theme_colors.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  int currentIndex = 0;
  bool canPop = false;

  final List<Widget> children = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const WishlistScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomeTab>(
      converter: (store) => store.state.homeTab,
      builder: (context, tab) {
        return PopScope(
          canPop: canPop,
          onPopInvokedWithResult: (didPop, result) async {
            if (!didPop) {
              if (tab != HomeTab.home) {
                store?.dispatch(RouteReducer(
                  action: ActionOperation.bringToHome,
                  payload: HomeTab.home
                ));
              } else if (tab == HomeTab.home) {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.question,
                  title: "Quit App?",
                  desc: "Do you want to quit the app?",
                  titleTextStyle: GoogleFonts.plusJakartaSans(
                    fontSize: 24,
                    color: ThemeColors.primaryBlack
                  ),
                  descTextStyle: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    color: ThemeColors.lightGrey2
                  ),
                  btnCancelText: "Cancel",
                  btnOkText: "Ok",
                  headerAnimationLoop: false,
                  btnCancelColor: ThemeColors.red,
                  btnOkColor: ThemeColors.primaryColorLight,
                  buttonsTextStyle: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.primaryWhite
                  ),
                  btnCancelOnPress: () {
                    return;
                  },
                  btnOkOnPress: () {
                    SystemNavigator.pop();
                  }
                ).show();
              }
            }
          },
          child: Scaffold(
            backgroundColor: ThemeColors.instance.primaryBackgrounColor(store!.state.scheme),
            body: children.elementAt(tab.index),
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent
              ),
              child: SizedBox(
                height: Platform.isIOS ? 95 : 75,
                child: BottomNavigationBar(
                  elevation: 28,
                  backgroundColor: ThemeColors.instance.primaryBackgrounColor(store!.state.scheme),
                  unselectedLabelStyle: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                  ),
                  selectedLabelStyle: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  selectedItemColor: store!.state.scheme == ThemeScheme.light ? ThemeColors.primaryBlack : ThemeColors.primaryWhite,
                  unselectedItemColor: ThemeColors.lightGrey2,
                  currentIndex: tab.index,
                  type: BottomNavigationBarType.fixed,
                  onTap: (index) {
                    store!.dispatch(RouteReducer(
                      action: ActionOperation.setHomeTab,
                      payload: HomeTab.values[index]
                    ));
                  },
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        "assets/icon/active_icon/home.png",
                        width: 24,
                        height: 24,
                      ),
                      activeIcon: Image.asset(
                        "assets/icon/active_icon/home-active.png",
                        width: 24,
                        height: 24,
                      ),
                      label: "Home"
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        "assets/icon/active_icon/category.png",
                        width: 24,
                        height: 24,
                      ),
                      activeIcon: Image.asset(
                        "assets/icon/active_icon/category-active.png",
                        width: 24,
                        height: 24,
                      ),
                      label: "Category"
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        "assets/icon/active_icon/shopping-cart.png",
                        width: 24,
                        height: 24,
                      ),
                      activeIcon: Image.asset(
                        "assets/icon/active_icon/shopping-cart-active.png",
                        width: 24,
                        height: 24,
                      ),
                      label: "My Cart"
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        "assets/icon/active_icon/heart.png",
                        width: 24,
                        height: 24,
                      ),
                      activeIcon: Image.asset(
                        "assets/icon/active_icon/heart-active.png",
                        width: 24,
                        height: 24,
                      ),
                      label: "Wishlist"
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        "assets/icon/active_icon/profile.png",
                        width: 24,
                        height: 24,
                      ),
                      activeIcon: Image.asset(
                        "assets/icon/active_icon/profile-active.png",
                        width: 24,
                        height: 24,
                      ),
                      label: "Profile"
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}