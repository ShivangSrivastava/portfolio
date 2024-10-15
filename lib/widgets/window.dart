import 'package:flutter/material.dart';

class Window extends StatefulWidget {
  final Widget child;
  final String title;
  final VoidCallback? closeWindow; 

  const Window({
    super.key,
    required this.child,
    required this.title,
    required this.closeWindow,
  });

  @override
  State<Window> createState() => _WindowState();
}

class _WindowState extends State<Window> {
  Offset position = const Offset(100, 100);
  double width = 600;
  double height = 400;
  bool resizing = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: position.dx,
          top: position.dy,
          child: GestureDetector(
            onPanUpdate: (details) {
              if (!resizing) {
                setState(() {
                  position += details.delta;
                });
              }
            },
            child: Container(
              width: (width > 600) ? width : 600,
              height: (height > 400) ? height : 400,
              decoration: const BoxDecoration(
                color: Color(0xff28282b),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Stack(
                children: [
                  WindowLayout(
                    title: widget.title,
                    closeWindow: widget.closeWindow ?? () {},
                    child: widget.child, // Pass closeWindow to layout
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onPanStart: (_) => resizing = true,
                      onPanUpdate: (details) {
                        setState(() {
                          width += details.delta.dx;
                          height += details.delta.dy;
                        });
                      },
                      onPanEnd: (_) => resizing = false,
                      child: Container(
                        width: 15,
                        height: 15,
                        color: Colors.black12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WindowLayout extends StatelessWidget {
  final Widget child;
  final String title;
  final VoidCallback closeWindow; // Close callback function

  const WindowLayout({
    super.key,
    required this.child,
    this.title = "New Window",
    required this.closeWindow, // Accept closeWindow function
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleBar(title: title, closeWindow: closeWindow), // Pass closeWindow
          Expanded(
            child: child,
          )
        ],
      ),
    );
  }
}

class TitleBar extends StatelessWidget {
  final String title;
  final VoidCallback closeWindow; // Close callback function

  const TitleBar({
    super.key,
    required this.title,
    required this.closeWindow, // Accept closeWindow function
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: closeWindow, // Call the closeWindow function here
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: const ShapeDecoration(
                      shape: CircleBorder(),
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(),
                    color: Colors.yellowAccent,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: const TextStyle(color: Colors.white54),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Divider(
              height: 10,
            ),
          )
        ],
      ),
    );
  }
}
