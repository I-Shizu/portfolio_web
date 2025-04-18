import 'package:flutter/material.dart';
import 'package:portfolio_web/project.dart';
import 'package:portfolio_web/utils/launch_url.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          launchURL(project.projectUrl);
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
                project.imagePath, 
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
