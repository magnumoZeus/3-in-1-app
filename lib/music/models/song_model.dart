class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song({
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
  });

  static List<Song> songs = [
    Song(
      title: 'No Love',
      description: 'No Love',
      url: 'assets/music/No Love.mp3',
      coverUrl: 'assets/images/No Love.jpg',
    ),
    Song(
      title: 'Baller',
      description: 'Baller',
      url: 'assets/music/Baller.mp3',
      coverUrl: 'assets/images/Baller.jpg',
    ),
    Song(
      title: 'Company',
      description: 'Company',
      url: 'assets/music/Company.mp3',
      coverUrl: 'assets/images/Company.jpg',
    ),
    Song(
      title: 'Glass',
      description: 'Glass',
      url: 'assets/music/glass.mp3',
      coverUrl: 'assets/images/glass.jpg',
    ),
    Song(
      title: 'Illusions',
      description: 'Illusions',
      url: 'assets/music/illusions.mp3',
      coverUrl: 'assets/images/illusions.jpg',
    ),
    Song(
      title: 'Pray',
      description: 'Pray',
      url: 'assets/music/pray.mp3',
      coverUrl: 'assets/images/pray.jpg',
    ),
    Song(
      title: 'Cheques',
      description: 'Cheques',
      url: 'assets/music/Cheques.mp3',
      coverUrl: 'assets/images/Cheques.jpg',
    ),
  ];
}
