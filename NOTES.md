**llm-api 4.13.1** - 2026-10-27

- **A slow machine no longer stalls itself:** every connection the program made
  loaded the system's certificate list again, on the thread that answers all
  requests. On a busy Windows laptop that took seconds, so even simple status
  checks waited and the router sometimes skipped the machine. The list is now
  loaded once. A stuck request loop is also logged, with where it was stuck.

---

<div dir="rtl">

- **מכונה איטית כבר לא עוצרת את עצמה:** כל חיבור שהתוכנה פתחה טען מחדש את רשימת
  האישורים של המערכת, על התהליך שעונה לכל הבקשות. במחשב נייד Windows עמוס זה לקח
  שניות, כך שגם בדיקות מצב פשוטות חיכו והנתב דילג לפעמים על המכונה. עכשיו הרשימה
  נטענת פעם אחת. כשלולאת הבקשות נתקעת, זה נרשם ביומן יחד עם המקום שבו נתקעה.

</div>

Download page / דף ההורדה: https://yaarilevrosen-cpu.github.io/llm-api-releases/

SHA-256: see `SHA256SUMS`.
