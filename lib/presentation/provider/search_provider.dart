import 'package:flutter/material.dart';
import 'package:hive_clean/domain/entities/student.dart';


class SearchProvider with ChangeNotifier {
  String _searchQuery = '';
  String _sortBy = 'Newest First';
  bool _showStatistics = false;

  String get searchQuery => _searchQuery;
  String get sortBy => _sortBy;
  bool get showStatistics => _showStatistics;

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setSortBy(String sortBy) {
    _sortBy = sortBy;
    notifyListeners();
  }

  void toggleStatistics() {
    _showStatistics = !_showStatistics;
    notifyListeners();
  }

  List<Student> filterAndSortStudents(List<Student> students) {
    // Filter by search query
    var filteredStudents = students.where((student) {
      return student.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          (student.email?.toLowerCase().contains(_searchQuery.toLowerCase()) ?? false) ||
          (student.phone?.contains(_searchQuery) ?? false);
    }).toList();

    // Sort students
    switch (_sortBy) {
      case 'Name A-Z':
        filteredStudents.sort((a, b) => a.name.compareTo(b.name));
        break;
      case 'Name Z-A':
        filteredStudents.sort((a, b) => b.name.compareTo(a.name));
        break;
      case 'Age Low-High':
        filteredStudents.sort((a, b) => a.age.compareTo(b.age));
        break;
      case 'Age High-Low':
        filteredStudents.sort((a, b) => b.age.compareTo(a.age));
        break;
      case 'Newest First':
        filteredStudents.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
      case 'Oldest First':
        filteredStudents.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        break;
    }

    return filteredStudents;
  }
}