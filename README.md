# 🌍 WorldConnect – Global Life Assistant

**A must‑have app for every human, no matter the country, language, or situation.**

[![Flutter](https://img.shields.io/badge/Flutter-3.10+-02569B?logo=flutter)](https://flutter.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

---

## 📱 What is WorldConnect?

**WorldConnect** is a comprehensive mobile application that combines **emergency assistance, health tracking, disaster alerts, translation, community support, and offline safety guides** into a single platform.  
Whether you are at home, travelling, or facing an unexpected crisis, this app gives you the tools to stay safe and assist others.

Built with **Flutter** and **Firebase**, WorldConnect works on both Android and iOS, supports multiple languages, and offers **offline access** to critical features like first aid instructions and emergency numbers.

---

## ✨ Key Features

- 🆘 **One‑Tap SOS** – Calls emergency services (local number) and sends your live GPS location to trusted contacts via SMS.
- 🚑 **First Aid Guide** – Illustrated step‑by‑step instructions for cuts, burns, CPR, choking, and fractures (works fully offline).
- 🌪️ **Disaster Alerts** – Real‑time alerts for earthquakes, floods, cyclones, fires with an interactive map and safety tips.
- 🌐 **Multi‑Language Translator** – Translate text between 100+ languages using Google Translate.
- 🩺 **Health Tracker** – Log blood pressure, weight, blood sugar; view charts; set medicine reminders (data stored locally via Hive).
- 🗺️ **Nearby Services** – Quickly locate hospitals, police stations, and shelters on an interactive map.
- 👥 **Community Feed** – Share posts, ask for help, or volunteer in your area (powered by Cloud Firestore).
- 💬 **Emergency Chat** – Real‑time group chat for volunteers during a crisis.
- 📚 **Education Hub** – Video courses (YouTube) and quizzes on first aid, disaster preparedness, and CPR.
- 🌤️ **Weather** – Current weather based on your device’s location.
- 📴 **Offline Resources** – Downloadable safety guides that work without an internet connection.
- ⚙️ **Profile & Settings** – Manage emergency contacts, language preferences, and notification settings.

**Total Screens: 28+** (all fully functional)

---

## 🧱 Tech Stack

- **Frontend:** Flutter (Dart)
- **Backend:** Firebase (Authentication, Cloud Firestore, Cloud Messaging)
- **Local Database:** Hive, SharedPreferences
- **Maps:** Google Maps for Flutter
- **Charts:** fl_chart
- **Local Notifications:** flutter_local_notifications
- **Video:** youtube_player_flutter, video_player (splash)
- **SMS/Call:** url_launcher (native dialer & SMS)
- **Location:** geolocator

---

## 📸 Screenshots

*Add your own screenshots in a `screenshots/` folder and update the links below.*

| Home Dashboard | Emergency SOS | First Aid | Disaster Alerts |
|:---:|:---:|:---:|:---:|
| ![Home](screenshots/home.png) | ![SOS](screenshots/sos.png) | ![FirstAid](screenshots/firstaid.png) | ![Disaster](screenshots/disaster.png) |

| Translator | Health Tracker | Nearby Map | Community Feed |
|:---:|:---:|:---:|:---:|
| ![Translator](screenshots/translator.png) | ![Health](screenshots/health.png) | ![Map](screenshots/map.png) | ![Feed](screenshots/feed.png) |

… and many more! *(Add screenshots for all 28 screens as per the feature list.)*

---

## 🚀 Download & Run

### Option 1 – Direct APK
You can download the latest APK from the [Releases](https://github.com/your-username/worldconnect/releases) section.  
*(Or paste a direct download link if you have one.)*

### Option 2 – Build from Source
Make sure you have Flutter installed, then run:
```bash
git clone https://github.com/your-username/worldconnect.git
cd worldconnect
flutter clean
flutter pub get
flutter run
