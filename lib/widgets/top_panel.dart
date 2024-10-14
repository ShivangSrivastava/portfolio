import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TopPanel extends StatelessWidget {
  const TopPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      color: Colors.black.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Workspaces",
              style: TextStyle(fontSize: 12),
            ),
            StreamBuilder<String>(
                stream: getDateTime(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data!,
                      style: const TextStyle(
                          wordSpacing: 0, letterSpacing: 0.2, fontSize: 12),
                    );
                  } else {
                    return const Text(
                      "loading",
                      style: TextStyle(fontSize: 12),
                    );
                  }
                }),
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.wifi_outlined,
                  size: 16,
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.volume_down,
                  size: 16,
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.battery_4_bar_sharp,
                  size: 16,
                ),
                Text(
                  "56%",
                  style: TextStyle(fontSize: 12),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Stream<String> getDateTime() {
  return Stream.periodic(
    const Duration(seconds: 10),
    (computationCount) {
      DateTime now = DateTime.now();
      return DateFormat('EEE MMM d  h:mma').format(now);
    },
  );
}
