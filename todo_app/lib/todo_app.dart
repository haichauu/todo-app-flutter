import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_app/screens/main_screen.dart';
import 'model/app_state.dart';

class TodoApp extends StatelessWidget {
  // This widget is the root of your application.
  final Store<AppState> store;

  TodoApp({
    Key key,
    this.store,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp(
          title: 'Todo App',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.green,
            // This makes the visual density adapt to the platform that you run
            // the app on. For desktop platforms, the controls will be smaller and
            // closer together (more dense) than on mobile platforms.
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          // home: MyHomePage(title: 'Flutter Demo Home Page'),
          routes: {
            // When navigating to the "/" route, build the FirstScreen widget.
            '/': (context) => MainScreen(),
            // When navigating to the "/second" route, build the SecondScreen widget.
          },
        ));
  }
}
