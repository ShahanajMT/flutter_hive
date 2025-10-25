// import 'package:flutter/material.dart';
// import 'package:hive_clean/presentation/provider/auth_provider.dart';
// import 'package:hive_clean/presentation/screens/home/home_screen.dart';
// import 'package:hive_clean/presentation/utils/validators.dart';
// import 'package:hive_clean/presentation/widgets/auth_text.dart';
// import 'package:hive_clean/presentation/widgets/loading_button.dart';
// import 'package:provider/provider.dart';


// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _obscurePassword = true;

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   Future<void> _login() async {
//     if (!_formKey.currentState!.validate()) return;

//     final authProvider = Provider.of<AuthProvider>(context, listen: false);
//     final success = await authProvider.login(
//       _emailController.text.trim(),
//       _passwordController.text.trim(),
//     );

//     if (success && mounted) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const ScreenHome()),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final authProvider = Provider.of<AuthProvider>(context);

//     return Padding(
//       padding: const EdgeInsets.all(24.0),
//       child: Form(
//         key: _formKey,
//         child: Column(
//           children: [
//             const SizedBox(height: 24),
//             // Email Field
//             AuthTextField(
//               controller: _emailController,
//               label: 'Email Address',
//               prefixIcon: Icons.email,
//               keyboardType: TextInputType.emailAddress,
//               validator: Validators.validateEmail,
//             ),
//             const SizedBox(height: 16),
//             // Password Field
//             AuthTextField(
//               controller: _passwordController,
//               label: 'Password',
//               prefixIcon: Icons.lock,
//               obscureText: _obscurePassword,
//               suffixIcon: IconButton(
//                 icon: Icon(
//                   _obscurePassword ? Icons.visibility : Icons.visibility_off,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     _obscurePassword = !_obscurePassword;
//                   });
//                 },
//               ),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Password is required';
//                 }
//                 if (value.length < 6) {
//                   return 'Password must be at least 6 characters';
//                 }
//                 return null;
//               },
//             ),
//             const SizedBox(height: 8),
//             // Forgot Password
//             Align(
//               alignment: Alignment.centerRight,
//               child: TextButton(
//                 onPressed: () {
//                   // Implement forgot password
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Forgot password feature coming soon!')),
//                   );
//                 },
//                 child: const Text('Forgot Password?'),
//               ),
//             ),
//             const SizedBox(height: 24),
//             // Error Message
//             if (authProvider.error != null)
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: Colors.red.shade50,
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(color: Colors.red.shade200),
//                 ),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.error_outline, color: Colors.red, size: 16),
//                     const SizedBox(width: 8),
//                     Expanded(
//                       child: Text(
//                         authProvider.error!,
//                         style: TextStyle(color: Colors.red.shade700),
//                       ),
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.close, size: 16),
//                       onPressed: authProvider.clearError,
//                     ),
//                   ],
//                 ),
//               ),
//             if (authProvider.error != null) const SizedBox(height: 16),
//             // Login Button
//             LoadingButton(
//               onPressed: _login,
//               isLoading: authProvider.isLoading,
//               text: 'Sign In',
//             ),
//             const SizedBox(height: 24),
//             // Demo Credentials
//             Card(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Demo Credentials:',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 14,
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       'Email: any valid email\nPassword: any password (min 6 chars)',
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey.shade600,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:hive_clean/presentation/provider/auth_provider.dart';
import 'package:hive_clean/presentation/screens/home/home_screen.dart';
import 'package:hive_clean/presentation/utils/validators.dart';
import 'package:hive_clean/presentation/widgets/form_feild.dart';
import 'package:hive_clean/presentation/widgets/loading_button.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  Future<void> _login(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final success = await authProvider.login(
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    if (success && context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 24),
          CustomFormField(
            controller: emailController,
            label: 'Email Address',
            icon: Icons.email,
            keyboardType: TextInputType.emailAddress,
            validator: Validators.validateEmail,
          ),
          const SizedBox(height: 16),
          CustomFormField(
            controller: passwordController,
            label: 'Password',
            icon: Icons.lock,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Password is required';
              if (value.length < 6) return 'Password must be at least 6 characters';
              return null;
            },
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Forgot password feature coming soon!')),
                );
              },
              child: const Text('Forgot Password?'),
            ),
          ),
          const SizedBox(height: 24),
          if (authProvider.error != null) _buildError(context, authProvider.error!),
          if (authProvider.error != null) const SizedBox(height: 16),
          LoadingButton(
            onPressed: () => _login(context),
            isLoading: authProvider.isLoading,
            text: 'Sign In',
          ),
          const SizedBox(height: 24),
          _buildDemoCredentials(),
        ],
      ),
    );
  }

  Widget _buildError(BuildContext context, String error) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 16),
          const SizedBox(width: 8),
          Expanded(child: Text(error, style: TextStyle(color: Colors.red.shade700))),
          IconButton(
            icon: const Icon(Icons.close, size: 16),
            onPressed: () => Provider.of<AuthProvider>(context, listen: false).clearError(),
          ),
        ],
      ),
    );
  }

  Widget _buildDemoCredentials() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Demo Credentials:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              'Email: any valid email\nPassword: any password (min 6 chars)',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}