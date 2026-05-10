# Осетинский язык - Приложение для изучения

Мобильное приложение для изучения осетинского языка, разработанное на **Flutter**. Приложение предоставляет интерактивные курсы, упражнения и материалы для эффективного усвоения языка.

![Flutter](https://img.shields.io/badge/Flutter-3.11+-blue?style=flat-square&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.11+-0175C2?style=flat-square&logo=dart)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)

## ✨ Основные возможности

- 📚 **Структурированные курсы** - Организованные уроки от базового до продвинутого уровня
- 🎯 **Интерактивные упражнения** - Практические задания для закрепления материала
- 🎨 **Современный дизайн** - Удобный и интуитивный интерфейс
- 📱 **Кроссплатформенность** - Работает на iOS и Android
- 🔄 **Синхронизация** - Сохранение прогресса обучения
- 🎵 **Аудио контент** - Правильное произношение слов

## 🚀 Быстрый старт

### Требования

- **Flutter SDK**: ≥ 3.11.4
- **Dart**: ≥ 3.11.4
- **Xcode** (для iOS) или **Android Studio** (для Android)

### Установка

1. Клонируйте репозиторий:
```bash
git clone https://github.com/AlanTsarakov/flutter_ossetian_learning_app.git
cd flutter_ossetian_learning_app
```

2. Установите зависимости:
```bash
flutter pub get
```

3. Запустите приложение:
```bash
flutter run
```

## 📦 Зависимости

- **google_fonts** (^8.1.0) - Работа со шрифтами от Google
- **cached_network_image** (^3.4.1) - Кэширование изображений с сети
- **get_it** (^8.0.2) - Service Locator для управления зависимостями
- **cupertino_icons** (^1.0.8) - iOS-стилизованные иконки

## 📁 Структура проекта

```
lib/
├── main.dart           # Точка входа приложения
├── models/            # Модели данных
├── screens/           # Экраны приложения
├── widgets/           # Переиспользуемые виджеты
├── services/          # Бизнес-логика и сервисы
├── utils/             # Утилиты и хелперы
└── assets/            # Изображения и данные курсов

assets/
└── images/
    └── courses/       # Изображения для курсов
```

## 🛠️ Технологический стек

| Язык/Технология | Процент | Описание |
|---|---|---|
| **Dart** | 61.7% | Основной язык приложения |
| **C++** | 19.1% | Нативные расширения для производительности |
| **CMake** | 15.2% | Сборка C++ компонентов |
| **Swift** | 1.6% | iOS-специфичный код |
| **HTML/CSS** | 1.2% | Веб-компоненты |
| **C** | 1.1% | Низкоуровневые функции |

## 🎮 Использование

### Запуск в режиме отладки
```bash
flutter run -d chrome          # На веб-браузере
flutter run -d android         # На Android
flutter run -d ios             # На iOS
```

### Сборка релиза
```bash
flutter build apk              # Android APK
flutter build ios              # iOS IPA
flutter build web              # Веб-версия
```



## 📖 Документация

Дополнительную информацию о Flutter вы найдете здесь:
- [Flutter документация](https://docs.flutter.dev)
- [Dart документация](https://dart.dev)
- [Flutter примеры](https://flutter.dev/docs/samples)

## 🤝 Вклад

Мы приветствуем вклад в развитие проекта! 

1. Создайте fork репозитория
2. Создайте ветку для вашей функции (`git checkout -b feature/AmazingFeature`)
3. Сделайте коммит изменений (`git commit -m 'Add some AmazingFeature'`)
4. Отправьте в ветку (`git push origin feature/AmazingFeature`)
5. Откройте Pull Request

## 📋 Требования к коду

- Следуйте [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Добавляйте комментарии для сложной логики
- Пишите тесты для новых функций
- Убедитесь, что `flutter analyze` проходит без ошибок

## 🐛 Сообщение об ошибках

Если вы обнаружили баг, создайте [Issue](https://github.com/AlanTsarakov/flutter_ossetian_learning_app/issues) с описанием:
- Что вы делали
- Что произошло
- Что вы ожидали


## 🙏 Благодарности

Спасибо всем, кто помогает в развитии проекта и способствует сохранению осетинского языка!

---

**Дата последнего обновления:** 2026-05-10

Если у вас есть вопросы или предложения, не стесняйтесь открывать Issues или Pull Requests! 🎉
