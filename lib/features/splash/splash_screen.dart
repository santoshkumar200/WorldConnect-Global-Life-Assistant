import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    // Asset video load
    _videoController = VideoPlayerController.asset('assets/videos/splash_intro.mp4')
      ..initialize().then((_) {
        setState(() {}); // Refresh UI
        _videoController.play(); // Auto-play
      });

    // Navigate after video ends or after a timeout
    _videoController.addListener(() {
      if (_videoController.value.position == _videoController.value.duration) {
        // Video finished → go to next screen
        _navigateToNext();
      }
    });

    // Fallback: if video doesn't load, go after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (!_videoController.value.isInitialized) {
        _navigateToNext();
      }
    });
  }

  void _navigateToNext() {
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/onboarding');
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _videoController.value.isInitialized
          ? SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _videoController.value.size.width,
                  height: _videoController.value.size.height,
                  child: VideoPlayer(_videoController),
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}