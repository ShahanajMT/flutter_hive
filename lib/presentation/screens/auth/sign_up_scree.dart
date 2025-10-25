import 'package:flutter/material.dart';
import 'package:hive_clean/presentation/provider/auth_provider.dart';
import 'package:hive_clean/presentation/screens/home/home_screen.dart';
import 'package:hive_clean/presentation/utils/validators.dart';
import 'package:hive_clean/presentation/widgets/auth_text.dart';
import 'package:hive_clean/presentation/widgets/loading_button.dart';
import 'package:provider/provider.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) return;

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final success = await authProvider.signUp(
      _emailController.text.trim(),
      _passwordController.text.trim(),
      _nameController.text.trim(),
    );

    if (success && mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  String? _validateConfirmPassword(String? value) {
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(height: 24),
            // Name Field
            AuthTextField(
              controller: _nameController,
              label: 'Full Name',
              prefixIcon: Icons.person,
              validator: Validators.validateName,
            ),
            const SizedBox(height: 16),
            // Email Field
            AuthTextField(
              controller: _emailController,
              label: 'Email Address',
              prefixIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              validator: Validators.validateEmail,
            ),
            const SizedBox(height: 16),
            // Password Field
            AuthTextField(
              controller: _passwordController,
              label: 'Password',
              prefixIcon: Icons.lock,
              obscureText: _obscurePassword,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            // Confirm Password Field
            AuthTextField(
              controller: _confirmPasswordController,
              label: 'Confirm Password',
              prefixIcon: Icons.lock_outline,
              obscureText: _obscureConfirmPassword,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
              ),
              validator: _validateConfirmPassword,
            ),
            const SizedBox(height: 24),
            // Error Message
            if (authProvider.error != null)
              Container(
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
                    Expanded(
                      child: Text(
                        authProvider.error!,
                        style: TextStyle(color: Colors.red.shade700),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 16),
                      onPressed: authProvider.clearError,
                    ),
                  ],
                ),
              ),
            if (authProvider.error != null) const SizedBox(height: 16),
            // Sign Up Button
            LoadingButton(
              onPressed: _signUp,
              isLoading: authProvider.isLoading,
              text: 'Create Account',
            ),
            const SizedBox(height: 24),
            // Terms and Conditions
            const Text(
              'By creating an account, you agree to our Terms of Service and Privacy Policy',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}