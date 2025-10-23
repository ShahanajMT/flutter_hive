import 'package:flutter/material.dart';
import 'package:hive_clean/data/models/student_model.dart';
import 'package:hive_clean/injection_container.dart' as di;
import 'package:hive_clean/presentation/provider/student_provider.dart';
import 'package:hive_clean/presentation/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(StudentModelAdapter());
  
  // Initialize dependency injection
  await di.init();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => di.getIt<StudentProvider>(),
        ),
      ],
      child: MaterialApp(
        title: 'Student Database',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          useMaterial3: true,
        ),
        home: const ScreenHome(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}