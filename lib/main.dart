import 'package:flutter/material.dart';
import 'utils/app_theme.dart';
import 'widgets/hero_section.dart';
import 'widgets/bento_grid_section.dart';
import 'widgets/projects_bento.dart';
import 'widgets/skills_section.dart';
import 'widgets/experience_timeline.dart';
import 'widgets/contact_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mohamed Nosair | Senior Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  bool _showScrollToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.offset > 300 && !_showScrollToTop) {
      setState(() => _showScrollToTop = true);
    } else if (_scrollController.offset <= 300 && _showScrollToTop) {
      setState(() => _showScrollToTop = false);
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundWhite,
      body: Stack(
        children: [
          // Animated Background
          const _AnimatedBackground(),

          // Main Content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Navigation Bar
                _buildNavBar(context),

                // Main Content
                const HeroSection(),
                const SizedBox(height: AppTheme.space12),

                Container(
                  key: _aboutKey,
                  child: const BentoGridSection(),
                ),
                const SizedBox(height: AppTheme.space12),

                Container(
                  key: _projectsKey,
                  child: const ProjectsBento(),
                ),
                const SizedBox(height: AppTheme.space12),

                const SkillsSection(),
                const SizedBox(height: AppTheme.space12),

                Container(
                  key: _experienceKey,
                  child: const ExperienceTimeline(),
                ),
                const SizedBox(height: AppTheme.space12),

                Container(
                  key: _contactKey,
                  child: const ContactSection(),
                ),
                const SizedBox(height: AppTheme.space8),

                // Footer
                _buildFooter(),
              ],
            ),
          ),

          // Scroll to Top Button
          if (_showScrollToTop)
            Positioned(
              bottom: 24,
              right: 24,
              child: _ScrollToTopButton(onPressed: _scrollToTop),
            ),
        ],
      ),
    );
  }

  Widget _buildNavBar(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? AppTheme.space3 : AppTheme.space8,
        vertical: AppTheme.space3,
      ),
      decoration: BoxDecoration(
        color: AppTheme.cardWhite.withOpacity(0.95),
        border: Border(
          bottom: BorderSide(
            color: AppTheme.borderGray,
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'MN',
            style: AppTheme.headlineMedium.copyWith(
              color: AppTheme.primaryBlue,
              fontWeight: FontWeight.w800,
            ),
          ),
          if (!isMobile)
            Row(
              children: [
                _NavLink(
                  text: 'About',
                  onTap: () => _scrollToSection(_aboutKey),
                ),
                const SizedBox(width: AppTheme.space4),
                _NavLink(
                  text: 'Projects',
                  onTap: () => _scrollToSection(_projectsKey),
                ),
                const SizedBox(width: AppTheme.space4),
                _NavLink(
                  text: 'Experience',
                  onTap: () => _scrollToSection(_experienceKey),
                ),
                const SizedBox(width: AppTheme.space4),
                _NavLink(
                  text: 'Contact',
                  onTap: () => _scrollToSection(_contactKey),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.space4),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppTheme.borderGray,
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: Text(
          '© 2024 Mohamed Nosair. Built with Flutter.',
          style: AppTheme.bodyMedium.copyWith(
            color: AppTheme.textLight,
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const _NavLink({
    required this.text,
    required this.onTap,
  });

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: AppTheme.bodyLarge.copyWith(
            color: _isHovered ? AppTheme.primaryBlue : AppTheme.textGray,
            fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w400,
          ),
          child: Text(widget.text),
        ),
      ),
    );
  }
}

// Scroll to Top Button
class _ScrollToTopButton extends StatefulWidget {
  final VoidCallback onPressed;

  const _ScrollToTopButton({required this.onPressed});

  @override
  State<_ScrollToTopButton> createState() => _ScrollToTopButtonState();
}

class _ScrollToTopButtonState extends State<_ScrollToTopButton>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      cursor: SystemMouseCursors.click,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: GestureDetector(
          onTap: widget.onPressed,
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppTheme.primaryBlue,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryBlue.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Icon(
              Icons.arrow_upward_rounded,
              color: Colors.white,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }
}

// Professional Background with Emerald Green Gradient
class _AnimatedBackground extends StatelessWidget {
  const _AnimatedBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topLeft,
          radius: 1.5,
          colors: [
            const Color(0xFFD1FAE5), // Light emerald/mint
            const Color(0xFFF0FDF4), // Very light green
            Colors.white,
            Colors.white,
          ],
          stops: const [0.0, 0.3, 0.6, 1.0],
        ),
      ),
      child: Stack(
        children: [
          // Subtle decorative circles in emerald tones
          Positioned(
            top: 100,
            right: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppTheme.primaryBlue.withOpacity(0.04),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 200,
            left: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppTheme.lightBlue.withOpacity(0.05),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 500,
            right: 150,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppTheme.primaryBlue.withOpacity(0.03),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

