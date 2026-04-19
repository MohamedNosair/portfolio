import 'package:flutter/material.dart';
import '../utils/app_theme.dart';
import '../data/portfolio_data.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    int crossAxisCount;
    if (isMobile) {
      crossAxisCount = 1;
    } else if (isTablet) {
      crossAxisCount = 2;
    } else {
      crossAxisCount = 4;
    }

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
          const SizedBox(height: AppTheme.space2),
          Text(
            'Technologies and tools I work with',
            style: AppTheme.bodyLarge.copyWith(
              color: AppTheme.textGray,
            ),
          ),
          const SizedBox(height: AppTheme.space6),

          // Skills Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: isMobile ? AppTheme.space2 : AppTheme.space3,
              mainAxisSpacing: isMobile ? AppTheme.space2 : AppTheme.space3,
              childAspectRatio: isMobile ? 1.0 : 0.9,
            ),
            itemCount: PortfolioData.skills.length,
            itemBuilder: (context, index) {
              final entry = PortfolioData.skills.entries.elementAt(index);
              return _SkillCard(
                category: entry.key,
                skills: entry.value,
                isMobile: isMobile,
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
  final bool isMobile;

  const _SkillCard({
    required this.category,
    required this.skills,
    required this.isMobile,
  });

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _isHovered = false;

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'mobile development':
        return Icons.phone_android;
      case 'languages':
        return Icons.code;
      case 'state management':
        return Icons.developer_board;
      case 'architecture':
        return Icons.architecture;
      case 'tools & platforms':
        return Icons.build;
      case 'backend & apis':
        return Icons.api;
      default:
        return Icons.settings;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'mobile development':
        return const Color(0xFF047857); // Emerald
      case 'languages':
        return const Color(0xFF0891B2); // Cyan
      case 'state management':
        return const Color(0xFF7C3AED); // Purple
      case 'architecture':
        return const Color(0xFFDC2626); // Red
      case 'tools & platforms':
        return const Color(0xFFEA580C); // Orange
      case 'backend & apis':
        return const Color(0xFF059669); // Green
      default:
        return AppTheme.primaryBlue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoryColor = _getCategoryColor(widget.category);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: AppTheme.cardDecoration().copyWith(
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: categoryColor.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with icon
            Container(
              padding: EdgeInsets.all(widget.isMobile ? 16 : 18),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    categoryColor.withOpacity(0.1),
                    categoryColor.withOpacity(0.05),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppTheme.radiusLarge),
                  topRight: Radius.circular(AppTheme.radiusLarge),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: categoryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      _getCategoryIcon(widget.category),
                      color: Colors.white,
                      size: widget.isMobile ? 18 : 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.category,
                      style: AppTheme.titleLarge.copyWith(
                        color: AppTheme.textDark,
                        fontSize: widget.isMobile ? 15 : 16,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            // Skills
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(widget.isMobile ? 16 : 18),
                child: Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: widget.skills
                      .map((skill) => _SkillChip(
                            label: skill,
                            color: categoryColor,
                          ))
                      .toList(),
                ),
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
  final Color color;

  const _SkillChip({
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: AppTheme.bodyMedium.copyWith(
          fontSize: 12,
          color: AppTheme.textDark,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
