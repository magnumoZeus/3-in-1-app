import 'package:amaan/music/music.dart';
import 'package:amaan/tic_tac_toe/tic_tac_toe.dart';
import 'package:amaan/to_do/to_do.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MergedAppsScreen());
}

class MergedAppsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Merged Apps'),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: Center(
          child: AppTilesGrid(),
        ),
      ),
    );
  }
}

class AppTilesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2, // 2 columns
        mainAxisSpacing: 20.0, // Vertical spacing between tiles
        crossAxisSpacing: 20.0, // Horizontal spacing between tiles
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          AppTile(
            label: '',
            gradientColors: const [Colors.deepOrange, Colors.yellow],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ToDo()),
              );
            },
            backgroundImage: 'assets/images/a4.png',
          ),
          AppTile(
            label: '',
            gradientColors: const [Colors.deepPurple, Colors.red],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Music()),
              );
            },
            backgroundImage: 'assets/images/a1.png',
          ),
          AppTile(
            label: '',
            gradientColors: const [Colors.blue, Colors.green],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TicTacToe()),
              );
            },
            backgroundImage: 'assets/images/a3.png',
          ),
          AppTile(
            label: '',
            gradientColors: const [Colors.blue, Colors.transparent],
            onTap: () {
              // Navigate to App 4
              // Replace with your navigation logic
            },
            backgroundImage: 'assets/images/a2.png',
          ),
        ],
      ),
    );
  }
}

class AppTile extends StatelessWidget {
  final String label;
  final List<Color> gradientColors;
  final VoidCallback onTap;
  final String backgroundImage;

  const AppTile(
      {required this.label,
      required this.gradientColors,
      required this.onTap,
      required this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 5.0,
              spreadRadius: 2.0,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            // Background Image
            Image.asset(
              backgroundImage,
              fit: BoxFit.cover,
            ),
            Center(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
