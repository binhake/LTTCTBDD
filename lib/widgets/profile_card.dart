import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.name,
    required this.studentId,
    required this.className,
  });

  final String name;
  final String studentId;
  final String className;

  @override
  Widget build(BuildContext context) {
    final initial = name.trim().split(' ').last.substring(0, 1);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              child: Text(initial),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            Text('MSSV: $studentId'),
            const SizedBox(height: 4),
            Text(className),
          ],
        ),
      ),
    );
  }
}
