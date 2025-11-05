import 'package:flutter/material.dart';
import 'package:tudo_app/Widgets/todo_item.dart';
import 'package:tudo_app/constants/color.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  final List<String> _tasks = [];
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  void _addTask(String task) {
    if (task.isEmpty) return;
    setState(() => _tasks.insert(0, task));
    _controller.clear();
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tdBGColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.menu, color: tdBlack, size: 30),
            CircleAvatar(
              radius: 22,
              backgroundImage: const NetworkImage(
                'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d',
              ),
              backgroundColor: tdGray.withOpacity(0.3),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Header
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(20),
            child: const Text(
              "Today's Tasks",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: tdBlack,
              ),
            ),
          ),

          // Task list with animation
          Expanded(
            child: AnimatedList(
              key: GlobalKey<AnimatedListState>(),
              initialItemCount: _tasks.length,
              itemBuilder: (context, index, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: TodoItem(
                      taskText: _tasks[index],
                      onDelete: () => _deleteTask(index),
                    ),
                  ),
                );
              },
            ),
          ),

          // Add new task field
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOut,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: tdGray.withOpacity(0.3),
                          blurRadius: 8,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Add a new task...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                AnimatedScale(
                  scale: 1.0,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                  child: FloatingActionButton(
                    onPressed: () => _addTask(_controller.text),
                    backgroundColor: tdBlue,
                    child: const Icon(Icons.add, size: 30),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
