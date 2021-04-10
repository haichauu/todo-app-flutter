import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/components/common/app_bar.dart';
import 'package:todo_app/components/common/bottom_nav.dart';
import 'package:todo_app/screens/root_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderBar(),
      body: RootScreen(),
      bottomNavigationBar: BottomNav(),
    );
  }
}
