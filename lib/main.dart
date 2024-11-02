import 'package:flutter/material.dart';
import 'package:flutter_supabase/presentation/splash/screen/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://ivmvngaclysbcxqsxymi.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml2bXZuZ2FjbHlzYmN4cXN4eW1pIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzA0NjcxODcsImV4cCI6MjA0NjA0MzE4N30.5_YBY_OI00Vx9h0CtvVDKp9soYdSJttvQAznVIF-REc"
  );


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
