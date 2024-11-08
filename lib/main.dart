import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'utils/launch_url.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const PortfolioPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('しずくのポートフォリオ'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileSection(),
            ProjectsSection(),
            const ContactSection(),
          ],
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/my_icon.jpg'), // プロフィール画像のURL
          ),
          const SizedBox(height: 16),
          const Text(
            '碇 穏空',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'I will be software developer &  am Student of Meiji.univ now',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class ProjectsSection extends StatelessWidget {
  final List<Project> projects = [
    Project('ファイト日記', '個人開発として作ったアプリ。頑張れない人が頑張れるようになります。'),
    Project('Motto Hotto', 'Tokyo Flutter Hackathon 2024 に参加した際に作成したアプリ。懇親会などの交流会を盛り上げられます。'),
  ];

  ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Projects',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Column(
            children: projects
                .map((project) => ProjectCard(project: project))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Project project;
  final hackathonProjectUrl = 'https://flutter-hackathon-prd.web.app/';

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          launchURL(hackathonProjectUrl);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(project.title),
              subtitle: Text(project.description),
              trailing: const Icon(Icons.open_in_new),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/hackathon_app.png', 
                height: 400, // 高さを調整
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  final String githubUrl = 'https://github.com/I-Shizu';
  final String xUrl = 'https://twitter.com/Shizufishing';
  final String email = 'shizup00417@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'Email: '),
                TextSpan(
                  text: email,
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => launchURL('mailto:$email'),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'X: '),
                TextSpan(
                  text: '@Shizufishing',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => launchURL(xUrl),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'GitHub: '),
                TextSpan(
                  text: githubUrl,
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => launchURL(githubUrl),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Project {
  final String title;
  final String description;

  Project(this.title, this.description);
}