import 'package:flutter/material.dart';

class reusablerow extends StatelessWidget {
  const reusablerow({super.key, this.title, this.cases});
  final title;
  final cases;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          Text(
            cases,
            style: const TextStyle(
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
