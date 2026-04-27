import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseDetail extends StatefulWidget {
  final Map<String, dynamic> course;
  const CourseDetail({super.key, required this.course});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  late YoutubePlayerController _ytController;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.course['video']) ?? '';
    _ytController = YoutubePlayerController(initialVideoId: videoId);
  }

  @override
  void dispose() {
    _ytController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.course['title']), backgroundColor: Colors.indigo),
      body: Column(
        children: [
          YoutubePlayer(controller: _ytController, showVideoProgressIndicator: true),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: widget.course['quiz'].length,
              itemBuilder: (_, i) => ListTile(
                leading: const Icon(Icons.question_answer),
                title: Text('Quiz Question ${i+1}: ${widget.course['quiz'][i]}'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}