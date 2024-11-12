import 'package:flutter/material.dart';
import 'package:portfolio_web/contact_section.dart';
import 'package:portfolio_web/profile_section.dart';
import 'package:portfolio_web/project_section.dart';

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