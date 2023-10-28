import 'package:flutter/material.dart';

class ProfileListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Developers For AppSteriods'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ProfileRow(
              'Mohd Amaan  [ Lead ] \n'
                  '   amaanbca0120gmail.com',
              'assets/images/amaan.png',
              const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.deepPurple,
                  Colors.red
                ], // Define your gradient colors
              )),
          const Divider(),
          ProfileRow(
              'Moulik Sharma \n'
                  '   mouliksharma2003@gmail.com',
              'assets/images/moulik.jpg',
              const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue,
                  Colors.green
                ], // Define your gradient colors
              )),
          const Divider(),
          ProfileRow(
              'Mohd Ifrahim \n'
                  '  mohdifrahim9999@gmail.com ',
              'assets/images/ifrahim.jpg',
              const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue,
                  Colors.green
                ], // Define your gradient colors
              )),
          const Divider(),
          ProfileRow(
              'Rahul Rana\n'
                  '   rahulrana4646@gmail.com',
              'assets/images/rahul.jpg',
              const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue,
                  Colors.green
                ], // Define your gradient colors
              )),
          const Divider(),
          ProfileRow(
              'Mohd Faisal Shahin\n'
                  '   fais40891@gmail.com',
              'assets/images/faisal.jpg',
              const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue,
                  Colors.green
                ], // Define your gradient colors
              )),
          const Divider(),
          ProfileRow(
              'Mohd Najam Shamim\n'
                  '   nazamkhan751@gmail.com',
              'assets/images/najam.jpg',
              const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue,
                  Colors.green
                ], // Define your gradient colors
              )),
          const Divider(),
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

  ProfileRow(this.name, this.avatarImage, this.gradient);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient, // Apply the gradient here
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: CircleAvatar(
          backgroundImage: AssetImage(avatarImage),
          radius: 30,
        ),
        title: Text(name,
            style: const TextStyle(
                color: Colors
                    .white)), // You can change text color to white for better contrast
      ),
    );
  }
}
