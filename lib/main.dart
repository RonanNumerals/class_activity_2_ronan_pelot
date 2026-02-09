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
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueGrey,
        ),// Light mode background
      ),
      
      darkTheme: ThemeData.dark(), // Dark mode configuration
      
      themeMode: _themeMode, // Connects the state to the app

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Theme Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // PART 1 TASK: Container and Text
              AnimatedContainer(
                duration: const Duration(milliseconds: 500), // Task 3
                padding: const EdgeInsets.all(20),
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  color: _themeMode == ThemeMode.dark ? Colors.white : Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Icon(Icons.phone_android, color: Colors.black, size: 50),
                    const Text('Mobile App Development Testing', style: TextStyle(fontSize: 18, color: Colors.black), textAlign: TextAlign.center),
                    // Task 2 & 4: Switch with Dynamic Icon
                    const Text('Demonstrating theme switching with smooth animations', style: TextStyle(fontSize: 12, color: Colors.black), textAlign: TextAlign.center),
                  ],
                ),
              ),
              
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