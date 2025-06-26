# Randoquiz

# Azure Data Fundamentals Quiz Game

A simple, mobile-friendly quiz game to help you prepare for the [Microsoft Certified: Azure Data Fundamentals](https://learn.microsoft.com/en-us/credentials/certifications/azure-data-fundamentals/?practice-assessment-type=certification) exam.

---

## Features

- 10+ practice questions based on Microsoft Learn
- Instant feedback with explanations after each question
- Review all questions, your answers, and explanations at the end
- Designed for phones and tablets

---

## How to Run This App

> **No coding experience required! Just follow these steps.**

### 1. Install Flutter

Flutter is a free tool to build & run mobile apps.

- Go to [Flutter installation page](https://docs.flutter.dev/get-started/install)
- Choose your operating system (Windows, Mac, Linux)
- **Follow the steps to install Flutter and set up your device (phone or emulator)**

#### Quick summary:
- Download and extract Flutter SDK
- Add Flutter to your system PATH
- Run `flutter doctor` in your terminal (instructions in the docs)

### 2. Clone or Download This Repo

- If you have Git:
  ```sh
  git clone https://github.com/YOUR_USERNAME/azure-data-quiz.git
  cd azure-data-quiz
  ```
- Or download as ZIP, extract, and open the folder

### 3. Run the App

- Connect your phone **or** start an Android/iOS emulator (see [Flutter device setup](https://docs.flutter.dev/get-started/install))
- In the project folder, run:

  ```sh
  flutter pub get
  flutter run
  ```

- The quiz will appear on your device!

### 4. Making Changes or Adding Questions

- Open `lib/main.dart` in any text editor.
- Add more `QuizQuestion` entries to the `questions` list.
- Save and run again!

---

## FAQ

**Q: Do I need an Android/iOS developer account?**  
A: No, for learning and practice you can use emulators or your own device (enable developer mode).

**Q: How do I change the questions or explanations?**  
A: Edit the `questions` list in `lib/main.dart`.

**Q: Can I share this with friends?**  
A: Yes! Share your GitHub link or send them the files.

---

## Credits

- Inspired by Microsoft Learn and the official Azure Data Fundamentals practice assessment.

---

*Good luck with your studies and certification!*
