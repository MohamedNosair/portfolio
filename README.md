# Mohamed Nosair - Portfolio Website

A modern, minimalist portfolio website built with Flutter Web featuring a Bento Grid layout and Blue & White color scheme.

## Design Philosophy

**Modern Minimalist** - Clean, simple, and professional with focus on content and clarity.

### Key Features
- 🎨 Modern Blue & White color scheme
- 📐 Bento Grid layout with varied card sizes
- 📱 Fully responsive (mobile, tablet, desktop)
- ✨ Subtle animations and hover effects
- 🎯 Clean typography with clear hierarchy
- ⚡ Fast performance, no heavy dependencies

## Quick Start

### Prerequisites
- Flutter SDK (latest stable)
- Chrome browser for web development

### Run Development Server
```bash
flutter run -d chrome
```

### Build for Production
```bash
flutter build web --release
```

### Analyze Code
```bash
flutter analyze
```

## Project Structure

```
lib/
├── main.dart                    # App entry point & navigation
├── utils/
│   └── app_theme.dart          # Theme, colors, typography
├── data/
│   └── portfolio_data.dart     # Portfolio content & data
└── widgets/
    ├── hero_section.dart       # Hero with name & introduction
    ├── bento_grid_section.dart # About section with bento cards
    ├── projects_bento.dart     # Projects displayed as cards
    ├── skills_section.dart     # Skills organized by category
    ├── experience_timeline.dart # Work experience timeline
    └── contact_section.dart    # Contact information cards
```

## Design System

### Colors
```dart
Primary Blue:   #2563EB  // Main actions, links
Light Blue:     #60A5FA  // Hover states, accents
Dark Blue:      #1E40AF  // Dark variations
Background:     #FAFAFA  // Off-white background
Card White:     #FFFFFF  // Pure white cards
Border Gray:    #E5E7EB  // Subtle borders
Text Dark:      #111827  // Primary text
Text Gray:      #6B7280  // Secondary text
Text Light:     #9CA3AF  // Tertiary text
```

### Typography Scale
- **Display**: 72px/56px - Hero names
- **Headline**: 40px/32px - Section titles
- **Title**: 24px - Card headings
- **Body**: 18px/16px - Content
- **Label**: 14px - Tags, badges

### Spacing (8px base)
- space1: 8px
- space2: 16px
- space3: 24px
- space4: 32px
- space6: 48px
- space8: 64px
- space10: 80px
- space12: 96px

### Border Radius
- Small: 12px
- Medium: 16px
- Large: 24px
- XLarge: 32px

## Components

### 1. Hero Section
- Large name display split across lines
- "Available for work" status badge
- Brief introduction
- Call-to-action buttons
- Quick stats (experience, projects, stability)

### 2. Bento Grid Section
Four main cards showing:
- **Experience**: 4+ years building Flutter apps
- **Location**: Mansoura, Egypt
- **Achievements**: Key metrics (99.2% stability, 30% improvements)
- **Contact**: Ready to work message

### 3. Projects Section
- Grid of project cards (2 columns on desktop)
- Each card shows: title, description, tech stack, links
- Interactive hover effects
- Links to live apps and GitHub repos

### 4. Skills Section
Skills organized into 4 categories:
- Flutter & Mobile Development
- Backend & Integration
- Tools & Workflow
- Programming Languages

### 5. Experience Timeline
- Vertical timeline with 3 positions
- Color-coded by company
- Achievement bullets for each role
- Interactive hover effects on timeline dots

### 6. Contact Section
Four contact methods displayed as cards:
- Email
- GitHub
- LinkedIn
- Phone

Each card is clickable with hover effects.

## Responsive Design

### Desktop (> 1024px)
- Full bento grid layout
- 2-column project grid
- Side-by-side contact cards
- Large typography

### Tablet (768-1024px)
- Adjusted bento layout
- 2-column grids
- Medium typography

### Mobile (< 768px)
- Single column layout
- Stacked cards
- Smaller typography
- Reduced spacing

## Customization

### Update Content
Edit `lib/data/portfolio_data.dart` to change:
- Personal information
- Project details
- Skills list
- Experience entries

### Modify Theme
Edit `lib/utils/app_theme.dart` to adjust:
- Colors
- Typography
- Spacing
- Border radius
- Shadows

## Browser Support

- ✅ Chrome
- ✅ Firefox
- ✅ Safari
- ✅ Edge

## Performance

- No heavy external dependencies
- Optimized animations (200ms duration)
- Efficient widget composition
- Fast initial load time

## Deployment

### Firebase Hosting
```bash
firebase init hosting
flutter build web --release
firebase deploy
```

### Netlify
1. Build: `flutter build web --release`
2. Publish directory: `build/web`

### GitHub Pages
1. Build: `flutter build web --release --base-href "/repo-name/"`
2. Copy `build/web` to `gh-pages` branch

## Documentation

- **DESIGN_GUIDE.md** - Detailed design documentation
- **VISUAL_GUIDE.md** - Visual layout guide
- **CHANGES.md** - Complete changelog
- **SUMMARY.md** - Project summary
- **README_AR.md** - Arabic documentation

## License

All rights reserved. © 2024 Mohamed Nosair

## Contact

- **Email**: mohamednosair142@gmail.com
- **GitHub**: [@MohamedNosair](https://github.com/MohamedNosair)
- **LinkedIn**: [Mohamed Nosair](https://linkedin.com/in/mohamed-nosair-11b814192)
- **Phone**: +201011837228

---

Built with ❤️ using Flutter Web
