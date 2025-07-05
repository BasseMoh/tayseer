// lib/core/widgets/custom_header.dart

import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final VoidCallback onBack;

  const CustomHeader({
    super.key,
    required this.title,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: onBack,
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
