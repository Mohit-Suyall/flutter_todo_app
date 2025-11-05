import 'package:flutter/material.dart';
import 'package:tudo_app/constants/color.dart';

class TodoItem extends StatelessWidget {
  final String taskText;
  final VoidCallback onDelete;

  const TodoItem({
    super.key,
    required this.taskText,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: tdGray.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline, color: tdBlue, size: 28),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              taskText,
              style: const TextStyle(
                fontSize: 16,
                color: tdBlack,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: tdRed),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
