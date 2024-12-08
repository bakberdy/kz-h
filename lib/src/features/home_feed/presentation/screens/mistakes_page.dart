import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MistakesPage extends StatefulWidget {
  const MistakesPage({super.key});

  @override
  State<MistakesPage> createState() => _MistakesPageState();
}

class _MistakesPageState extends State<MistakesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: const Text(
          'Mistakes',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
