// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:portfolio/core/all_projects.dart';
import 'package:portfolio/widgets/project_section_card.dart';
import 'package:url_launcher/url_launcher.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  int activeSection = 0;
  List<String> sectionTitle = [
    "All",
    "GNOME",
    "Shell Script",
    "JavaScript",
    "Flutter",
    "Python"
  ];

  List<List<ProjectDetail>> projects = [
    allProjects,
    allProjects.where((element) => element.language.contains("GNOME")).toList(),
    allProjects
        .where((element) => element.language.contains("Shell Script"))
        .toList(),
    allProjects
        .where((element) => element.language.contains("JavaScript"))
        .toList(),
    allProjects
        .where((element) => element.language.contains("Flutter"))
        .toList(),
    allProjects
        .where((element) => element.language.contains("Python"))
        .toList(),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Container(
            width: 150,
            color: Colors.black12,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                for (int i = 0; i < sectionTitle.length; i++)
                  ProjectSectionCard(
                    text: sectionTitle[i],
                    isActive: i == activeSection,
                    onTap: () {
                      setState(() {
                        activeSection = i;
                      });
                    },
                  )
              ],
            ),
          ),
          Expanded(
            child: Container(
                color: Colors.black38,
                height: double.infinity,
                width: double.infinity,
                child: Wrap(
                  children: [
                    for (int i = 0; i < projects[activeSection].length; i++)
                      ProjectCard(
                          projects: projects,
                          activeSection: activeSection,
                          i: i)
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.projects,
    required this.activeSection,
    required this.i,
  });

  final List<List<ProjectDetail>> projects;
  final int activeSection;
  final int i;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await launchUrl(Uri.parse(projects[activeSection][i].github));
      },
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8.0),
        child: Tooltip(
          message:
              "${projects[activeSection][i].name}:\n${projects[activeSection][i].desc}",
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/github.png",
                colorBlendMode: BlendMode.colorBurn,
                height: 50,
              ),
              Text(
                projects[activeSection][i].name,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(overflow: TextOverflow.ellipsis),
              )
            ],
          ),
        ),
      ),
    );
  }
}
