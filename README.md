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
### 2.Install Dependencies
```bash
flutter pub get
```
# 3. Platform-Specific Requirements

## Linux (Desktop)
Critical Step: You must install the SQLite shared library for the database to function.
### Ubuntu/Debian:
```bash
sudo apt-get update
sudo apt-get install libsqlite3-dev
```
### Fedora:
```bash
sudo dnf install libsqlite3-devel
```
### Arch/Manjaro:
```bash
sudo pacman -S sqlite
```
## Windows (Desktop)

Ensure Visual Studio 2019 (or later) is installed with the "Desktop development with C++" workload.

## Android
Set up an Android Emulator via Android Studio or connect a physical device.

## iOS
Requires macOS with Xcode installed.


# How to Run
Run the following command in your terminal and chose your target device:

```bash
flutter run
```
# Project Structure
# License
This project is for educational purposes submitted to Multimedia University (MMU).
