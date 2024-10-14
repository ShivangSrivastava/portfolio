// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class ProjectSectionCard extends StatelessWidget {
  final String text;
  final bool isActive;
  final VoidCallback onTap;
  const ProjectSectionCard({
    super.key,
    required this.text,
    this.isActive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        width: double.infinity,
        child: Card(
          color: isActive ? Colors.grey.withOpacity(0.3) : Colors.transparent,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
