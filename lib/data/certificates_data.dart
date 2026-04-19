class Certificate {
  final String title;
  final String organization;
  final String period;
  final String? role;
  final String imagePath;
  final List<String> tags;

  const Certificate({
    required this.title,
    required this.organization,
    required this.period,
    this.role,
    required this.imagePath,
    required this.tags,
  });
}

class CertificatesData {
  static const List<Certificate> certificates = [
    Certificate(
      title: 'Certificate of Appreciation',
      organization: 'GOOGLE DEVELOPER STUDENT CLUBS',
      period: '2020 - 2021',
      role: 'GDSC Core Team Member',
      imagePath: 'assets/images/gdsc-certificate.jpg',
      tags: ['Leadership', 'Community', 'Google'],
    ),
    Certificate(
      title: 'Digital Egypt Pioneers Program',
      organization: 'Ministry of Communications & Information Technology',
      period: 'Nov 2024 - May 2025',
      role: 'Software Development - Mobile App Developer',
      imagePath: 'assets/images/cert-depi.jpg',
      tags: ['Mobile Development', 'Government Program', 'DEPI'],
    ),
    Certificate(
      title: 'Certificate of Appreciation - 2025 Award',
      organization: 'CLS Learning Solutions & Digital Egypt',
      period: '2025',
      role: 'Digital Egypt Pioneers Initiative',
      imagePath: 'assets/images/cert-cls-appreciation.jpg',
      tags: ['Achievement', 'Excellence', 'MCIT'],
    ),
    Certificate(
      title: 'The Complete 2021 Flutter & Dart Development',
      organization: 'Udemy',
      period: 'Dec 2021',
      role: 'Course Completion - 42 total hours',
      imagePath: 'assets/images/cert-udemy-flutter.jpg',
      tags: ['Flutter', 'Dart', 'Mobile Development'],
    ),
    Certificate(
      title: 'Introduction to Flutter Development Using Dart',
      organization: 'The App Brewery',
      period: 'Sep 2022',
      role: 'Course Completion',
      imagePath: 'assets/images/cert-app-brewery.jpg',
      tags: ['Flutter', 'Dart', 'Mobile Apps'],
    ),
    Certificate(
      title: 'احترف التعامل مع البرمجة OOP الهدفية',
      organization: 'Udemy',
      period: 'Oct 2022',
      role: 'Course Completion - 4.5 total hours',
      imagePath: 'assets/images/cert-udemy-oop.jpg',
      tags: ['OOP', 'Programming', 'Arabic'],
    ),
    Certificate(
      title: 'RALY Gateway Program',
      organization: 'RALY',
      period: '2024',
      role: 'IT Fundamentals, Computer Basics, Networking, and Security',
      imagePath: 'assets/images/cert-raly.jpg',
      tags: ['IT Fundamentals', 'Networking', 'Security'],
    ),
    Certificate(
      title: 'Freelance Caffe Certificate',
      organization: 'ITIDA, TIEC, & Digital Arabia',
      period: '2024',
      role: 'Successfully Completing Freelance Caffe',
      imagePath: 'assets/images/cert-freelance-caffe.jpg',
      tags: ['Freelancing', 'Professional Development'],
    ),
  ];
}
