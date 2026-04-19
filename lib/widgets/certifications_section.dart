import 'package:flutter/material.dart';
import '../utils/app_theme.dart';
import '../data/certificates_data.dart';

class CertificationsSection extends StatelessWidget {
  const CertificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? AppTheme.space3 : AppTheme.space8,
        vertical: isMobile ? AppTheme.space6 : AppTheme.space10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Certifications & Achievements',
            style: isMobile
                ? AppTheme.headlineMedium
                : AppTheme.headlineLarge,
          ),
          const SizedBox(height: AppTheme.space2),
          Text(
            'Professional certifications and learning achievements',
            style: AppTheme.bodyLarge.copyWith(
              color: AppTheme.textGray,
            ),
          ),
          const SizedBox(height: AppTheme.space6),

          // Horizontal Scrollable Certificates
          SizedBox(
            height: isMobile ? 500 : 540,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: CertificatesData.certificates.length,
              padding: EdgeInsets.only(
                right: isMobile ? AppTheme.space3 : AppTheme.space8,
              ),
              itemBuilder: (context, index) {
                final certificate = CertificatesData.certificates[index];
                return Padding(
                  padding: EdgeInsets.only(
                    right: isMobile ? AppTheme.space3 : AppTheme.space4,
                  ),
                  child: SizedBox(
                    width: isMobile ? 320 : 400,
                    child: _CertificateCard(
                      certificate: certificate,
                      isMobile: isMobile,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CertificateCard extends StatefulWidget {
  final Certificate certificate;
  final bool isMobile;

  const _CertificateCard({
    required this.certificate,
    required this.isMobile,
  });

  @override
  State<_CertificateCard> createState() => _CertificateCardState();
}

class _CertificateCardState extends State<_CertificateCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: double.infinity,
        decoration: AppTheme.cardDecoration().copyWith(
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
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 12,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Certificate Image - Fixed height
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppTheme.radiusLarge),
                topRight: Radius.circular(AppTheme.radiusLarge),
              ),
              child: Image.asset(
                widget.certificate.imagePath,
                width: double.infinity,
                height: widget.isMobile ? 220 : 280,
                fit: BoxFit.cover,
              ),
            ),

            // Certificate Info - Flexible content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(
                  widget.isMobile ? AppTheme.space2 : AppTheme.space3,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Organization Badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryBlue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
                      ),
                      child: Text(
                        widget.certificate.organization.toUpperCase(),
                        style: AppTheme.labelLarge.copyWith(
                          color: AppTheme.primaryBlue,
                          fontWeight: FontWeight.w700,
                          fontSize: 10,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Title
                    Text(
                      widget.certificate.title,
                      style: AppTheme.titleLarge.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: widget.isMobile ? 15 : 17,
                        height: 1.3,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),

                    // Role (if exists)
                    if (widget.certificate.role != null) ...[
                      Text(
                        widget.certificate.role!,
                        style: AppTheme.bodyMedium.copyWith(
                          color: AppTheme.textGray,
                          fontSize: 12,
                          height: 1.4,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                    ],

                    // Period
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 14,
                          color: AppTheme.textLight,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            widget.certificate.period,
                            style: AppTheme.bodyMedium.copyWith(
                              color: AppTheme.textLight,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Tags
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: widget.certificate.tags.take(3).map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.cardWhite,
                            borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
                            border: Border.all(
                              color: AppTheme.borderGray,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            tag,
                            style: AppTheme.labelLarge.copyWith(
                              color: AppTheme.textDark,
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          ),
                        );
                      }).toList(),
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
}
