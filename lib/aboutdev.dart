import 'package:flutter/material.dart';

class ProfileListScreen extends StatelessWidget {
  const ProfileListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Developers For AppSteriods'),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          Divider(),
          ProfileRow(
              'Qambar Abbas  [ Lead ] \n'
                  'eMail id: qambarabbas54325@gmail.com',
              'assets/images/qambar.JPG',
              LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.deepPurple,
                  Colors.red
                ], // Define your gradient colors
              )),
          Divider(),
          // Add more ProfileRows with different gradient colors
        ],
      ),
    );
  }
}

class ProfileRow extends StatelessWidget {
  final String name;
  final String avatarImage;
  final LinearGradient gradient;

  const ProfileRow(this.name, this.avatarImage, this.gradient, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: CircleAvatar(
          backgroundImage: AssetImage(avatarImage),
          radius: 30,
        ),
        title: Text(name, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
