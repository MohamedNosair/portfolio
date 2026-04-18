import 'package:flutter/material.dart';
import '../utils/app_theme.dart';
import '../data/portfolio_data.dart';

class ExperienceTimeline extends StatelessWidget {
  const ExperienceTimeline({super.key});

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
            'Work Experience',
            style: isMobile
                ? AppTheme.headlineMedium
                : AppTheme.headlineLarge,
          ),
          const SizedBox(height: AppTheme.space6),

          // Timeline
          ...PortfolioData.experiences.asMap().entries.map((entry) {
            final index = entry.key;
            final experience = entry.value;
            final isLast = index == PortfolioData.experiences.length - 1;

            return _TimelineItem(
              experience: experience,
              isLast: isLast,
              isMobile: isMobile,
            );
          }),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatefulWidget {
  final Map<String, dynamic> experience;
  final bool isLast;
  final bool isMobile;

  const _TimelineItem({
    required this.experience,
    required this.isLast,
    required this.isMobile,
  });

  @override
  State<_TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends State<_TimelineItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final achievements = List<String>.from(widget.experience['achievements'] as List);
    final colorString = widget.experience['color'] as String;
    final color = _parseColor(colorString);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: widget.isLast ? 0 : AppTheme.space4,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline Line
            Column(
              children: [
                // Circle
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: _isHovered ? 24 : 20,
                  height: _isHovered ? 24 : 20,
                  decoration: BoxDecoration(
                    color: _isHovered ? color : AppTheme.cardWhite,
                    border: Border.all(
                      color: color,
                      width: 3,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                // Vertical line
                if (!widget.isLast)
                  Container(
                    width: 2,
                    height: widget.isMobile ? 180 : 220,
                    color: AppTheme.borderGray,
                  ),
              ],
            ),
            const SizedBox(width: AppTheme.space3),

            // Content Card
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(AppTheme.space4),
                decoration: AppTheme.bentoCardDecoration().copyWith(
                  boxShadow: _isHovered
                      ? [
                          BoxShadow(
                            color: color.withOpacity(0.15),
                            blurRadius: 24,
                            offset: const Offset(0, 8),
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
                    // Header
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.experience['position'] as String,
                                style: AppTheme.titleLarge.copyWith(
                                  color: AppTheme.textDark,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                widget.experience['company'] as String,
                                style: AppTheme.bodyLarge.copyWith(
                                  color: color,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppTheme.space2,
                            vertical: AppTheme.space1,
                          ),
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.1),
                            borderRadius:
                                BorderRadius.circular(AppTheme.radiusSmall),
                            border: Border.all(
                              color: color.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            widget.experience['period'] as String,
                            style: AppTheme.labelLarge.copyWith(
                              color: color,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppTheme.space1),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 16,
                          color: AppTheme.textLight,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          widget.experience['location'] as String,
                          style: AppTheme.bodyMedium.copyWith(
                            color: AppTheme.textLight,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppTheme.space3),

                    // Achievements
                    ...achievements.map((achievement) => Padding(
                          padding: const EdgeInsets.only(
                            bottom: AppTheme.space1,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: color,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: AppTheme.space2),
                              Expanded(
                                child: Text(
                                  achievement,
                                  style: AppTheme.bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _parseColor(String colorString) {
    final hexColor = colorString.replaceAll('#', '');
    return Color(int.parse('FF$hexColor', radix: 16));
  }
}
