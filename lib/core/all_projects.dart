class ProjectDetail {
  String name;
  String desc;
  String github;
  List<String> language;

  ProjectDetail({
    required this.name,
    required this.desc,
    required this.github,
    required this.language,
  });
}

List<ProjectDetail> allProjects = [
  ProjectDetail(
      name: "GNOME Internet Speed Meter",
      desc: "Real-time internet speed meter for GNOME top bar",
      github: "https://github.com/ShivangSrivastava/speed_meter",
      language: ["GNOME", "Shell Script"]),
  ProjectDetail(
      name: "Midnight Modern",
      desc: "Sleek, stylish theme to enhance VS Code.",
      github:
          "https://marketplace.visualstudio.com/items?itemName=ShivangSrivastava.midnight-modern",
      language: ["JavaScript"]),
  ProjectDetail(
      name: "SpamDetect",
      desc: "Spam detector with Flutter UI and Python backend.",
      github: "https://github.com/ShivangSrivastava/SpamDetect",
      language: ["Flutter", "Python"]),
  ProjectDetail(
      name: "House Prediction App",
      desc:
          "Flutter app for house price prediction with FastAPI and scikit-learn model.",
      github: "https://github.com/ShivangSrivastava/house_price_prediction",
      language: ["Flutter", "Python"]),
  ProjectDetail(
      name: "Neon_X",
      desc:
          "Velocity_x extension for Flutter with font and widget enhancements",
      github: "https://github.com/ShivangSrivastava/neon_x",
      language: ["Flutter"]),
  ProjectDetail(
      name: "Google Files UI Clone",
      desc: "Flutter app mimicking Google Files with a unique twist.",
      github: "https://github.com/ShivangSrivastava/google_file_clone",
      language: ["Flutter"]),
];
