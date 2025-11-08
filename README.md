# Cheow — репозиторий приложения

Коротко: здесь лежит мобильный клиент Cheow (Flutter) и связанная с ним документация.

## Быстрый старт
1. Скопировать `.env.example` → `.env` и заполнить:
   - `SUPABASE_URL`
   - `SUPABASE_ANON_KEY`

2. Установить зависимости:
\`\`\`bash
flutter pub get
\`\`\`

3. Запуск (dev):
\`\`\`bash
flutter run
\`\`\`

## Важные ссылки
- Notion (Sprint-0): NOTION_SPRINT0_LINK
- Supabase: <вставь ссылку проекта в Supabase>
- CI: GitHub Actions workflow `.github/workflows/flutter-ci.yml`

## Структура проекта
- `lib/screens/` — экраны (login, chats, chat_view)
- `lib/services/` — Supabase client
- `lib/widgets/` — повторно используемые виджеты

## Контакты
Email: cheowofficial@gmail.com
