# 📒 MyDaily

MyDaily adalah aplikasi mobile berbasis Flutter yang dirancang untuk membantu pengguna mencatat aktivitas harian, memantau suasana hati (mood), mengelola prioritas aktivitas, serta melihat statistik aktivitas secara offline menggunakan penyimpanan lokal Hive.

---

## 📱 Preview

> Tambahkan screenshot aplikasi di sini

| Home | Add Activity | History |
|------|--------------|----------|
| Screenshot | Screenshot | Screenshot |

| Calendar | Statistics | Settings |
|-----------|------------|-----------|
| Screenshot | Screenshot | Screenshot |

---

# ✨ Features

### 🏠 Home
- Greeting Card
- Today's Activity
- Weekly Mood
- Quick Menu
- Progress Card
- Mini Calendar
- Dashboard Ringkasan

---

### ➕ Add Activity

- Menambahkan aktivitas baru
- Pilih tanggal
- Pilih waktu
- Mood Selector 😊😌😐😢😡
- Priority Selector
- Catatan aktivitas
- Edit aktivitas
- Local Notification

---

### 📜 History

- Menampilkan seluruh aktivitas
- Search Activity
- Filter
  - Today
  - This Week
  - This Month
- Sort
  - Newest
  - Oldest
- Edit Activity
- Delete Activity

---

### 📅 Calendar

- Calendar View
- Menampilkan aktivitas berdasarkan tanggal
- Sinkronisasi otomatis dengan Hive
- Update otomatis ketika data berubah

---

### 📊 Statistics

- Total Activity
- Today Activity
- Weekly Activity
- Monthly Activity
- Mood Statistics
- Mood Pie Chart
- Priority Statistics
- Productivity Score
- Insight Card

---

### ⚙️ Settings

- Edit Username
- Dark Mode
- Daily Reminder
- Delete All Activities
- About Application

---

# 🏗 Architecture

Project menggunakan Clean Architecture sederhana dengan GetX.

```
lib/
│
├── app/
│   ├── routes/
│   └── theme/
│
├── data/
│   ├── datasource/
│   ├── models/
│   └── repositories/
│
├── modules/
│   ├── splash/
│   ├── home/
│   ├── add_note/
│   ├── history/
│   ├── calendar/
│   ├── statistics/
│   └── settings/
│
├── services/
│
└── main.dart
```

---

# 🛠 Built With

- Flutter
- Dart
- GetX
- Hive Database
- Shared Preferences
- Flutter Local Notifications
- Intl
- UUID

---

# 📦 Packages

```yaml
get
hive
hive_flutter
shared_preferences
intl
uuid
flutter_local_notifications
table_calendar
fl_chart
```

---

# 💾 Local Storage

Aplikasi menggunakan:

- Hive Database untuk menyimpan seluruh aktivitas secara offline.
- Shared Preferences untuk menyimpan pengaturan aplikasi seperti:
  - Username
  - Dark Mode
  - Notification

---

# 📊 Data Flow

```
UI
 ↓
Controller (GetX)
 ↓
Repository
 ↓
Hive Service
 ↓
Hive Database
```

---

# 🚀 Cara Menjalankan Project

Clone repository

```bash
git clone https://github.com/username/my_daily.git
```

Masuk ke folder project

```bash
cd my_daily
```

Install dependencies

```bash
flutter pub get
```

Generate Hive Adapter

```bash
dart run build_runner build --delete-conflicting-outputs
```

Jalankan aplikasi

```bash
flutter run
```

---

# 📂 Database

Seluruh data disimpan secara lokal menggunakan Hive sehingga aplikasi tetap dapat digunakan tanpa koneksi internet.

---

# 📈 Future Development

Beberapa pengembangan yang dapat dilakukan:

- Login User
- Cloud Synchronization
- Export PDF
- Backup & Restore
- Search by Date
- Reminder Schedule
- Multiple Theme Color
- Activity Categories
- Achievement System

---

# 👨‍💻 Developer

**Ramzi Farhan**

Mahasiswa Teknologi Informasi  
Politeknik Negeri Jember (PSDKU Nganjuk)

Project dibuat sebagai media pembelajaran Flutter, GetX, Hive Database, dan pengembangan aplikasi mobile Android.

---

# 📄 License

Project ini dibuat untuk tujuan pembelajaran dan pengembangan portofolio.