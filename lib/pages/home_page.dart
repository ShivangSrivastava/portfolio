import 'package:flutter/material.dart';
import 'package:portfolio/widgets/dock.dart';
import 'package:portfolio/widgets/top_panel.dart';
import 'package:portfolio/widgets/window.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkOrientation();
    });
  }

  void _checkOrientation() {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      _showOrientationDialog();
    }
  }

  void _showOrientationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Notice"),
          content: const Text(
              "Please view in desktop mode for a better experience."),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  int id = 0;
  List<Map<int, List>> windows = [];

  void addWindow(Widget child, String title) {
    setState(() {
      windows.add({
        id: [child, title],
      });
      id += 1;
    });
  }

  void removeWindow(int windowId) {
    setState(() {
      windows.removeWhere((element) => element.keys.first == windowId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/bg.jpg",
              fit: BoxFit.cover,
            ),
          ),
          const Align(alignment: Alignment(0.7, -0.2), child: DayWidget()),
          ...windows.map((window) {
            int windowId = window.keys.first;
            return Window(
              title: window[windowId]?[1],
              closeWindow: () => removeWindow(windowId),
              child: window[windowId]?[0],
            );
          }),
          const Align(alignment: Alignment.topCenter, child: TopPanel()),
          Align(
              alignment: Alignment.bottomCenter,
              child: Dock(addWindow: addWindow)),
        ],
      ),
    );
  }
}

class DayWidget extends StatelessWidget {
  const DayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String currentDay = DateTime.now().weekday == 1
        ? "MONDAY"
        : DateTime.now().weekday == 2
            ? "TUESDAY"
            : DateTime.now().weekday == 3
                ? "WEDNESDAY"
                : DateTime.now().weekday == 4
                    ? "THURSDAY"
                    : DateTime.now().weekday == 5
                        ? "FRIDAY"
                        : DateTime.now().weekday == 6
                            ? "SATURDAY"
                            : "SUNDAY";
    return Text(
      currentDay,
      style: const TextStyle(
        fontFamily: "Anurati",
        fontSize: 80,
        letterSpacing: 5,
      ),
    );
  }
}
