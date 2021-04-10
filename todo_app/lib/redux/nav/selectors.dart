import 'package:flutter/cupertino.dart';
import 'package:todo_app/model/app_state.dart';

Widget currentScreenSelector(AppState state) => state.navState.currentScreen;
int currentIndexSelector(AppState state) => state.navState.currentIndex;
String currentScreenTitleSelector(AppState state) => state.navState.currentScreenTitle;
