// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:portfolio/pages/about.dart';
import 'package:portfolio/pages/projects.dart';
import 'package:portfolio/pages/terminal.dart';

class Dock extends StatelessWidget {
  final Function(Widget, String) addWindow;
  const Dock({
    super.key,
    required this.addWindow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        gradient: const LinearGradient(
          colors: [
            Color(0xee28282b),
            Color.fromARGB(255, 53, 53, 53),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
                onTap: () {
                  addWindow(const Projects(), "Projects");
                },
                child: Image.asset("assets/filemanager.png")),
            const SizedBox(width: 10),
            InkWell(
                onTap: () {
                  addWindow(const About(), "About");
                },
                child: Image.asset("assets/about.png")),
            const SizedBox(width: 10),
            InkWell(
                onTap: () {
                  addWindow(const Terminal(), "shivang@root:~");
                },
                child: Image.asset("assets/terminal.png")),
          ],
        ),
      ),
    );
  }
}
