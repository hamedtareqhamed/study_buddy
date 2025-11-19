#  StudyBuddy - Smart Student Planner

**StudyBuddy** is a comprehensive task management application built with **Flutter** and **SQLite**. Designed for students, it integrates study planning, progress tracking, and time management into a single cross-platform solution.

This project was developed as part of the **TPL 6213 - Programming Language Concept** course requirements.

---

##  Key Features

* **📝 CRUD Task Management:** Create, read, update, and delete study tasks efficiently.
* **💾 Persistent Storage:** Uses **SQLite** (`sqflite`) to save data locally on the device.
* **📊 Visual Progress Tracking:** A dynamic progress bar updates automatically as tasks are completed.
* **⏱️ Study Timer:** Built-in countdown timer (60s demo) to manage study sessions.
* **📅 Interactive Calendar:** Date picker integration for scheduling task due dates.
* **🛡️ Robust Validation:** Regex-based input validation to ensure data integrity (e.g., no special characters).
* **💻 Cross-Platform Support:** optimized for Android, iOS, Windows, and Linux.

---

##  Technologies Used

* **Framework:** [Flutter](https://flutter.dev) (Dart Language)
* **Database:**
    * Mobile: `sqflite`
    * Desktop: `sqflite_common_ffi`
* **Dependencies:**
    * `intl`: For date formatting.
    * `path`: For database path handling.

---

##  Prerequisites

Ensure you have the following installed on your machine:

1.  **Flutter SDK:** [Download & Install](https://flutter.dev/docs/get-started/install)
2.  **Dart SDK:** (Included with Flutter)
3.  **IDE:** Visual Studio Code or Android Studio.
4.  **Git:** For version control.

---

##  Setup & Installation

### 1. Clone the Repository
```bash
git clone [https://github.com/yourusername/study_buddy.git](https://github.com/yourusername/study_buddy.git)
cd study_buddy
```
