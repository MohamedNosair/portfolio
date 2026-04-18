import 'package:flutter/material.dart';
import '../utils/app_theme.dart';
import '../data/portfolio_data.dart';
import 'visual_elements.dart';
import 'dart:html' as html;

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? AppTheme.space3 : AppTheme.space8,
        vertical: isMobile ? AppTheme.space8 : AppTheme.space12,
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ..._buildContent(isMobile),
                const SizedBox(height: AppTheme.space6),
                const Center(child: ProfileAvatar(size: 180)),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _buildContent(isMobile),
                  ),
                ),
                const SizedBox(width: AppTheme.space8),
                const Expanded(
                  flex: 1,
                  child: Center(
                    child: ProfileAvatar(size: 280),
                  ),
                ),
              ],
            ),
    );
  }

  List<Widget> _buildContent(bool isMobile) {
    return [
          // Small intro tag
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.space2,
              vertical: AppTheme.space1,
            ),
            decoration: BoxDecoration(
              color: AppTheme.lightBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
              border: Border.all(
                color: AppTheme.lightBlue.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Text(
              'Available for work',
              style: AppTheme.labelLarge.copyWith(
                color: AppTheme.primaryBlue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          SizedBox(height: isMobile ? AppTheme.space4 : AppTheme.space6),

          // Large name
          Text(
            'Mohamed',
            style: isMobile
                ? AppTheme.displayMedium
                : AppTheme.displayLarge,
          ),
          Text(
            'Nosair',
            style: (isMobile
                    ? AppTheme.displayMedium
                    : AppTheme.displayLarge)
                .copyWith(
              color: AppTheme.primaryBlue,
            ),
          ),

          SizedBox(height: isMobile ? AppTheme.space2 : AppTheme.space3),

          // Title
          Text(
            PortfolioData.title,
            style: isMobile
                ? AppTheme.titleLarge
                : AppTheme.headlineMedium.copyWith(
                    color: AppTheme.textGray,
                    fontWeight: FontWeight.w500,
                  ),
          ),

          SizedBox(height: isMobile ? AppTheme.space3 : AppTheme.space4),

          // Description
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Text(
              PortfolioData.aboutSummary1,
              style: isMobile
                  ? AppTheme.bodyMedium
                  : AppTheme.bodyLarge,
            ),
          ),

          SizedBox(height: isMobile ? AppTheme.space4 : AppTheme.space6),

          // CTA Buttons
          Wrap(
            spacing: AppTheme.space2,
            runSpacing: AppTheme.space2,
            children: [
              ElevatedButton(
                onPressed: () => _launchEmail(),
                style: AppTheme.primaryButtonStyle,
                child: const Text('Get in touch'),
              ),
              OutlinedButton(
                onPressed: () => _launchURL(PortfolioData.github),
                style: AppTheme.outlineButtonStyle,
                child: const Text('View GitHub'),
              ),
            ],
          ),

          SizedBox(height: isMobile ? AppTheme.space6 : AppTheme.space8),

          // Quick Stats
          Wrap(
            spacing: isMobile ? AppTheme.space3 : AppTheme.space6,
            runSpacing: AppTheme.space3,
            children: const [
              _StatItem(
                number: '4+',
                label: 'Years Experience',
              ),
              _StatItem(
                number: '20+',
                label: 'Projects Delivered',
              ),
              _StatItem(
                number: '99.2%',
                label: 'App Stability',
              ),
            ],
          ),
    ];
  }

  void _launchURL(String url) {
    html.window.open(url, '_blank');
  }

  void _launchEmail() {
    html.window.open('mailto:${PortfolioData.email}', '_blank');
  }
}

class _StatItem extends StatelessWidget {
  final String number;
  final String label;

  const _StatItem({
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: AppTheme.headlineLarge.copyWith(
            color: AppTheme.primaryBlue,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTheme.bodyMedium.copyWith(
            color: AppTheme.textLight,
          ),
        ),
      ],
    );
  }
}
