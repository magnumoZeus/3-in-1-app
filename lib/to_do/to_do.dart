import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pages/home_page.dart';

void main() async {
  await Hive.initFlutter();
}

class ToDo extends StatelessWidget {
  const ToDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox('mybox'), // Open the Hive box asynchronously
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Center(
                child: Text('Error: ${snapshot.error.toString()}'),
              ),
              theme: ThemeData(primarySwatch: Colors.yellow),
            );
          } else {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: HomePage(),
              theme: ThemeData(primarySwatch: Colors.yellow),
            );
          }
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Center(
              child: CircularProgressIndicator(),
            ),
            theme: ThemeData(primarySwatch: Colors.yellow),
          );
        }
      },
    );
  }
}
