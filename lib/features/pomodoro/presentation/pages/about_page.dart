import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:k_skin/k_skin.dart';
import 'package:url_launcher/url_launcher.dart';

/// About Page
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('About'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          _buildInfoRow(context, label: "Contact", info: "yirik.xxx@gmail.com"),
          Divider(height: 1, thickness: 1, color: Colors.grey[300]),
          _buildInfoRow(context, label: "X", info: "Yirik"),
          Divider(height: 1, thickness: 1, color: Colors.grey[300]),
          _buildInfoRow(context, label: "Version", info: "0.0.1"),
          SizedBox(height: 100),
          Image.asset('lib/assets/images/logo.png', width: 48, height: 48),
          Center(child: Text('@KPomodoro')),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required String label,
    required String info,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: KThemeManager.instance.currentTheme.colorScheme.surface,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(label, style: const TextStyle(fontSize: 14))),
            Text(info),
            if (onTap != null)
              Icon(Icons.keyboard_arrow_right, color: Colors.grey[600]),
          ],
        ),
      ),
    );
  }

  Future<void> _launchEmail(String email) async {
    final Uri emailUri = Uri(scheme: 'mailto', path: email);

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
