import 'package:flutter/material.dart';
import '../utils/app_theme.dart';
import '../data/portfolio_data.dart';
import 'dart:html' as html;

class ProjectsBento extends StatelessWidget {
  const ProjectsBento({super.key});

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
            'Featured Projects',
            style: isMobile
                ? AppTheme.headlineMedium
                : AppTheme.headlineLarge,
          ),
          const SizedBox(height: AppTheme.space2),
          Text(
            'A selection of projects I\'ve worked on',
            style: AppTheme.bodyLarge,
          ),
          const SizedBox(height: AppTheme.space6),

          // Projects Grid
          _buildProjectsGrid(isMobile),
        ],
      ),
    );
  }

  Widget _buildProjectsGrid(bool isMobile) {
    if (isMobile) {
      return Column(
        children: PortfolioData.projects
            .map((project) => Padding(
                  padding: const EdgeInsets.only(bottom: AppTheme.space3),
                  child: _ProjectCard(project: project, isMobile: true),
                ))
            .toList(),
      );
    }

    // Desktop/Tablet: 2 columns
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppTheme.space3,
        mainAxisSpacing: AppTheme.space3,
        childAspectRatio: 1.0,
      ),
      itemCount: PortfolioData.projects.length,
      itemBuilder: (context, index) {
        return _ProjectCard(project: PortfolioData.projects[index], isMobile: false);
      },
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
        padding: EdgeInsets.all(widget.isMobile ? AppTheme.space3 : 20),
        decoration: AppTheme.bentoCardDecoration().copyWith(
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppTheme.primaryBlue.withOpacity(0.1),
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
            // Title
            Text(
              widget.project['title'] as String,
              style: AppTheme.titleLarge.copyWith(
                color: AppTheme.textDark,
                fontSize: widget.isMobile ? 20 : 18,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: widget.isMobile ? 12 : 10),

            // Description
            Text(
              widget.project['description'] as String,
              style: AppTheme.bodyMedium.copyWith(
                fontSize: widget.isMobile ? 15 : 14,
              ),
              maxLines: widget.isMobile ? 5 : 3,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),

            // Tech Stack
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: tech
                  .take(4)
                  .map((t) => _TechChip(label: t))
                  .toList(),
            ),
            SizedBox(height: widget.isMobile ? 12 : 10),

            // Links
            if (links.isNotEmpty)
              Wrap(
                spacing: 12,
                runSpacing: 8,
                children: links.entries.map((entry) {
                  return _LinkButton(
                    label: entry.key,
                    url: entry.value as String,
                    isCompact: !widget.isMobile,
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }
}

class _TechChip extends StatelessWidget {
  final String label;

  const _TechChip({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: AppTheme.primaryBlue.withOpacity(0.08),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: AppTheme.primaryBlue.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: AppTheme.labelLarge.copyWith(
          color: AppTheme.primaryBlue,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _LinkButton extends StatefulWidget {
  final String label;
  final String url;
  final bool isCompact;

  const _LinkButton({
    required this.label,
    required this.url,
    this.isCompact = false,
  });

  @override
  State<_LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<_LinkButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => html.window.open(widget.url, '_blank'),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            horizontal: widget.isCompact ? 12 : 16,
            vertical: widget.isCompact ? 6 : 8,
          ),
          decoration: BoxDecoration(
            color: _isHovered
                ? AppTheme.primaryBlue
                : AppTheme.primaryBlue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
            border: Border.all(
              color: AppTheme.primaryBlue,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _getIconForLabel(widget.label),
                size: widget.isCompact ? 14 : 16,
                color: _isHovered ? Colors.white : AppTheme.primaryBlue,
              ),
              const SizedBox(width: 5),
              Text(
                widget.label,
                style: AppTheme.labelLarge.copyWith(
                  color: _isHovered ? Colors.white : AppTheme.primaryBlue,
                  fontWeight: FontWeight.w600,
                  fontSize: widget.isCompact ? 11 : 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIconForLabel(String label) {
    switch (label.toLowerCase()) {
      case 'github':
        return Icons.code;
      case 'playstore':
        return Icons.shop;
      case 'user':
      case 'delivery':
      case 'merchant':
        return Icons.open_in_new;
      default:
        return Icons.link;
    }
  }
}
