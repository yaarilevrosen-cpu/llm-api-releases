**llm-api 4.15.0** - 2026-11-07

- **Console accounts:** the console now has several accounts, each with a
  username and a password, as an admin or a user. An admin adds people on the new
  Users page (with a one-time password they replace at their first login), and
  can disable, reset, promote or delete them. Users get the chat and their own
  password, nothing else. Each user's chat runs under a key of their own, so the
  admin sets their limits with the same controls as access keys, and sees their
  usage. The existing password becomes the account "admin", so nobody is locked
  out by the update.
- Two people sharing one browser no longer see each other's conversations.

---

<div dir="rtl">

- **חשבונות בממשק הניהול:** לממשק יש עכשיו כמה חשבונות, לכל אחד שם משתמש וסיסמה,
  כמנהל או כמשתמש. מנהל מוסיף אנשים בעמוד המשתמשים החדש (עם סיסמה חד־פעמית שמחליפים
  בכניסה הראשונה), ויכול להשבית, לאפס, לקדם או למחוק. משתמש רגיל מקבל רק את הצ'אט
  ואת הסיסמה שלו. הצ'אט של כל משתמש רץ עם מפתח משלו, כך שהמנהל קובע לו מגבלות באותם
  כלים של מפתחות הגישה ורואה כמה השתמש. הסיסמה הקיימת הופכת לחשבון "admin", כך
  שאף אחד לא ננעל בחוץ בגלל העדכון.
- שני אנשים שמשתמשים באותו דפדפן כבר לא רואים את השיחות זה של זה.

</div>

Download page / דף ההורדה: https://yaarilevrosen-cpu.github.io/llm-api-releases/

SHA-256: see `SHA256SUMS`.
