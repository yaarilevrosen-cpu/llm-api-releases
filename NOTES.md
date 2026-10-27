**llm-api 4.13.0** - 2026-10-27

- **Machines without a graphics card:** detected automatically. The welcome
  screen and "Add machine" offer three choices with an honest speed note -
  router only, a small local model plus cloud providers, or a small local model
  only - and the model is picked to fit the RAM. Such a machine answers only
  when nothing better can ("CPU only"), and the doctor says so plainly.
- **Long conversations:** a conversation longer than the model's context no
  longer loses its beginning silently. The context is raised for that request
  as far as the model stays on the GPU, the machine that can hold the whole
  conversation is preferred, and only when nothing can hold it is the older
  part summarised - shown in the chat as "part of the start was summarised",
  with the summary one tap away. API clients get `X-Context-Summarized: 1`; a key
  can be set to refuse instead (`E_CONTEXT_TOO_LONG`).
- `install.sh --model X` now downloads that model on a fresh install.

---

<div dir="rtl">

- **מכונות בלי כרטיס מסך:** מזוהות אוטומטית. מסך הפתיחה ו"הוספת מכונה" מציעים שלוש
  אפשרויות עם הערכת מהירות כנה - נתב בלבד, מודל קטן מקומי + ספקי ענן, או רק מודל קטן
  מקומי - והמודל נבחר לפי הזיכרון. מכונה כזאת עונה רק כשאין מי שיענה טוב יותר
  ("CPU only"), והבדיקה העצמית אומרת זאת בבירור.
- **שיחות ארוכות:** שיחה ארוכה מההקשר של המודל כבר לא מאבדת את תחילתה בשקט. ההקשר
  מוגדל לבקשה הזאת ככל שהמודל עדיין נשאר בכרטיס, המכונה שיכולה להחזיק את כל השיחה
  מועדפת, ורק כשאף מכונה לא יכולה - החלק הקודם מסוכם, ובצ'אט מופיע "חלק מתחילת השיחה
  סוכם" עם הסיכום בלחיצה.
- `install.sh --model X` מוריד עכשיו את המודל הזה בהתקנה חדשה.

</div>

Download page / דף ההורדה: https://yaarilevrosen-cpu.github.io/llm-api-releases/

SHA-256: see `SHA256SUMS`.
