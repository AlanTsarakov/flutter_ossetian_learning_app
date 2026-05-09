import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            SizedBox(width: 80, height: 80, child: Icon(Icons.account_circle, size: 80,)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Геор Гузитаев", style: Theme.of(context).textTheme.titleMedium),
                  Padding(padding: .all(10)),
                  Row(
                    children: [
                      Icon(Icons.star, size: 14, color: Colors.amber[700]),
                      Text('67', style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
