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
      desc:
          "A real-time internet speed meter for your GNOME top bar, easy to set up with detailed configuration instructions on GitHub.",
      github: "https://github.com/ShivangSrivastava/speed_meter",
      language: ["GNOME", "Shell Script"]),
  ProjectDetail(
      name: "Midnight Modern",
      desc:
          "A sleek and stylish theme for Visual Studio Code, designed to enhance your coding experience.",
      github: "https://marketplace.visualstudio.com/items?itemName=ShivangSrivastava.midnight-modern",
      language: ["JavaScript"]),
  ProjectDetail(
      name: "SpamDetect",
      desc:
          "A robust spam mail detector that utilizes Flutter for the frontend and Python (FastAPI & scikit-learn) for the backend to efficiently distinguish between spam and ham messages.",
      github: "https://github.com/ShivangSrivastava/SpamDetect",
      language: ["Flutter", "Python"]),
  ProjectDetail(
      name: "House Prediction App",
      desc:
          "A Flutter-based app that predicts house prices using a trained model with a dataset of over 5,000 entries, powered by FastAPI and scikit-learn.",
      github: "https://github.com/ShivangSrivastava/house_price_prediction",
      language: ["Flutter", "Python"]),
  ProjectDetail(
      name: "Neon_X",
      desc:
          "An extension of velocity_x for Flutter, offering enhanced features like font weight, Google Fonts, and stylish widgets for timelines.",
      github: "https://github.com/ShivangSrivastava/neon_x",
      language: ["Flutter"]),
  ProjectDetail(
      name: "Google Files UI Clone",
      desc:
          "A Flutter recreation of the Google Files interface, customized with a personal touch for a familiar yet unique user experience.",
      github: "https://github.com/ShivangSrivastava/google_file_clone",
      language: ["Flutter"]),
];
