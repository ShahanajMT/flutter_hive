import 'package:flutter/material.dart';
import 'package:hive_clean/presentation/provider/search_provider.dart';
import 'package:hive_clean/presentation/provider/student_provider.dart';
import 'package:hive_clean/presentation/widgets/empty_state.dart';
import 'package:hive_clean/presentation/widgets/student_card.dart';
import 'package:provider/provider.dart';


class StudentList extends StatelessWidget {
  const StudentList({super.key});

  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StudentProvider>(context);
    final searchProvider = Provider.of<SearchProvider>(context);

    final filteredStudents = searchProvider.filterAndSortStudents(studentProvider.students);

    if (studentProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (studentProvider.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Colors.red.shade300),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Error: ${studentProvider.error}',
                style: TextStyle(color: Colors.red.shade700),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => studentProvider.loadStudents(),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (filteredStudents.isEmpty) {
      return EmptyState(
        icon: Icons.search_off,
        title: 'No students found',
        description: studentProvider.students.isEmpty
            ? 'Add a student to get started'
            : 'Try adjusting your search or filters',
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filteredStudents.length,
      itemBuilder: (context, index) {
        final student = filteredStudents[index];
        return StudentCard(student: student, index: index);
      },
    );
  }
}