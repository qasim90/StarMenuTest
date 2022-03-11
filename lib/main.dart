import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:star_menu/star_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      locale: const Locale('ar', ''),
      supportedLocales: [Locale('ar', '')],
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}

class MyHomePage extends StatelessWidget {
  var data = List.generate(100, (index) => 'This is item $index');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Star menu test')),
      body: SafeArea(child: listViewExample(context)
          // child: textSpanExample(context),
          ),
    );
  }

  listViewExample(context) {
    return ListView(
      children: data
          .map((item) => ListTile(
                title: Text(item).addStarMenu(context, createMenuItems(), configureAyahMenu()),
              ))
          .toList(),
    );
  }

  textSpanExample(context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: RichText(
        text: TextSpan(
            children: data
                .map<TextSpan>(
                    (e) => TextSpan(text: e, style: TextStyle(height: 1.8, color: Colors.grey, fontSize: 18)))
                .toList()),
      ).addStarMenu(context, createMenuItems(), configureAyahMenu()),
    );
  }

  createMenuItems() {
    return ['copy long text', 'share', 'delete this item']
        .map((e) => Container(
              margin: const EdgeInsets.only(left: 50),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Text(e),
            ))
        .toList();
  }

  configureAyahMenu() {
    return StarMenuParameters(
        // useScreenCenter: true,
        shape: MenuShape.linear,
        linearShapeParams: LinearShapeParams(angle: 270, space: 10, alignment: LinearAlignment.right),
        onItemTapped: (index, ctrllr) => print('menu $index clicked'));
  }
}
