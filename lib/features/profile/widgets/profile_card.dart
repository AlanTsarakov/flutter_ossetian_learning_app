import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String id;

  const ProfileCard({required this.name, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          // Аватар (иконка или изображение)
          const SizedBox(width: 16),

          // Имя и ID
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  id,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),

          // Редактировать (иконка)
          // Container(
          //   width: 56,
          //   height: 56,
          //   decoration: BoxDecoration(
          //     color: Theme.of(context).colorScheme.primaryContainer,
          //     shape: BoxShape.circle,
          //   ),
          //   child: Icon(
          //     Icons.person_outline_rounded,
          //     size: 32,
          //     color: Theme.of(context).colorScheme.primary,
          //   ),
          // ),
        ],
      ),
    );
  }
}
