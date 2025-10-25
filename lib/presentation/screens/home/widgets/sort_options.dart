import 'package:flutter/material.dart';
import 'package:hive_clean/presentation/provider/search_provider.dart';
import 'package:hive_clean/presentation/utils/constatnt.dart';
import 'package:provider/provider.dart';


class SortOptions extends StatelessWidget {
  const SortOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.sort, size: 20, color: Colors.deepPurple),
          const SizedBox(width: 8),
          const Text(
            'Sort by:',
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.deepPurple),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: DropdownButton<String>(
                value: searchProvider.sortBy,
                isExpanded: true,
                underline: const SizedBox(),
                icon: const Icon(Icons.arrow_drop_down, color: Colors.deepPurple),
                items: AppConstants.sortOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 14),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    searchProvider.setSortBy(newValue);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}