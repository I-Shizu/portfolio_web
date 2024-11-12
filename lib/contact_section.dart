import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web/utils/launch_url.dart';

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