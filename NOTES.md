**llm-api 4.16.0** - 2026-11-08

- **Home network access:** a new setting, Settings > Home network (LAN), lets
  devices on your home network (addresses 10.x, 172.16-31.x, 192.168.x and
  private IPv6) use the API and the console just like your Tailscale machines -
  for example a Home Assistant server that has no Tailscale. It is off for new
  installs (`--lan` turns it on at install time); with it off, such devices are
  refused with a message that says where to turn it on. Installs that were
  already set to "anything on my local network" keep working as before.
  Requests from the internet (Funnel) never count as the home network, whatever
  address they claim, and a direct connection from a public address is treated
  like the internet.
- With home network access on, a machine that listens on its Tailscale address
  also listens on its home network address after its next restart.
- **Always-loaded models:** Settings > Routing has a new field for models that
  stay loaded for good, so the first request of the day does not wait for the
  model to load.
- Fixed: a request right after another one could be refused as "busy" for up
  to 10 seconds although the machine had already answered.
- Fixed: `keep_alive: "-1"` (keep the model loaded) was refused by Ollama 0.40;
  it is now sent in the form Ollama accepts.

---

<div dir="rtl">

- **גישה מרשת הבית:** הגדרה חדשה, הגדרות > רשת הבית, מאפשרת למכשירים ברשת הבית
  (כתובות 10.x, ‏172.16-31.x, ‏192.168.x וכתובות IPv6 פרטיות) להשתמש בממשק ובמסוף
  בדיוק כמו המחשבים שמחוברים ל־Tailscale, למשל שרת Home Assistant בלי Tailscale.
  בהתקנה חדשה היא כבויה (`--lan` מדליק אותה בזמן ההתקנה), וכשהיא כבויה מכשירים
  כאלה נחסמים עם הודעה שאומרת איפה מדליקים אותה. התקנות שכבר הוגדרו "כל מי שברשת
  המקומית" ממשיכות לעבוד כמו קודם. בקשה מהאינטרנט (Funnel) אף פעם לא נחשבת לרשת
  הבית, לא משנה איזו כתובת היא טוענת, וחיבור ישיר מכתובת ציבורית נחשב לאינטרנט.
- כשהגישה מרשת הבית דולקת, מחשב שמאזין לכתובת של Tailscale מאזין גם לכתובת שלו
  ברשת הבית, אחרי ההפעלה הבאה שלו.
- **מודלים שנשארים טעונים:** בהגדרות > ניתוב יש שדה חדש למודלים שנשארים טעונים
  תמיד, כדי שהבקשה הראשונה של היום לא תחכה לטעינת המודל.
- תוקן: בקשה מיד אחרי בקשה אחרת יכלה להידחות כ"עסוק" עד 10 שניות, למרות שהמחשב
  כבר ענה.
- תוקן: `keep_alive: "-1"` (להשאיר את המודל טעון) נדחה על ידי Ollama 0.40; עכשיו
  הוא נשלח בצורה ש־Ollama מקבל.

</div>

Download page / דף ההורדה: https://yaarilevrosen-cpu.github.io/llm-api-releases/

SHA-256: see `SHA256SUMS`.
