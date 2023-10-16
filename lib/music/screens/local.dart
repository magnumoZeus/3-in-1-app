import 'package:flutter/material.dart';

class LocalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Under Development'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.warning,
              size: 80,
              color: Colors.orange,
            ),
            SizedBox(height: 20),
            Text(
              'Under Development',
              style: TextStyle(
                fontSize: 24,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
