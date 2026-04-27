import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';   // ✅ Hive import

// Splash, Onboarding, Auth
import 'features/splash/splash_screen.dart';
import 'features/onboarding/onboarding_screen.dart';
import 'features/auth/login_screen.dart';
import 'features/home/home_screen.dart';

// Emergency & Safety
import 'features/emergency/sos/sos_screen.dart';
import 'features/emergency/contacts/emergency_contacts.dart';
import 'features/emergency/firstaid/first_aid_categories.dart';

// Disasters
import 'features/disasters/disaster_list.dart';

// Communication
import 'features/translator/translator_screen.dart';

// Health
import 'features/health/tracker/health_dashboard.dart';

// Map & Nearby
import 'features/map_services/nearby_services.dart';

// Community
import 'features/community/feed/feed_screen.dart';
import 'features/community/chat/chat_screen.dart';

// Education
import 'features/education/education_hub.dart';

// Profile & Settings
import 'features/profile/profile_screen.dart';
import 'features/settings/settings_screen.dart';

// Extra: Weather, Offline, About etc.
import 'features/weather/weather_screen.dart';
import 'features/offline/offline_resources.dart';
import 'features/about/about_screen.dart';
import 'features/feedback/feedback_screen.dart';
import 'features/privacy/privacy_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  // ✅ Hive initialization – health records offline storage
  await Hive.initFlutter();
  await Hive.openBox('healthRecords');

  runApp(const WorldConnectApp());
}

class WorldConnectApp extends StatelessWidget {
  const WorldConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorldConnect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: {
        // ----- Core -----
        '/splash': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),

        // ----- Emergency & Safety -----
        '/emergency_sos': (context) => const SosScreen(),
        '/emergency_contacts': (context) => EmergencyContactsScreen(),
        '/first_aid': (context) => const FirstAidCategories(),

        // ----- Disasters -----
        '/disasters': (context) => const DisasterListScreen(),

        // ----- Communication -----
        '/translator': (context) => const TranslatorScreen(),

        // ----- Health -----
        '/health': (context) => HealthDashboard(),

        // ----- Map & Nearby -----
        '/map_services': (context) => const NearbyServices(),

        // ----- Community -----
        '/community': (context) => const FeedScreen(),
        '/chat': (context) => const ChatScreen(),

        // ----- Education -----
        '/education': (context) => const EducationHub(),

        // ----- Profile & Settings -----
        '/profile': (context) => const ProfileScreen(),
        '/settings': (context) => const SettingsScreen(),

        // ----- Weather -----
        '/weather': (context) => const WeatherScreen(),

        // ----- Extra -----
        '/offline_resources': (context) => const OfflineResourcesScreen(),
        '/about': (context) => const AboutScreen(),
        '/feedback': (context) => const FeedbackScreen(),
        '/privacy': (context) => const PrivacyScreen(),
      },
    );
  }
}