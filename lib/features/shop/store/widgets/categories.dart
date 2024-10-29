import 'package:flutter/material.dart';

// ignore: camel_case_types
class store_category extends StatelessWidget {
  const store_category({
    super.key,
    required this.label,
    required this.icon,
  });

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.teal,
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          const SizedBox(height: 5),
          Text(label,
              style: const TextStyle(fontSize: 11, fontFamily: 'Poppins')),
        ],
      ),
    );
  }
}
