import 'package:flutter/material.dart';

void main() {
  runApp(const RunMyApp());
}

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  // Variable to manage the current theme mode
  ThemeMode _themeMode = ThemeMode.system;

  // Method to toggle the theme
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Theme Demo',
      
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.grey[200], 
        // This is something I implemented after struggling to find a way to change the AppBar color in light mode.
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueGrey,
        ),
      ), // Light mode background
      
      darkTheme: ThemeData.dark(), // Dark mode configuration
      
      themeMode: _themeMode, // Connects the state to the app

      home: Scaffold(
        // Here is the AppBar, it will change color based on the theme mode.
        appBar: AppBar(
          title: const Text('Theme Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Here is my animated container, it will switch themes based on the state of the switch below.
              AnimatedContainer(
                // The duration of the animation is set to 500 milliseconds.
                duration: const Duration(milliseconds: 500), // Task 3
                padding: const EdgeInsets.all(20),
                width: 300,
                height: 200,
                // Here is the box that contains the icon and text, it will change color based on the theme mode.
                decoration: BoxDecoration(
                  color: _themeMode == ThemeMode.dark ? Colors.white : Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                // Here is the content of the box, it contains an icon and two text widgets, all of which are centered.
                child: Column(
                  children: [
                    Icon(Icons.phone_android, color: Colors.black, size: 50),
                    const Text('Mobile App Development Testing', style: TextStyle(fontSize: 18, color: Colors.black), textAlign: TextAlign.center),
                    const Text('Demonstrating theme switching with smooth animations', style: TextStyle(fontSize: 12, color: Colors.black), textAlign: TextAlign.center),
                  ],
                ),
              ),
              
              // Here is the switch to toggle between light and dark themes, it is centered below the animated container.
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(_themeMode == ThemeMode.dark ? Icons.nightlight_round : Icons.wb_sunny),
                  Switch(
                    value: _themeMode == ThemeMode.dark,
                    onChanged: (isDark) {
                      setState(() {
                        _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}