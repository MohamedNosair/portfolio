import 'package:flutter/material.dart';
import '../utils/app_theme.dart';
import '../data/portfolio_data.dart';
import 'dart:html' as html;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? AppTheme.space3 : AppTheme.space8,
        vertical: isMobile ? AppTheme.space8 : AppTheme.space10,
      ),
      child: Column(
        children: [
          // Header
          Text(
            'Let\'s Work Together',
            style: isMobile
                ? AppTheme.headlineMedium
                : AppTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppTheme.space2),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Text(
              'I\'m currently available for new opportunities and collaborations. Feel free to reach out!',
              style: AppTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppTheme.space8),

          // Contact Cards
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: isMobile
                ? Column(
                    children: [
                      _ContactCard(
                        icon: Icons.email_outlined,
                        title: 'Email',
                        subtitle: PortfolioData.email,
                        onTap: () => _launchEmail(),
                      ),
                      const SizedBox(height: AppTheme.space2),
                      _ContactCard(
                        icon: Icons.code,
                        title: 'GitHub',
                        subtitle: '@MohamedNosair',
                        onTap: () => _launchURL(PortfolioData.github),
                      ),
                      const SizedBox(height: AppTheme.space2),
                      _ContactCard(
                        icon: Icons.business_center,
                        title: 'LinkedIn',
                        subtitle: 'Mohamed Nosair',
                        onTap: () => _launchURL(PortfolioData.linkedin),
                      ),
                      const SizedBox(height: AppTheme.space2),
                      _ContactCard(
                        icon: Icons.phone,
                        title: 'Phone',
                        subtitle: PortfolioData.phone,
                        onTap: () => _launchPhone(),
                      ),
                      const SizedBox(height: AppTheme.space2),
                      _ContactCard(
                        icon: Icons.chat,
                        title: 'WhatsApp',
                        subtitle: PortfolioData.whatsapp,
                        onTap: () => _launchWhatsApp(),
                      ),
                    ],
                  )
                : Wrap(
                    spacing: AppTheme.space3,
                    runSpacing: AppTheme.space3,
                    children: [
                      SizedBox(
                        width: (900 - AppTheme.space3) / 2,
                        child: _ContactCard(
                          icon: Icons.email_outlined,
                          title: 'Email',
                          subtitle: PortfolioData.email,
                          onTap: () => _launchEmail(),
                        ),
                      ),
                      SizedBox(
                        width: (900 - AppTheme.space3) / 2,
                        child: _ContactCard(
                          icon: Icons.code,
                          title: 'GitHub',
                          subtitle: '@MohamedNosair',
                          onTap: () => _launchURL(PortfolioData.github),
                        ),
                      ),
                      SizedBox(
                        width: (900 - AppTheme.space3) / 2,
                        child: _ContactCard(
                          icon: Icons.business_center,
                          title: 'LinkedIn',
                          subtitle: 'Mohamed Nosair',
                          onTap: () => _launchURL(PortfolioData.linkedin),
                        ),
                      ),
                      SizedBox(
                        width: (900 - AppTheme.space3) / 2,
                        child: _ContactCard(
                          icon: Icons.phone,
                          title: 'Phone',
                          subtitle: PortfolioData.phone,
                          onTap: () => _launchPhone(),
                        ),
                      ),
                      SizedBox(
                        width: (900 - AppTheme.space3) / 2,
                        child: _ContactCard(
                          icon: Icons.chat,
                          title: 'WhatsApp',
                          subtitle: PortfolioData.whatsapp,
                          onTap: () => _launchWhatsApp(),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) {
    html.window.open(url, '_blank');
  }

  void _launchEmail() {
    html.window.open('mailto:${PortfolioData.email}', '_blank');
  }

  void _launchPhone() {
    html.window.open('tel:${PortfolioData.phone}', '_blank');
  }

  void _launchWhatsApp() {
    final whatsappNumber = PortfolioData.whatsapp.replaceAll('+', '').replaceAll(' ', '');
    html.window.open('https://wa.me/$whatsappNumber', '_blank');
  }
}

class _ContactCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ContactCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(AppTheme.space4),
          decoration: AppTheme.bentoCardDecoration(
            backgroundColor: _isHovered
                ? AppTheme.primaryBlue.withOpacity(0.05)
                : AppTheme.cardWhite,
            borderColor: _isHovered
                ? AppTheme.primaryBlue.withOpacity(0.3)
                : AppTheme.borderGray,
          ).copyWith(
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: AppTheme.primaryBlue.withOpacity(0.15),
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
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(AppTheme.space2),
                decoration: BoxDecoration(
                  color: _isHovered
                      ? AppTheme.primaryBlue
                      : AppTheme.primaryBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
                ),
                child: Icon(
                  widget.icon,
                  size: 28,
                  color: _isHovered ? Colors.white : AppTheme.primaryBlue,
                ),
              ),
              const SizedBox(width: AppTheme.space3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      style: AppTheme.bodyMedium.copyWith(
                        color: AppTheme.textLight,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.subtitle,
                      style: AppTheme.bodyLarge.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textDark,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: _isHovered ? AppTheme.primaryBlue : AppTheme.textLight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
