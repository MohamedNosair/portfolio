# Portfolio Design Guide

## Modern Minimalist Design with Bento Grid Layout

### Color Palette (Blue & White)
- **Primary Blue**: `#2563EB` - Used for CTAs and accents
- **Light Blue**: `#60A5FA` - Used for hover states and highlights
- **Dark Blue**: `#1E40AF` - Used for dark accents
- **Background White**: `#FAFAFA` - Off-white background
- **Card White**: `#FFFFFF` - Pure white for cards
- **Border Gray**: `#E5E7EB` - Light borders

### Design Principles
1. **Clean & Minimal**: Wide white spaces, simple layouts
2. **Bento Grid**: Cards of different sizes arranged beautifully
3. **Clear Typography**: Large, bold headings with proper hierarchy
4. **Subtle Interactions**: Light shadows and smooth hover effects
5. **Responsive**: Works on all screen sizes

### Components

#### 1. Hero Section (`hero_section.dart`)
- Large name display split into two lines
- "Available for work" badge
- Quick stats showing experience and achievements
- CTA buttons for contact

#### 2. Bento Grid Section (`bento_grid_section.dart`)
- About Me section with bento-style cards
- Different card sizes for visual interest
- Experience, location, achievements, and contact cards
- Responsive layout (mobile, tablet, desktop)

#### 3. Projects Bento (`projects_bento.dart`)
- Projects displayed as bento cards
- Tech stack chips
- Interactive links to live projects/GitHub
- Hover effects with shadow animations

#### 4. Skills Section (`skills_section.dart`)
- Skills grouped by category
- Clean card design with vertical accent line
- Individual skill chips with subtle borders

#### 5. Experience Timeline (`experience_timeline.dart`)
- Vertical timeline with connecting dots
- Color-coded by company
- Hover effects that highlight the timeline dot
- Achievement bullets for each position

#### 6. Contact Section (`contact_section.dart`)
- Large, clickable contact cards
- Icon-based navigation
- Email, GitHub, LinkedIn, Phone
- Hover effects that change card background

### Spacing System
Based on 8px grid:
- `space1`: 8px
- `space2`: 16px
- `space3`: 24px
- `space4`: 32px
- `space5`: 40px
- `space6`: 48px
- `space8`: 64px
- `space10`: 80px
- `space12`: 96px

### Border Radius
- `radiusSmall`: 12px
- `radiusMedium`: 16px
- `radiusLarge`: 24px
- `radiusXLarge`: 32px

### Typography Scale
- **Display Large**: 72px, weight 800 (Hero names)
- **Display Medium**: 56px, weight 700 (Mobile hero)
- **Headline Large**: 40px, weight 700 (Section titles)
- **Headline Medium**: 32px, weight 600 (Card titles)
- **Title Large**: 24px, weight 600 (Card headings)
- **Body Large**: 18px, weight 400 (Paragraphs)
- **Body Medium**: 16px, weight 400 (Regular text)
- **Label Large**: 14px, weight 500 (Tags, labels)

### Shadow System
- **Default**: `opacity: 0.03, blur: 12px, offset: (0, 2)`
- **Hover**: `opacity: 0.08, blur: 24px, offset: (0, 4)`
- **Primary**: `color.withOpacity(0.15), blur: 24px, offset: (0, 8)`

### Animation Guidelines
- **Duration**: 200ms for hover effects
- **Curve**: Default easing
- **Properties**: Shadow, scale, background color

### Files Structure
```
lib/
├── main.dart                    # App entry & navigation
├── utils/
│   └── app_theme.dart          # Theme, colors, styles
├── data/
│   └── portfolio_data.dart     # Portfolio content
└── widgets/
    ├── hero_section.dart       # Hero with name & intro
    ├── bento_grid_section.dart # Bento cards for about
    ├── projects_bento.dart     # Projects as bento cards
    ├── skills_section.dart     # Skills grouped by category
    ├── experience_timeline.dart # Work experience timeline
    └── contact_section.dart    # Contact cards
```

### Responsive Breakpoints
- **Mobile**: < 768px
- **Tablet**: 768px - 1024px
- **Desktop**: > 1024px

### Best Practices
1. Always use `AppTheme` constants for colors and spacing
2. Add hover effects to interactive elements
3. Use `MouseRegion` for web hover states
4. Keep cards clean with proper padding
5. Use shadows sparingly and subtly
6. Ensure proper text contrast for readability
7. Test on different screen sizes

### Running the Project
```bash
flutter run -d chrome
```

### Building for Production
```bash
flutter build web --release
```
