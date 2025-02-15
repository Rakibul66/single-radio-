import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singlestation/service/remote_config.dart';
import 'home_screen.dart';
import 'audio_state.dart'; // Import the PlayerState class

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp();
  
  // Initialize Remote Config
  final remoteConfigService = RemoteConfigService();
  await remoteConfigService.initialize();

  // Run the app with Provider
  runApp(
    ChangeNotifierProvider(
      create: (context) => PlayerState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Radio App',
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}
