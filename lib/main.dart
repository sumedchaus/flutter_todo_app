import 'package:flutter/material.dart';
import 'package:flutter_todo_app/services/theme_services.dart';
import 'package:flutter_todo_app/thems.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import 'my_home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
      home: MyHomePage(),
    );
  }
}
