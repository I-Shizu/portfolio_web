import 'package:flutter/material.dart';
import 'package:portfolio_web/project.dart';
import 'package:portfolio_web/project_card.dart';

class ProjectsSection extends StatelessWidget {
  final List<Project> projects = [
    Project(
      'ふぁいと日記',
      '個人開発として作ったアプリ。頑張れない人が頑張れるようになります。',
      'https://github.com/I-Shizu/fight_memory',
      '',
    ),

    Project(
      'Motto Hotto', 
      'Tokyo Flutter Hackathon 2024 に参加した際に作成したアプリ。懇親会などの交流会を盛り上げられます。',
      'https://github.com/I-Shizu/flutter_hackathon',
      'assets/images/hackathon_app.png',
    ),
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