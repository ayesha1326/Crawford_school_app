# Crawford Grammar School — Comprehensive Asset & Image Guide
### مکمل رہنمائی برائے تصاویر اور اثاثہ جات (Images Replacement Guide)

This guide provides clear, practical instructions on how photographic and graphic assets are managed within the Crawford Grammar School application.

---

## 1. Ready-Made Starter Images Included
Har folder ke andar **default professional starter images** pehle se generate karke rakh di gayi hain:
1. App bina kisi missing asset error ke 100% execute hoti hai.
2. Sabhi screens par images ke proper cards, borders, aur aspect ratios set hain.
3. **Aapko sirf apni real images ko inhi naamo se replace (overwrite) karna hai**!

---

## 2. Directory Structure & Exact File Names

Aapko images badalne ke liye kisi code file ko chherne ki zaroorat nahi hai. Sirf neeche diye gaye folder me ja kar usi naam se apni image paste kar dein:

```text
crawford_school_app/
└── assets/
    └── images/
        ├── logo/
        │   ├── crawford_logo.png           # School emblem & red typography (transparent PNG)
        │   └── crawford_logo_white.png     # Pure white variant for dark headers (transparent PNG)
        │
        ├── school/
        │   ├── school_building.jpg         # Main academic building facade (800x500 or 1200x800)
        │   ├── school_campus.jpg           # Panoramic campus & lawns photograph (800x500)
        │   └── school_gate.jpg             # Reception & security gate (800x500)
        │
        ├── principal/
        │   └── principal.jpg               # Dr. Katherine Crawford formal portrait (500x500)
        │
        ├── students/
        │   └── student_profile.jpg         # Student avatar photo (Sarah Ahmed) (400x400)
        │
        ├── teachers/
        │   ├── teacher_1.jpg               # Faculty headshot (Prof. M. Usman) (400x400)
        │   └── teacher_2.jpg               # Faculty headshot (Dr. Ayesha Malik) (400x400)
        │
        ├── facilities/
        │   ├── classroom.jpg               # Smart interactive classroom (800x500)
        │   ├── science_lab.jpg             # STEM Chemistry/Physics lab (800x500)
        │   ├── library.jpg                 # Central digital library (800x500)
        │   ├── computer_lab.jpg            # Computing & robotics lab (800x500)
        │   ├── sports.jpg                  # Sports arena & playground (800x500)
        │   └── auditorium.jpg              # Multi-tier grand auditorium (800x500)
        │
        ├── events/
        │   ├── science_fair.jpg            # Annual Science Olympiad (800x500)
        │   ├── sports_day.jpg              # Annual Athletics meet (800x500)
        │   ├── art_fair.jpg                # Fine Arts & Craft exhibition (800x500)
        │   └── graduation.jpg              # Convocation ceremony (800x500)
        │
        ├── gallery/
        │   ├── campus_view_1.jpg           # Academic quadrangle view (800x500)
        │   ├── campus_view_2.jpg           # Student activity center (800x500)
        │   ├── lab_session.jpg             # Research experiment in progress (800x500)
        │   └── sports_action.jpg           # Inter-school athletics match (800x500)
        │
        └── admissions/
            └── admissions_banner.jpg       # Admission session banner (800x500)
```

---

## 3. How to Replace an Image (Tasweer Badalne Ka Tareeqa)

1. Apni image file ko rename karke target file ka naam dein (Maslan: `school_building.jpg`).
2. Usko copy karke project ke mutaliqa folder me paste kar dein (e.g. `assets/images/school/`).
3. Replace / Overwrite par click karein.
4. Android Studio me Hot Reload karein ya app ko dubara run karein:
   ```bash
   flutter pub get
   flutter run
   ```
5. App automatically aapki nayi tasweer render karegi!

---

## 4. `SafeImage` Fallback & Space Management System

App me `SafeImage` widget (`lib/widgets/safe_image.dart`) use kiya gaya hai:
- **Aspect Ratio Safe:** Har image container ka fixed height / rounded border pehle se defined hai taake kabhi layout overflow na ho.
- **Missing Asset Safe:** Agar aap koi image file delete kar dete hain ya rename kar dete hain, tab bhi app crash **nahi** hogi. Balkay Crawford Dark Navy aur Red gradient ka stylish placeholder school icon ke sath render hoga!
- **Vector Emblem System:** Crawford Logo ko canvas CustomPainter par bhi draw kiya gaya hai taake kisi bhi density (HDPI/XXXHDPI) par bilkul crisp nazar aaye.

---

## 5. Code Centralization (`AssetPaths`)
Agar aap code me koi naya path add karna chahein, to wo centralized file me moujood hai:
- `lib/core/constants/asset_paths.dart`
Aapko kisi bhi screen ke andar direct hardcoded strings dhoondhne ki zaroorat nahi hai.
