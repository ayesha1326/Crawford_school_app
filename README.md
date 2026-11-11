# Crawford Grammar School — Complete Multi-Portal School Management Mobile Application

> **Technology Stack:** Flutter & Dart | Material Design 3 | Android Studio Ready | University Semester Project  
> **Brand Direction:** Crawford Grammar School Official Identity (Primary Red `#E50914`, Dark Navy `#10212B`, Pure White `#FFFFFF`)

---

## 1. Quick Start / How to Run in Android Studio

1. **Open Project:**
   - Launch **Android Studio**.
   - Select **File > Open...** (or click **Open** on the Welcome dialog).
   - Select the `crawford_school_app` folder.
2. **Fetch Dependencies:**
   - In Android Studio Terminal or PowerShell, run:
     ```bash
     flutter pub get
     ```
3. **Launch on Emulator, Physical Phone, or Chrome:**
   - Start an Android emulator (e.g. Pixel running API 33/34) OR select **Chrome (web)** from the device dropdown.
   - Click the green **Run (Play)** button or press `Shift + F10`.

> **Note on PowerShell `flutter` Command:**
> Flutter was installed at `C:\Users\LAPTOP EXPERT\flutter_windows_3.47.6-stable\flutter\bin`. This path has now been permanently added to your Windows User `PATH` environment variable. If you open a new PowerShell terminal, `flutter` will work directly.

---

## 2. University Mid-Term Demo Credentials

All four portals feature **1-click auto-fill buttons** on the Login screen, or you can enter the following credentials:

| Portal | Email / Username | Password | User Profile |
| :--- | :--- | :--- | :--- |
| **Student Portal** | `student@crawford.edu.pk` | `password123` | **Sarah Ahmed** (Grade 10-A, Roll No. 24) |
| **Parent Portal** | `parent@crawford.edu.pk` | `password123` | **Tariq Ahmed** (Father of Sarah & Rayyan) |
| **Teacher Portal** | `teacher@crawford.edu.pk` | `password123` | **Prof. Muhammad Usman** (Senior Sciences) |
| **Admin Portal** | `admin@crawford.edu.pk` | `password123` | **Dr. Katherine Crawford** (Principal) |

> **Pro-Tip for Presentation:** You can click **"Quick Switch Portal"** directly from the Navigation Drawer or Settings at any time to demonstrate all 4 dashboards without logging out!

---

## 3. Comprehensive List of Implemented Modules & Screens

### A. App Entry & Authentication Flow
1. **Splash Screen** — Crawford soaring flame emblem, animated red progress indicator, tagline *"Building Brighter Futures"*.
2. **Onboarding Screen** — 4 interactive swipeable cards with hero photography, dot indicators, *"Get Started"*, and *"Skip"*.
3. **Welcome Screen** — School facade hero, introduction, direct *"Apply for Admission"*, *"Select Your Portal"*, *"Login"*, *"Register"*, and quick links for *"Campus Visit"* and *"Feedback"*.
4. **Portal Role Selection** — Interactive selection cards for Student, Parent, Teacher, and Administration.
5. **Login Screen** — Email/Password input cards, visibility toggle, social SSO, 1-click demo filler pills, forgot password.
6. **Register Screen** — Full legal registration with role picker, ID validation, terms checkbox, and success dialog.
7. **Forgot Password Screen** — 4-step recovery flow (Email -> Demo OTP verification -> New password confirmation -> Success).

### B. Student Portal (Grade 10-A)
8. **Student Dashboard** — Dark navy curved header, student avatar greeting, hero school banner, 8 quick-action grid cards, fee status badge, attendance progress, timetable preview, recent assignments.
9. **Academics & Subjects** — Detailed list of Cambridge subjects, credit hours, teacher assignments, and scores.
10. **Subject Detail Screen** — Detailed syllabus view, chapter breakdown, curriculum learning objectives.
11. **Attendance Register** — Monthly interactive calendar (November 2026), statistics (Present, Late, Absent, Leave), policy rules.
12. **Weekly Timetable** — Mon-Sat interactive tabs, period timings (P1 to P7), classroom numbers, break indicators, period detail sheets.
13. **Fee Management** — Fee status dashboard, total pending balance in PKR, voucher history.
14. **Official Fee Challan** — Authentic Crawford voucher with barcode, student ID, detailed fee breakdown, *"Pay Online (Demo)"* modal with bank/JazzCash options, and receipt generation.
15. **Examinations & Report Cards** — Term 1 report card, cumulative A* grade, subject marks progress bars, rank standing.
16. **Assignments & Homework** — Pending/Submitted tabs, deadlines, attachment simulation, instant submission upload demo.
17. **Digital Library** — Real-time search by title/author/ISBN, category chips (Science, Math, Literature, History), availability indicators.

### C. Parent Portal
18. **Parent Multi-Child Dashboard** — Child selector pills (Sarah Ahmed - Grade 10-A vs. Rayyan Ahmed - Grade 6-B) with dynamic state switching.
19. **Child Academic Performance** — Subject grades, term GPA, behavioral remarks.
20. **Parent-Teacher Meeting (PTM) Scheduler** — Book appointments with subject teachers, date & time slot pickers, meeting agenda.

### D. Teacher Portal (Faculty Desk)
21. **Teacher Dashboard** — Assigned classes, today's schedule, pending attendance alerts, active student counts.
22. **Interactive Attendance Taker** — Full Grade 10-A student roster, live toggles for Present (P), Late (L), Absent (A), *"Mark All Present"* shortcut, and synchronized submission.
23. **Create Assignment Form** — Target grade, subject, due date, total marks, instructions, and instant publication to mock database.

### E. School Administration / Principal Portal
24. **Administration Executive Console** — Key Performance Indicators (Total Students: 1,420, Faculty: 86, Applications: 148, Fee Collection: PKR 18.4M).
25. **Admission Application Review Queue** — Live review desk with applicant records, one-tap *"Approve"* and *"Reject"* status controls.

### F. Admissions Management System
26. **Admissions Landing Page** — Session 2026-27 criteria, application roadmap, grade availability, FAQs.
27. **6-Step Admission Application Stepper** —
    - Step 1: Student Particulars (Full Name, DOB, Gender, Applying Grade)
    - Step 2: Parent/Guardian Details (Father, Phone, Email, Profession)
    - Step 3: Prior Academic History (School, Division)
    - Step 4: Residential & Health Disclosures
    - Step 5: Document Upload Simulation
    - Step 6: Final Review & Submission -> Generates official tracking code (e.g. `CGS-ADM-2026-XXXX`).

### G. School Heritage & Facilities
28. **About School Screen** — 30-year heritage, Vision, Mission, Core Values, Regional Cambridge Awards.
29. **Principal's Message** — Dr. Katherine Crawford formal portrait, welcome address, educational philosophy, signature badge.
30. **Campus & Facilities** — Smart classrooms, STEM science labs, computing center, central library, sports arena, and 900-seat auditorium.
31. **Photo Gallery** — Campus, sports, lab sessions, and graduation ceremony with full-screen viewer.
32. **Campus Location & Contact** — Physical address (Phase 5, DHA, Lahore), timings, contact cards, and simulated interactive map.

### H. Communication & Community Modules
33. **School Notices & Circulars** — Filter by All, Academics, Exams, Administrative, and urgent push alerts.
34. **Interactive Academic Support Chat** — Live chat simulation with automated smart replies from Crawford Help Desk.
35. **App Settings** — Notification preferences, biometrics toggle, portal switcher, and cache reset.
36. **Give Feedback Screen** — Star rating, category selector (Academics, Facilities, Transport, etc.), anonymous toggle, comments field, and generated reference ticket ID.
37. **Book Campus Visit Screen** — Tour slots (Morning, Midday, Afternoon), grade selector, visitor head count, areas of interest selection, and generated Visitor Pass (`CGS-VISIT-2026-XXXX`).

---

## 4. Crash-Proof Asset Architecture

- **Pre-Configured Assets:** 24 high-resolution starter images are pre-bundled in `assets/images/` across all modules.
- **Easy Image Replacement:** To replace any photo with your real school image, simply copy your JPG/PNG file into `assets/images/<category>/` using the exact same filename. See `ASSET_GUIDE.md` for the complete list.
- **Zero-Crash Safeguard:** `SafeImage` ensures the app never crashes even if an image file is missing or renamed, displaying an elegant Crawford Dark Navy & Red gradient container with an icon and label.
