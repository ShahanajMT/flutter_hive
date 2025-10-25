import 'package:hive_clean/domain/entities/student.dart';

class StudentStatistics {
  final int totalStudents;
  final double averageAge;
  final int youngestAge;
  final int oldestAge;
  final Map<String, int> ageDistribution;

  StudentStatistics({
    required this.totalStudents,
    required this.averageAge,
    required this.youngestAge,
    required this.oldestAge,
    required this.ageDistribution,
  });
}

class StatisticsUseCase {
  StudentStatistics calculateStatistics(List<Student> students) {
    if (students.isEmpty) {
      return StudentStatistics(
        totalStudents: 0,
        averageAge: 0,
        youngestAge: 0,
        oldestAge: 0,
        ageDistribution: {},
      );
    }

    final ages = students.map((student) => student.age).toList();
    final totalAge = ages.reduce((a, b) => a + b);
    final averageAge = totalAge / students.length;
    final youngestAge = ages.reduce((a, b) => a < b ? a : b);
    final oldestAge = ages.reduce((a, b) => a > b ? a : b);

    // Age distribution
    final ageDistribution = <String, int>{};
    for (final age in ages) {
      final key = '${(age ~/ 10) * 10}-${(age ~/ 10) * 10 + 9}';
      ageDistribution[key] = (ageDistribution[key] ?? 0) + 1;
    }

    return StudentStatistics(
      totalStudents: students.length,
      averageAge: double.parse(averageAge.toStringAsFixed(1)),
      youngestAge: youngestAge,
      oldestAge: oldestAge,
      ageDistribution: ageDistribution,
    );
  }
}