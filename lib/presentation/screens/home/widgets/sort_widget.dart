import 'package:flutter/material.dart';
import 'package:hive_clean/presentation/provider/search_provider.dart';
import 'package:hive_clean/presentation/utils/constatnt.dart';
import 'package:provider/provider.dart';


class SortWidget extends StatelessWidget {
  const SortWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          const Icon(Icons.sort, size: 20),
          const SizedBox(width: 8),
          const Text(
            'Sort by:',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: DropdownButton<String>(
              value: searchProvider.sortBy,
              isExpanded: true,
              underline: const SizedBox(),
              items: AppConstants.sortOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  searchProvider.setSortBy(newValue);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}