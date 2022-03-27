import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabs_app/models/list_item.dart';
import 'package:tabs_app/ui/ressources.dart';

import 'ui/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> ListItem(),
      child: MaterialApp(
        title: 'Tranding',
        color: colorTab,
        home: const MyHomePage(),
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(secondary: colorTab),
        ),
      ),
    );
  }
}
