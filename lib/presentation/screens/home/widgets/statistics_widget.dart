import 'package:flutter/material.dart';
import 'package:hive_clean/domain/usecases/statistic_use_case.dart';
import 'package:hive_clean/presentation/provider/student_provider.dart';
import 'package:provider/provider.dart';


class StatisticsWidget extends StatelessWidget {
  final StatisticsUseCase statisticsUseCase = StatisticsUseCase();

  StatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StudentProvider>(context);
    final stats = statisticsUseCase.calculateStatistics(studentProvider.students);

    if (stats.totalStudents == 0) {
      return const SizedBox.shrink();
    }

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Student Statistics',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem('Total', stats.totalStudents.toString()),
                _buildStatItem('Avg Age', stats.averageAge.toString()),
                _buildStatItem('Youngest', stats.youngestAge.toString()),
                _buildStatItem('Oldest', stats.oldestAge.toString()),
              ],
            ),
            const SizedBox(height: 16),
            if (stats.ageDistribution.isNotEmpty) ...[
              const Text(
                'Age Distribution:',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: stats.ageDistribution.entries.map((entry) {
                  return Chip(
                    label: Text('${entry.key}: ${entry.value}'),
                    backgroundColor: Colors.deepPurple.withOpacity(0.1),
                  );
                }).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}