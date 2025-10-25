// import 'package:flutter/material.dart';
// import 'package:hive_clean/presentation/provider/auth_provider.dart';
// import 'package:provider/provider.dart';


// import '../auth/auth_screen.dart';
// import '../home/home_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _initializeAnimations();
//     _initializeApp();
//   }

//   void _initializeAnimations() {
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 1500),
//       vsync: this,
//     );

//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     );

//     _controller.forward();
//   }

//   void _initializeApp() async {
//     // Initialize auth provider
//     final authProvider = Provider.of<AuthProvider>(context, listen: false);
//     await authProvider.initialize();

//     // Add a small delay for smooth transition
//     await Future.delayed(const Duration(milliseconds: 1000));

//     // Navigate to appropriate screen
//     if (mounted) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => authProvider.isAuthenticated 
//               ? const ScreenHome() 
//               : const AuthScreen(),
//         ),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.deepPurple,
//       body: Center(
//         child: ScaleTransition(
//           scale: _animation,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // App Icon/Logo
//               Container(
//                 width: 120,
//                 height: 120,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(24),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.2),
//                       blurRadius: 20,
//                       offset: const Offset(0, 10),
//                     ),
//                   ],
//                 ),
//                 child: const Icon(
//                   Icons.school,
//                   size: 60,
//                   color: Colors.deepPurple,
//                 ),
//               ),
//               const SizedBox(height: 24),
//               // App Name
//               const Text(
//                 'Student Manager',
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               // Tagline
//               const Text(
//                 'Manage your students efficiently',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.white70,
//                 ),
//               ),
//               const SizedBox(height: 40),
//               // Loading indicator
//               SizedBox(
//                 width: 24,
//                 height: 24,
//                 child: CircularProgressIndicator(
//                   strokeWidth: 2,
//                   valueColor: AlwaysStoppedAnimation<Color>(Colors.white.withOpacity(0.8)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:hive_clean/presentation/provider/auth_provider.dart';
import 'package:hive_clean/presentation/screens/auth/auth_screen.dart';
import 'package:hive_clean/presentation/screens/home/home_screen.dart';
import 'package:provider/provider.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: const Icon(
                Icons.school,
                size: 60,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Student Manager',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Manage your students efficiently',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white.withOpacity(0.8)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void navigateToNextScreen(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => authProvider.isAuthenticated 
              ? const HomeScreen() 
              : const AuthScreen(),
        ),
      );
    });
  }
}