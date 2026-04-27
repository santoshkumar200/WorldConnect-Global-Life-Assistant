plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    // ✅ Firebase ke liye (ye plugins block mein hi apply karte hain DSL mein)
    id("com.google.gms.google-services")
}

android {
    namespace = "com.example.worldconnect"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
        // ✅ Core library desugaring enable (flutter_local_notifications ke liye)
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        applicationId = "com.example.worldconnect"
        minSdk = flutter.minSdkVersion   // ✅ 21 set karein
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true   // ✅ Multidex enable
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    // ✅ Desugaring library (Kotlin DSL syntax: implementation ko parentheses ke saath)
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}
