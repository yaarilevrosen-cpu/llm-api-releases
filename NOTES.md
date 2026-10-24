**llm-api 4.11.0** - 2026-10-24

The first public release.

- **Windows setup** (one .exe, nothing to install first): its own Python and
  packages, Ollama from ollama.com, two services that start with the
  computer, and an uninstaller in Settings > Apps.
- **Linux and Raspberry Pi**: one command, `curl -fsSL .../install.sh | sh`;
  the download is checked against its SHA-256 before anything is installed.
- **Welcome screen** on the first visit, in Hebrew or English, on a phone or a
  desktop: choose the console password (only on the machine itself), a single
  machine or a fleet, and a first model sized to your graphics card, with
  download progress.
- **Updates**: the console tells you when a new version is out and installs
  it with one click (checked against its SHA-256, with automatic rollback).
- Everything from the private versions before it: an OpenAI-compatible API,
  a console with chat, machines, models, keys and traffic; Hebrew mode with a
  guard against answers in the wrong script; per-key limits and statistics;
  several machines as one fleet with automatic failover.

---

<div dir="rtl">

הגרסה הציבורית הראשונה.

- **התקנה ל־Windows** (קובץ exe אחד, בלי להתקין שום דבר קודם): פייתון וחבילות
  משלה, Ollama מהאתר ollama.com, שני שירותים שעולים עם המחשב, והסרה דרך
  הגדרות > אפליקציות.
- **לינוקס ו־Raspberry Pi**: פקודה אחת, `curl -fsSL .../install.sh | sh`;
  ההורדה נבדקת מול ה־SHA-256 שלה לפני שמשהו מותקן.
- **מסך פתיחה** בכניסה הראשונה, בעברית או באנגלית, בטלפון או במחשב: בוחרים
  סיסמה לקונסולה (רק במכונה עצמה), מכונה אחת או צי, ומודל ראשון שמתאים לכרטיס
  המסך, עם התקדמות ההורדה.
- **עדכונים**: הקונסולה מודיעה כשיוצאת גרסה חדשה ומתקינה אותה בלחיצה אחת
  (נבדקת מול ה־SHA-256 שלה, עם חזרה אוטומטית לגרסה הקודמת אם משהו נכשל).
- כל מה שהיה בגרסאות הפרטיות שלפניה: API תואם OpenAI, קונסולה עם צ'אט, מכונות,
  מודלים, מפתחות ותעבורה; מצב עברית עם שמירה מפני תשובות בכתב הלא נכון; מגבלות
  וסטטיסטיקה לכל מפתח; כמה מכונות כצי אחד עם מעבר אוטומטי כשמכונה נופלת.

</div>

Download page / דף ההורדה: https://yaarilevrosen-cpu.github.io/llm-api-releases/

SHA-256: see `SHA256SUMS`.
