import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onMenuPressed;

  const AppBarWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey.shade200,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(imagePath),
                radius: 30,
              ),
              SizedBox(width: 10),
            ],
          ),
          Text(title),
          Container(
            // decoration: BoxDecoration(
            //   color: Colors.grey.shade500,
            //   borderRadius: BorderRadius.circular(8),
            // ),
            // child: IconButton(
            //   icon: Icon(Icons.menu, color: Colors.white),
            //   onPressed: onMenuPressed,
            // ),
          ),
        ],
      ),
      centerTitle: true,
    );
  }
}