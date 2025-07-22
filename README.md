# 🥗 Food Calorie Recognition App

A smart health companion built using **Flutter**, **TensorFlow Lite**, and **Firebase**, this app enables users to scan food items and get real-time calorie estimates using an integrated Machine Learning model.

---

## 📱 Overview

This application uses a trained ML model to recognize food from captured images and displays:
- ✅ The **food name**
- 🔥 The **calories per item**
- 📊 Tracks dietary intake & progress
- 🍽️ Recommends recipes (suggested & trending)
- 🧠 Offers personalized nutrition insights
- ✨ Features a clean, motivational UI

---

## 🚀 Features

- 📸 **Camera-based food recognition**
- 🤖 **TFLite ML model integration**
- 🔢 **Calorie prediction**
- 🥗 **Suggested & trending recipes**
- 📈 **Progress tracking & visual insights**
- 🔔 **Motivational UI & daily reminders**
- 🗂️ **Persistent data via Firebase**

---

## 🛠️ Tech Stack

| Layer        | Technology                          |
|--------------|--------------------------------------|
| Frontend     | Flutter, Dart                        |
| ML Inference | TFLite Teachable Machine, tflite_flutter |
| Image Input  | Flutter camera plugin                |
| Backend      | Firebase (Firestore & Auth)          |
| State Mgmt   | setState / Provider (optional)       |

---

## 📦 Installation

```bash
git clone https://github.com/HarshiSharma04/Food-Calorie-Estimation-App.git
cd food_calorie_recognition_app
flutter pub get
flutter run
