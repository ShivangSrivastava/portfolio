import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    String aboutMe = """
👋 Hey there! I'm a code enthusiast who turns caffeine into creative solutions. Friends say I can talk to computers, but really, I just debug my way through life!

💻 A proud Linux lover, I believe every desktop should look like a rockstar’s album cover. When I'm not exploring GNOME extensions, you can find me tinkering with code and dreaming about the perfect cup of coffee.

🌍 My toolkit includes Python, Flutter, and a sprinkle of C. If you need me, I’ll be somewhere in the digital realm, battling bugs or brainstorming my next coding adventure!""";

    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              "assets/me.jpg",
              height: 100,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Shivang Srivastava",
            style: TextStyle(
                fontFamily: GoogleFonts.firaMono().fontFamily,
                letterSpacing: 1,
                fontSize: 20,
                fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Text(
              aboutMe,
              textAlign: TextAlign.center,
              style: TextStyle(
                letterSpacing: 0,
                fontFamily: GoogleFonts.firaMono().fontFamily,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Let's Connect",
            style: TextStyle(
                fontFamily: GoogleFonts.firaMono().fontFamily,
                letterSpacing: 1,
                fontSize: 20,
                fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () =>
                    _launchURL('mailto:shivangsrivastava157@gmail.com'),
                child: const Text(
                  "Email",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () => _launchURL(
                    'https://www.linkedin.com/in/shivang-srivastava-dev/'),
                child: const Text(
                  "LinkedIn",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () => _launchURL('https://github.com/ShivangSrivastava'),
                child: const Text(
                  "GitHub",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
