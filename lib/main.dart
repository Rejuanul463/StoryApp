import 'package:flutter/material.dart';
import 'package:story_app/Spech.dart';

void main() {
  runApp(PictureStoryApp());
}

class PictureStoryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picture Story Time',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StoryLibraryScreen(),
    );
  }
}

class StoryLibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Story Library'),
      ),
      body: ListView.builder(
        itemCount: storyList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the story viewer screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      StoryViewerScreen(story: storyList[index]),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset(
                    storyList[index].coverImage,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    storyList[index].title,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class StoryViewerScreen extends StatelessWidget {
  final Story story;

  TextToSpeech spech = TextToSpeech();

  void stopStory() {
    spech.stopSpeak();
  }

  StoryViewerScreen({required this.story});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(story.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              story.coverImage,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                story.content,
                style: TextStyle(fontSize: 16),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                spech.speak(story.content);
                // Implement interactive elements or read-aloud functionality
              },
              child: Text('Read Aloud'),
            ),
          ],
        ),
      ),
    );
  }
}

class Story {
  final String title;
  final String coverImage;
  final String content;

  Story({required this.title, required this.coverImage, required this.content});
}

// Dummy data
List<Story> storyList = [
  Story(
    title: 'The Adventure of Alex',
    coverImage: 'assets/im.jpg',
    content:
        'In a quaint little town nestled between rolling hills and lush forests, lived a curious and spirited young boy named Alex. He had always been fascinated by stories of far-off lands, hidden treasures, and daring explorations. Every day, he would listen to his grandmothers tales of adventure with wide-eyed wonder, his imagination taking flight like a soaring bird.',
  ),
  Story(
    title: 'Hear & Turtle',
    coverImage: 'assets/h&t.jpg',
    content:
        'In a vibrant forest, lived friends Hear, a swift and energetic hare, and Turtois, a wise and patient tortoise. Despite differences, their bond grew strong. Hears racing challenge was accepted by Turtois, with a twist of strategy. The race began, Hear raced ahead, but impulsive choices led to obstacles. Turtois, steady and thoughtful, overtook and won. A lesson learned: balance brings victory. Friends embraced strengths, showing lifes lessons in unexpected friendships.',
  ),
  Story(
    title: 'Town mice and Country mice',
    coverImage: 'assets/mice.jpg',
    content:
        'In a quaint village, city mice invited their rural relatives for a visit. Amid luxurious feasts, country mice found discomfort. Town life meant danger, so they offered their simple home. A hungry cats scare made them realize tranquility outweighs opulence. Both families appreciated each others worlds, cherishing safety and simplicity.',
  ),
  // Add more stories here
];
