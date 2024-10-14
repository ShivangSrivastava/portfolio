import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Terminal extends StatelessWidget {
  const Terminal({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> archAscii = """
                   -`
                  .o+`
                 `ooo/
                `+oooo:
               `+oooooo:
               -+oooooo+:
             `/:-:++oooo+:
            `/++++/+++++++:
           `/++++++++++++++:
          `/+++ooooooooooooo/`
         ./ooosssso++osssssso+`
        .oossssso-````/ossssss+`
       -osssssso.      :ssssssso.
      :osssssss/        osssso+++.
     /ossssssss/        +ssssooo/-
   `/ossssso+/:-        -:/+osssso+-
  `+sso+:-`                 `.-/+oso:
 `++:.                           `-/+/
 .`                                 `
"""
        .split("\n");
    List<String> output = """
Operating System: Arch Linux
------------
Kernel: 6.5.7-arch1-1
Uptime: 5 hours, 12 minutes
Packages: 1,234 (pacman)
Shell: zsh 5.8.1
Resolution: 1920x1080
DE: GNOME 45.0
WM: Mutter
Theme: WhiteSur-Dark
Icons: Cupertino-Sonoma
Terminal: GNOME Terminal









"""
        .split("\n");
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "\$ neofetch",
              style: TextStyle(
                  color: Colors.greenAccent,
                  fontFamily: GoogleFonts.firaMono().fontFamily),
            ),
            for (int i = 0; i < archAscii.length; i++)
              Row(
                children: [
                  SizedBox(
                    width: 350,
                    child: Text(
                      archAscii[i],
                      style: TextStyle(
                          color: Colors.cyan,
                          fontFamily: GoogleFonts.firaMono().fontFamily),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      output[i],
                      maxLines: 1,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontFamily: GoogleFonts.firaMono().fontFamily),
                    ),
                  )
                ],
              ),
            Text(
              "\$ ",
              style: TextStyle(
                  color: Colors.greenAccent,
                  fontFamily: GoogleFonts.firaMono().fontFamily),
            ),
          ],
        ),
      ),
    );
  }
}
