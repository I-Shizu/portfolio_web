import 'package:flutter/material.dart';

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
            'I will be software developer &  am Student at Meiji.univ now',
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

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(project.title),
        subtitle: Text(project.description),
        trailing: const Icon(Icons.open_in_new),
        onTap: () {
          // プロジェクトの詳細やリンクを追加できます
        },
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text('Email: shizup00417@gmail.com'),
          SizedBox(height: 8),
          Text('X: @Shizufishing'),
          SizedBox(height: 8),
          Text('GitHub: https://github.com/I-Shizu'),
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