import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/app_theme.dart';
import '../data/portfolio_data.dart';
import 'dart:html' as html;

class ProjectsBento extends StatelessWidget {
  const ProjectsBento({super.key});

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
      crossAxisCount = 3;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? AppTheme.space3 : AppTheme.space8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Featured Projects',
            style: isMobile
                ? AppTheme.headlineMedium
                : AppTheme.headlineLarge,
          ),
          const SizedBox(height: AppTheme.space2),
          Text(
            'A selection of projects I\'ve worked on',
            style: AppTheme.bodyLarge.copyWith(
              color: AppTheme.textGray,
            ),
          ),
          const SizedBox(height: AppTheme.space6),

          // Projects Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: isMobile ? AppTheme.space2 : AppTheme.space3,
              mainAxisSpacing: isMobile ? AppTheme.space2 : AppTheme.space3,
              childAspectRatio: isMobile ? 1.1 : 1.15,
            ),
            itemCount: PortfolioData.projects.length,
            itemBuilder: (context, index) {
              return _ProjectCard(
                project: PortfolioData.projects[index],
                isMobile: isMobile,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;
  final bool isMobile;

  const _ProjectCard({
    required this.project,
    required this.isMobile,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final tech = List<String>.from(widget.project['tech'] as List);
    final links = Map<String, dynamic>.from(widget.project['links'] as Map);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: AppTheme.cardDecoration().copyWith(
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppTheme.primaryBlue.withOpacity(0.2),
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
            // Header with icon and links
            Container(
              padding: EdgeInsets.all(widget.isMobile ? 16 : 18),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppTheme.primaryBlue.withOpacity(0.08),
                    AppTheme.lightBlue.withOpacity(0.05),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppTheme.radiusLarge),
                  topRight: Radius.circular(AppTheme.radiusLarge),
                ),
              ),
              child: Row(
                children: [
                  // Project Icon
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.code,
                      color: Colors.white,
                      size: widget.isMobile ? 20 : 22,
                    ),
                  ),
                  const Spacer(),
                  // Links
                  if (links.isNotEmpty)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: links.entries.map((entry) {
                        final url = entry.value as String;
                        return Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: _IconButton(
                            icon: _getIconForUrl(entry.key, url),
                            url: url,
                            tooltip: _getTooltipText(entry.key, url),
                          ),
                        );
                      }).toList(),
                    ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(widget.isMobile ? 16 : 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      widget.project['title'] as String,
                      style: AppTheme.titleLarge.copyWith(
                        color: AppTheme.textDark,
                        fontSize: widget.isMobile ? 17 : 18,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),

                    // Description
                    Expanded(
                      child: Text(
                        widget.project['description'] as String,
                        style: AppTheme.bodyMedium.copyWith(
                          fontSize: widget.isMobile ? 13 : 14,
                          color: AppTheme.textGray,
                          height: 1.5,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Tech Stack
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: tech
                          .take(3)
                          .map((t) => _TechBadge(label: t))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForUrl(String label, String url) {
    // Check if URL is GitHub
    if (url.contains('github.com')) {
      return FontAwesomeIcons.github;
    }
    // Check if URL is PlayStore
    if (url.contains('play.google.com')) {
      return FontAwesomeIcons.googlePlay;
    }
    // Check by label as fallback
    switch (label.toLowerCase()) {
      case 'github':
        return FontAwesomeIcons.github;
      case 'playstore':
        return FontAwesomeIcons.googlePlay;
      default:
        return Icons.open_in_new_rounded;
    }
  }

  String _getTooltipText(String label, String url) {
    if (url.contains('github.com')) {
      return 'View on GitHub';
    }
    if (url.contains('play.google.com')) {
      return 'Download on PlayStore';
    }
    return label.toUpperCase();
  }
}

class _IconButton extends StatefulWidget {
  final IconData icon;
  final String url;
  final String tooltip;

  const _IconButton({
    required this.icon,
    required this.url,
    required this.tooltip,
  });

  @override
  State<_IconButton> createState() => _IconButtonState();
}

class _IconButtonState extends State<_IconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => html.window.open(widget.url, '_blank'),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _isHovered
                  ? AppTheme.primaryBlue
                  : AppTheme.cardWhite,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _isHovered
                    ? AppTheme.primaryBlue
                    : AppTheme.borderGray,
                width: 1,
              ),
            ),
            child: FaIcon(
              widget.icon,
              size: 16,
              color: _isHovered ? Colors.white : AppTheme.textGray,
            ),
          ),
        ),
      ),
    );
  }
}

class _TechBadge extends StatelessWidget {
  final String label;

  const _TechBadge({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: AppTheme.cardWhite,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: AppTheme.primaryBlue.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: AppTheme.labelLarge.copyWith(
          color: AppTheme.primaryBlue,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
