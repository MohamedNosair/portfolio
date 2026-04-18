import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

/// Professional Avatar with gradient background
class ProfileAvatar extends StatelessWidget {
  final double size;

  const ProfileAvatar({
    super.key,
    this.size = 120,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryBlue.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
        image: const DecorationImage(
          image: AssetImage('assets/images/profile.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

/// Project preview image with gradient background and icon
class ProjectImage extends StatelessWidget {
  final IconData icon;
  final List<Color> gradientColors;
  final double height;

  const ProjectImage({
    super.key,
    required this.icon,
    required this.gradientColors,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
        ),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppTheme.radiusMedium),
        ),
      ),
      child: Stack(
        children: [
          // Decorative circles
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          Positioned(
            bottom: -30,
            left: -30,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          // Icon
          Center(
            child: Icon(
              icon,
              size: 80,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }
}

/// Decorative background pattern
class DecorativePattern extends StatelessWidget {
  const DecorativePattern({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DotPatternPainter(),
      size: const Size(double.infinity, 400),
    );
  }
}

class _DotPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.borderGray
      ..style = PaintingStyle.fill;

    const spacing = 30.0;
    const dotSize = 2.0;

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), dotSize, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Skill icon with background
class SkillIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;

  const SkillIcon({
    super.key,
    required this.icon,
    this.color = AppTheme.primaryBlue,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size + 16,
      height: size + 16,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        icon,
        size: size,
        color: color,
      ),
    );
  }
}

/// Company logo placeholder
class CompanyLogo extends StatelessWidget {
  final String companyName;
  final Color color;

  const CompanyLogo({
    super.key,
    required this.companyName,
    this.color = AppTheme.primaryBlue,
  });

  @override
  Widget build(BuildContext context) {
    final initial = companyName.substring(0, 1).toUpperCase();

    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          initial,
          style: AppTheme.headlineMedium.copyWith(
            color: color,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

/// Floating shapes decoration
class FloatingShapes extends StatelessWidget {
  const FloatingShapes({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 100,
          right: 50,
          child: _FloatingShape(
            size: 80,
            color: AppTheme.lightBlue.withOpacity(0.1),
          ),
        ),
        Positioned(
          bottom: 150,
          left: 80,
          child: _FloatingShape(
            size: 120,
            color: AppTheme.primaryBlue.withOpacity(0.05),
          ),
        ),
        Positioned(
          top: 300,
          left: 200,
          child: _FloatingShape(
            size: 60,
            color: AppTheme.lightBlue.withOpacity(0.08),
          ),
        ),
      ],
    );
  }
}

class _FloatingShape extends StatelessWidget {
  final double size;
  final Color color;

  const _FloatingShape({
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
