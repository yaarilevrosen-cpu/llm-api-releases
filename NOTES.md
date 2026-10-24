**llm-api 4.12.0** - 2026-10-24

- **See where each model runs:** for every loaded model on every machine, how much
  is in GPU memory and how much in system RAM (that part runs on the CPU), with
  free and total GPU memory and the context it was loaded with - in Models, on
  the Fleet cards, and under a chat answer when the model was not fully on the GPU.
- **Choose, per model and machine:** Auto (as before), GPU only (never partly on
  the CPU: the machine refuses and another machine or the cloud answers), or a
  number of layers on the GPU; and a default context, with a warning when it
  would not fit.
- **Routing prefers a model that fits fully on a GPU;** "fast" never picks a split
  model when a fully-GPU one is available. The reason says "fits on GPU" or
  "split 30% CPU".
- **Speed test per model and machine** at its current setting.
- API: `options` in `/v1/chat/completions` passes Ollama options (num_ctx,
  num_gpu, seed, ...); a client's own options always win.

---

<div dir="rtl">

- **רואים איפה כל מודל רץ:** לכל מודל טעון בכל מכונה - כמה ממנו בזיכרון של כרטיס
  המסך וכמה בזיכרון המחשב (החלק הזה רץ על המעבד), עם הזיכרון הפנוי והכולל של
  הכרטיס וההקשר שבו נטען - במודלים, בכרטיסי הצי, ומתחת לתשובה בצ'אט כשהמודל לא היה
  כולו בכרטיס.
- **בוחרים, לכל מודל ומכונה:** אוטומטי (כמו קודם), רק כרטיס מסך (אף פעם לא חלקית
  על המעבד: המכונה מסרבת ומכונה אחרת או הענן עונים), או מספר שכבות בכרטיס; וגם
  הקשר ברירת מחדל, עם אזהרה כשהוא לא ייכנס.
- **הניתוב מעדיף מודל שנכנס כולו לכרטיס;** מצב "מהיר" לא בוחר מודל מפוצל כשיש
  אפשרות שכולה בכרטיס. הסיבה נכתבת: "fits on GPU" או "split 30% CPU".
- **בדיקת מהירות לכל מודל ומכונה** בהגדרה הנוכחית.

</div>

Download page / דף ההורדה: https://yaarilevrosen-cpu.github.io/llm-api-releases/

SHA-256: see `SHA256SUMS`.
