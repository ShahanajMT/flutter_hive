// import 'package:flutter/material.dart';
// import 'package:hive_clean/presentation/screens/auth/login_screen.dart';
// import 'package:hive_clean/presentation/screens/auth/sign_up_scree.dart';


// class AuthScreen extends StatefulWidget {
//   const AuthScreen({super.key});

//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Header
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(32),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                   colors: [
//                     Colors.deepPurple.shade700,
//                     Colors.deepPurple.shade400,
//                   ],
//                 ),
//                 borderRadius: const BorderRadius.only(
//                   bottomLeft: Radius.circular(24),
//                   bottomRight: Radius.circular(24),
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   // App Icon
//                   Container(
//                     width: 80,
//                     height: 80,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: const Icon(
//                       Icons.school,
//                       size: 40,
//                       color: Colors.deepPurple,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   const Text(
//                     'Student Manager',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   const Text(
//                     'Welcome back! Please sign in to continue',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.white70,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
            
//             // Tab Bar
//             Container(
//               color: Colors.white,
//               child: TabBar(
//                 controller: _tabController,
//                 indicatorColor: Colors.deepPurple,
//                 labelColor: Colors.deepPurple,
//                 unselectedLabelColor: Colors.grey,
//                 tabs: const [
//                   Tab(text: 'LOGIN'),
//                   Tab(text: 'SIGN UP'),
//                 ],
//               ),
//             ),
            
//             // Tab Content
//             Expanded(
//               child: TabBarView(
//                 controller: _tabController,
//                 children: const [
//                   LoginScreen(),
//                   SignupScreen(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:hive_clean/presentation/screens/auth/login_screen.dart';
import 'package:hive_clean/presentation/screens/auth/sign_up_scree.dart';


class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.deepPurple.shade700,
                      Colors.deepPurple.shade400,
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.school,
                        size: 40,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Student Manager',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Welcome back! Please sign in to continue',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: const TabBar(
                  indicatorColor: Colors.deepPurple,
                  labelColor: Colors.deepPurple,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: 'LOGIN'),
                    Tab(text: 'SIGN UP'),
                  ],
                ),
              ),
               Expanded(
                child: TabBarView(
                  children: [
                    LoginScreen(),
                    SignupScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}