// 

import 'package:flutter/material.dart';
import 'package:hive_clean/presentation/provider/auth_provider.dart';
import 'package:hive_clean/presentation/provider/search_provider.dart';
import 'package:hive_clean/presentation/provider/student_provider.dart';
import 'package:hive_clean/presentation/provider/theme_provider.dart';
import 'package:hive_clean/presentation/screens/home/widgets/add_student_widget.dart';
import 'package:hive_clean/presentation/screens/home/widgets/sort_widget.dart';
import 'package:hive_clean/presentation/screens/home/widgets/statistics_widget.dart';
import 'package:hive_clean/presentation/screens/home/widgets/student_list_widget.dart';
import 'package:hive_clean/presentation/utils/file_exporter.dart';
import 'package:hive_clean/presentation/widgets/custom_dialoge.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StudentProvider>(context, listen: false);
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      studentProvider.loadStudents();
    });

    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final searchProvider = Provider.of<SearchProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final studentProvider = Provider.of<StudentProvider>(context);

    return AppBar(
      title: const Text('Student Database'),
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
      elevation: 0,
      actions: [
        if (authProvider.currentUser != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                authProvider.currentUser!.name[0].toUpperCase(),
                style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        IconButton(
          icon: Icon(searchProvider.showStatistics ? Icons.visibility_off : Icons.visibility),
          onPressed: searchProvider.toggleStatistics,
          tooltip: 'Toggle Statistics',
        ),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: () => _exportStudents(context, studentProvider),
          tooltip: 'Export Students',
        ),
        IconButton(
          icon: Icon(themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode),
          onPressed: themeProvider.toggleTheme,
          tooltip: 'Toggle Theme',
        ),
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () => _showLogoutDialog(context),
          tooltip: 'Logout',
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final searchProvider = Provider.of<SearchProvider>(context);

    return RefreshIndicator(
      onRefresh: () => Provider.of<StudentProvider>(context, listen: false).loadStudents(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            if (authProvider.currentUser != null) _buildWelcomeMessage(authProvider),
            const SearchBar(),
             SortWidget(),
            if (searchProvider.showStatistics)  StatisticsWidget(),
             AddStudentForm(),
            const SizedBox(height: 16),
            const StudentList(),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeMessage(AuthProvider authProvider) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      color: Colors.deepPurple.withOpacity(0.1),
      child: Text(
        'Welcome back, ${authProvider.currentUser!.name}!',
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.deepPurple),
        textAlign: TextAlign.center,
      ),
    );
  }

  Future<void> _exportStudents(BuildContext context, StudentProvider provider) async {
    try {
      final exporter = FileExporter();
      await exporter.exportStudentsToCsv(provider.students, context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Export failed: $e'), backgroundColor: Colors.red),
      );
    }
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CustomDialog(
        title: 'Logout',
        content: 'Are you sure you want to logout?',
        confirmText: 'Logout',
        onConfirm: () => _logout(context),
      ),
    );
  }

  void _logout(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.logout();
    if (context.mounted) {
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    }
  }
}