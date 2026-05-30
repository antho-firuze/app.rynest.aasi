# app_rynest_aasi 🚀

[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=flat&logo=Flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-%230175C2.svg?style=flat&logo=Dart&logoColor=white)](https://dart.dev)
[![Riverpod](https://img.shields.io/badge/State%20Management-Riverpod-90caf9?style=flat)](https://riverpod.dev)

A mobile application built with Flutter designed for the **AASI (Asosiasi Asuransi Syariah Indonesia)** Certification Examination. 

This branch (`v2-using-riverpod`) represents the modernized version of the application, utilizing **Riverpod** for robust, scalable, and testable state management.

---

## 📱 Features

*   **Exam Simulation:** Real-time examination interface tailored to AASI certification standards.
*   **State Management:** Powered by Riverpod for clean architecture, predictable state propagation, and easy debugging.
*   **Environment Configuration:** Secure credential and API endpoint handling via `.env` files.
*   **Cross-Platform Support:** Ready for both Android and iOS deployment.

---

## 🛠️ Tech Stack & Architecture

*   **Framework:** [Flutter](https://flutter.dev) (Dart)
*   **State Management:** [Riverpod](https://riverpod.dev)
*   **Local Environment:** `flutter_dotenv` for handling `.env` configurations.
*   **Linting & Analysis:** Configured with strict rules via `analysis_options.yaml` to ensure high code quality.

---

## 🚀 Getting Started

### Prerequisites

Before cloning and running this application, make sure you have installed:
*   [Flutter SDK](https://docs.flutter.dev/get-started/install) (Latest stable version recommended)
*   Dart SDK
*   Android Studio / Xcode (for running emulators/simulators)

### Installation & Setup

1. **Clone the repository and switch to the Riverpod branch:**
```bash
   git clone [https://github.com/antho-firuze/app.rynest.aasi.git](https://github.com/antho-firuze/app.rynest.aasi.git)
   cd app.rynest.aasi
   git checkout v2-using-riverpod

```

2. **Install dependencies:**

```bash
   flutter pub get

```

3. **Configure Environment Variables:**
Create or update the `.env` file in the root directory of the project and add your required API keys or configuration endpoints:

```env
   BASE_URL=[https://your-api-endpoint.com](https://your-api-endpoint.com)
   # Add other secret keys/variables here

```

4. **Run the Application:**

```bash
   flutter run

```

---

## 🧪 Testing & Quality Assurance

* **Code Analysis:** To inspect the code for potential errors and style violations, run:

```bash
    flutter analyze
    ```
*   **Unit & Widget Tests:** Automated tests are located in the `test/` directory. Run them using:
```bash
    flutter test
    ```

---

## 🔗 Download App

The production version of this application is available on the Google Play Store:
👉 **[Download on Google Play Store](https://play.google.com/store/apps/details?id=com.rynest.aasi)**

---

## 👤 Contributor

*   **Ahmad Hertanto** — [*antho-firuze*](https://github.com/antho-firuze)

```

---

### 💡 Tips Tambahan untuk Anda:

1. **Bagian `.env`:** Di dalam draf di atas, saya memasukkan contoh pengisian `BASE_URL`. Anda bisa menyesuaikannya dengan variabel asli yang Anda gunakan di dalam proyek agar kontributor lain (atau Anda sendiri di masa depan) tahu apa saja yang perlu dikonfigurasi.
2. **Lencana (Badges):** Saya menambahkan beberapa lencana visual di bagian atas agar tampilan repositori Anda terlihat lebih profesional dan menarik di halaman utama GitHub.