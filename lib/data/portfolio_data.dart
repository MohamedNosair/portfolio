class PortfolioData {
  // Personal Info
  static const String name = 'Mohamed Al Sayed Nosair';
  static const String title = 'Senior Flutter Developer';
  static const String location = 'Mansoura, Egypt';
  static const String email = 'mohamednosair142@gmail.com';
  static const String phone = '+201011837228';
  static const String whatsapp = '+201277890731';
  static const String github = 'https://github.com/MohamedNosair';
  static const String linkedin = 'https://linkedin.com/in/mohamed-nosair-11b814192';

  // About
  static const String aboutSummary1 =
      "I'm a Senior Flutter Developer with over 4 years of hands-on experience "
      "building scalable mobile applications using Flutter, Dart, Firebase, Supabase, and clean architecture.";

  static const String aboutSummary2 =
      "I have a strong background in state management (Bloc/Cubit/Provider), API integration, Stripe payments, "
      "Google Maps, and CI/CD. I'm passionate about writing clean, maintainable, and testable code with a "
      "strong focus on UI/UX and app performance.";

  static const String aboutSummary3 =
      "Currently working remotely with Bright in Saudi Arabia, where I've implemented advanced features like "
      "Google Maps integration, Stripe payment flows, and clean architecture patterns that improved app stability "
      "from 95% to 99.2% and reduced development cycles by 30%.";

  // Projects
  static final List<Map<String, dynamic>> projects = [
    {
      'title': 'FoodKing - Complete Food Delivery System',
      'description': 'Built a complete food delivery ecosystem with three apps: User app for ordering, Delivery app for drivers, and Merchant app for restaurants. Implemented real-time order tracking, menu management, and backend integration.',
      'tech': ['Flutter', 'Firebase', 'Supabase', 'REST APIs', 'Clean Architecture', 'Bloc'],
      'gradient': ['#F97316', '#EF4444'],
      'links': {
        'user': 'https://play.google.com/store/apps/details?id=com.inilabs.foodking',
        'delivery': 'https://play.google.com/store/apps/details?id=com.inilabs.foodking.delivery',
        'merchant': 'https://play.google.com/store/apps/details?id=com.inilabs.foodking.merchant',
      },
    },
    {
      'title': 'Shortzz - Short Video Platform',
      'description': 'Architected a high-performance short-video app inspired by TikTok. Designed smooth vertical video feed with advanced caching, real-time interactions, and optimized playback for low-end devices.',
      'tech': ['Flutter', 'Clean Architecture', 'Video Processing', 'Caching', 'SOLID Principles'],
      'gradient': ['#8B5CF6', '#EC4899'],
      'links': {
        'playstore': 'https://play.google.com/store/apps/details?id=com.retrytech.app.shortzz',
      },
    },
    {
      'title': 'Mighty Fitness',
      'description': 'Built a comprehensive fitness tracking app with workout plans, progress tracking, and performance analytics. Designed intuitive UI/UX for seamless experience.',
      'tech': ['Flutter', 'Firebase', 'State Management', 'Analytics', 'UI/UX Design'],
      'gradient': ['#10B981', '#059669'],
      'links': {
        'playstore': 'https://play.google.com/store/apps/details?id=com.mighty.fitness',
      },
    },
    {
      'title': 'Fruit Hub - E-Commerce App',
      'description': 'E-commerce app with social login (Google, Facebook, Apple), product listing, cart, checkout with Stripe integration, and order history using Firebase & Supabase.',
      'tech': ['Flutter', 'Stripe', 'Firebase Auth', 'Supabase', 'Bloc', 'Clean Architecture'],
      'gradient': ['#3B82F6', '#06B6D4'],
      'links': {
        'github': 'https://github.com/MohamedNosair/Fruit_App',
      },
    },
    {
      'title': 'Bright - Clinic Appointment Booking',
      'description': 'Full appointment booking system with Firebase authentication, real-time schedules, push notifications, reminders, and Google Maps integration for clinic locations.',
      'tech': ['Flutter', 'Firebase', 'Google Maps', 'Push Notifications', 'Real-time DB'],
      'gradient': ['#6366F1', '#8B5CF6'],
      'links': {},
    },
    {
      'title': 'Cairo Metro - Pathfinding System',
      'description': 'Built offline metro navigation system with DFS algorithm for route exploration. Multi-platform UI with modern Android development using Kotlin.',
      'tech': ['Flutter', 'Kotlin', 'Android', 'Algorithms', 'Offline-First'],
      'gradient': ['#EAB308', '#F97316'],
      'links': {
        'github': 'https://github.com/RAMD-hub/CairoMetroApp/tree/main',
      },
    },
  ];

  // Skills
  static final Map<String, List<String>> skills = {
    'Flutter & Mobile': [
      'Flutter', 'Dart', 'Bloc', 'Cubit', 'Provider', 'Clean Architecture',
      'MVVM', 'Freezed', 'Retrofit', 'Animations', 'Flavors', 'Dependency Injection'
    ],
    'Backend & Integration': [
      'Firebase Auth', 'Firestore', 'FCM', 'Firebase Analytics', 'App Distribution',
      'Supabase', 'Google Maps SDK', 'Stripe Payment', 'REST APIs',
      'Push Notifications', 'Hive', 'Shared Preferences', 'SQLite'
    ],
    'Tools & Workflow': [
      'Git', 'GitHub', 'GitHub Actions', 'CI/CD', 'VS Code', 'Android Studio',
      'Postman', 'Trello', 'Slack', 'ClickUp', 'CLI', 'Fastlane'
    ],
    'Programming': [
      'Dart', 'Java', 'Kotlin', 'TypeScript', 'JavaScript',
      'OOP', 'SOLID Principles', 'Design Patterns'
    ],
  };

  // Experience
  static final List<Map<String, dynamic>> experiences = [
    {
      'company': 'Bright',
      'location': 'Remote, Saudi Arabia',
      'position': 'Flutter Developer',
      'period': '2024 - Present',
      'achievements': [
        'Implemented Google Maps APIs, geolocation, and advanced map-based features',
        'Built complete payment flows using Stripe with secure card payments and backend validation',
        'Designed clean architecture using Bloc/Cubit reducing state-related bugs by 40%',
        'Improved app stability score from 95% to 99.2%',
        'Achieved 30% faster feature development cycles',
        'Improved overall app performance resulting in 30% faster load time',
      ],
      'color': '#3B82F6',
    },
    {
      'company': 'IT Stellar',
      'location': 'Remote, Saudi Arabia',
      'position': 'Flutter Developer',
      'period': '2023 - 2024',
      'achievements': [
        'Developed cross-platform mobile apps with optimized performance on iOS and Android',
        'Integrated Firebase services: Authentication, Firestore, Cloud Messaging, and Analytics',
        'Published production apps to App Store and Play Store',
        'Collaborated with designers and backend teams to deliver new features',
        'Implemented push notifications, deep linking, and background message handling',
      ],
      'color': '#8B5CF6',
    },
    {
      'company': 'SoftScope',
      'location': 'Egypt',
      'position': 'Flutter Developer',
      'period': '2021 - 2023',
      'achievements': [
        'Built cross-platform mobile applications using Flutter',
        'Applied state management using Bloc for predictable app states',
        'Integrated REST APIs and Firebase Authentication',
        'Implemented push notifications and local storage solutions',
        'Collaborated using Git/GitHub for code reviews and version control',
      ],
      'color': '#06B6D4',
    },
  ];
}
