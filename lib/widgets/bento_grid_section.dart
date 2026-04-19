import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class BentoGridSection extends StatelessWidget {
  const BentoGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? AppTheme.space3 : AppTheme.space8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style: isMobile
                ? AppTheme.headlineMedium
                : AppTheme.headlineLarge,
          ),
          const SizedBox(height: AppTheme.space6),

          // Bento Grid Layout
          if (isMobile)
            _buildMobileGrid()
          else if (isTablet)
            _buildTabletGrid()
          else
            _buildDesktopGrid(),
        ],
      ),
    );
  }

  Widget _buildMobileGrid() {
    return Column(
      children: [
        _BentoCard(
          height: 300,
          color: AppTheme.primaryBlue.withOpacity(0.05),
          child: _buildExperienceCard(),
        ),
        const SizedBox(height: AppTheme.space2),
        _BentoCard(
          height: 250,
          child: _buildLocationCard(),
        ),
        const SizedBox(height: AppTheme.space2),
        _BentoCard(
          height: 280,
          color: AppTheme.lightBlue.withOpacity(0.05),
          child: _buildAchievementsCard(),
        ),
        const SizedBox(height: AppTheme.space2),
        _BentoCard(
          height: 200,
          child: _buildContactCard(),
        ),
      ],
    );
  }

  Widget _buildTabletGrid() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: _BentoCard(
                height: 350,
                color: AppTheme.primaryBlue.withOpacity(0.05),
                child: _buildExperienceCard(),
              ),
            ),
            const SizedBox(width: AppTheme.space2),
            Expanded(
              child: _BentoCard(
                height: 350,
                child: _buildLocationCard(),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppTheme.space2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _BentoCard(
                height: 250,
                color: AppTheme.lightBlue.withOpacity(0.05),
                child: _buildAchievementsCard(),
              ),
            ),
            const SizedBox(width: AppTheme.space2),
            Expanded(
              child: _BentoCard(
                height: 250,
                child: _buildContactCard(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDesktopGrid() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: _BentoCard(
                height: 400,
                color: AppTheme.primaryBlue.withOpacity(0.05),
                child: _buildExperienceCard(),
              ),
            ),
            const SizedBox(width: AppTheme.space3),
            Expanded(
              child: Column(
                children: [
                  _BentoCard(
                    height: 190,
                    child: _buildLocationCard(),
                  ),
                  const SizedBox(height: AppTheme.space3),
                  _BentoCard(
                    height: 190,
                    child: _buildContactCard(),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: AppTheme.space3),
        _BentoCard(
          height: 280,
          color: AppTheme.lightBlue.withOpacity(0.05),
          child: _buildAchievementsCard(),
        ),
      ],
    );
  }

  Widget _buildExperienceCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.space2,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.primaryBlue,
                  borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
                ),
                child: Text(
                  'EXPERIENCE',
                  style: AppTheme.labelLarge.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '4+ Years',
                style: AppTheme.displayMedium.copyWith(
                  color: AppTheme.primaryBlue,
                  fontSize: 42,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Building scalable mobile applications with Flutter',
                style: AppTheme.bodyLarge.copyWith(
                  fontSize: 16,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _StatBadge(label: 'Flutter', icon: Icons.phone_android),
            _StatBadge(label: 'Clean Code', icon: Icons.code),
            _StatBadge(label: 'Remote', icon: Icons.location_on),
          ],
        ),
      ],
    );
  }

  Widget _buildLocationCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.location_city,
          size: 28,
          color: AppTheme.primaryBlue,
        ),
        const SizedBox(height: 10),
        Text(
          'Based in',
          style: AppTheme.bodyMedium.copyWith(
            color: AppTheme.textLight,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Mansoura, Egypt',
          style: AppTheme.titleLarge.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildAchievementsCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Key Achievements',
          style: AppTheme.titleLarge.copyWith(
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 20),
        Flexible(
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _AchievementItem(
                icon: Icons.trending_up,
                title: '99.2%',
                subtitle: 'App Stability',
              ),
              _AchievementItem(
                icon: Icons.speed,
                title: '30%',
                subtitle: 'Faster Dev Cycles',
              ),
              _AchievementItem(
                icon: Icons.timer,
                title: '30%',
                subtitle: 'Improved Load Time',
              ),
              _AchievementItem(
                icon: Icons.bug_report,
                title: '40%',
                subtitle: 'Less Bugs',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.email_outlined,
          size: 28,
          color: AppTheme.primaryBlue,
        ),
        const SizedBox(height: 10),
        Text(
          'Ready to work',
          style: AppTheme.titleLarge.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 6),
        Text(
          'Let\'s build amazing apps',
          style: AppTheme.bodyMedium.copyWith(
            fontSize: 12,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class _BentoCard extends StatefulWidget {
  final Widget child;
  final double height;
  final Color? color;

  const _BentoCard({
    required this.child,
    required this.height,
    this.color,
  });

  @override
  State<_BentoCard> createState() => _BentoCardState();
}

class _BentoCardState extends State<_BentoCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: widget.height,
        padding: EdgeInsets.all(isMobile ? AppTheme.space3 : AppTheme.space4),
        decoration: AppTheme.bentoCardDecoration(
          backgroundColor: widget.color,
        ).copyWith(
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
        child: widget.child,
      ),
    );
  }
}

class _StatBadge extends StatelessWidget {
  final String label;
  final IconData icon;

  const _StatBadge({
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: AppTheme.cardWhite,
        borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
        border: Border.all(
          color: AppTheme.borderGray,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: AppTheme.primaryBlue,
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: AppTheme.labelLarge.copyWith(
              color: AppTheme.textDark,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _AchievementItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _AchievementItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.cardWhite,
        borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
        border: Border.all(
          color: AppTheme.borderGray,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 22,
            color: AppTheme.primaryBlue,
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: AppTheme.titleLarge.copyWith(
              color: AppTheme.primaryBlue,
              fontSize: 20,
            ),
          ),
          Text(
            subtitle,
            style: AppTheme.bodyMedium.copyWith(
              fontSize: 12,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
