**llm-api 4.14.0** - 2026-11-07

- **Tool calls (OpenAI format), for Home Assistant and other agents:** a chat
  request with `tools` now gets `tool_calls` back, in OpenAI's shape, streamed or
  not, and the follow-up turn with the tool results gets the answer. Built for
  Home Assistant's Extended OpenAI Conversation, so a spoken command can switch a
  light on with nothing leaving your machines. The legacy `functions` format works
  too.
- Only models that can call tools are used (each machine reports them); asking
  for one that cannot is a clear 400 that names the ones that can. A request with
  tools never goes to a cloud provider, stays on one model and one machine for the
  whole exchange, and is never summarised.

---

<div dir="rtl">

- **קריאה לכלים (בתבנית של OpenAI), בשביל Home Assistant ומערכות דומות:** בקשת צ'אט
  עם רשימת כלים מקבלת עכשיו בחזרה קריאה לכלי, בזרימה או בתשובה אחת, והתור שאחריו,
  עם תוצאות הכלים, מקבל את התשובה. נבנה בשביל התוסף Extended OpenAI Conversation,
  כך שפקודה קולית מדליקה אור בלי שדבר יוצא מהמכונות שלכם. גם התבנית הישנה של
  פונקציות עובדת.
- רק מודלים שיודעים לקרוא לכלים משמשים לזה (כל מכונה מדווחת עליהם); בקשה למודל שלא
  יודע מקבלת שגיאה ברורה עם רשימת המודלים שכן יודעים. בקשה עם כלים אף פעם לא נשלחת
  לענן, נשארת על אותו מודל ואותה מכונה לאורך כל השיחה, ואף פעם לא מסוכמת.

</div>

Download page / דף ההורדה: https://yaarilevrosen-cpu.github.io/llm-api-releases/

SHA-256: see `SHA256SUMS`.
