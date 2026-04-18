import 'package:flutter/material.dart';
import '../utils/app_theme.dart';
import '../data/portfolio_data.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? AppTheme.space3 : AppTheme.space8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills & Expertise',
            style: isMobile
                ? AppTheme.headlineMedium
                : AppTheme.headlineLarge,
          ),
          const SizedBox(height: AppTheme.space6),

          // Skills Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 2,
              crossAxisSpacing: AppTheme.space3,
              mainAxisSpacing: AppTheme.space3,
              childAspectRatio: isMobile ? 1.3 : 1.5,
            ),
            itemCount: PortfolioData.skills.length,
            itemBuilder: (context, index) {
              final entry = PortfolioData.skills.entries.elementAt(index);
              return _SkillCard(
                category: entry.key,
                skills: entry.value,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SkillCard extends StatefulWidget {
  final String category;
  final List<String> skills;

  const _SkillCard({
    required this.category,
    required this.skills,
  });

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(AppTheme.space4),
        decoration: AppTheme.bentoCardDecoration().copyWith(
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 24,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 12,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Title
            Row(
              children: [
                Container(
                  width: 4,
                  height: 24,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryBlue,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: AppTheme.space2),
                Expanded(
                  child: Text(
                    widget.category,
                    style: AppTheme.titleLarge.copyWith(
                      color: AppTheme.textDark,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTheme.space3),

            // Skills
            Expanded(
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.skills
                    .map((skill) => _SkillChip(label: skill))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;

  const _SkillChip({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: AppTheme.backgroundWhite,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppTheme.borderGray,
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: AppTheme.bodyMedium.copyWith(
          fontSize: 13,
          color: AppTheme.textGray,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
