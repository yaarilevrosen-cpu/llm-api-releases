**llm-api 4.11.1** - 2026-10-24

- **Windows, fleets:** when this machine starts a fleet (on the welcome screen)
  or joins one, the setup adds a Windows Firewall rule that lets other
  machines reach the API port **only from Tailscale addresses**
  (100.64.0.0/10 and fd7a:115c:a1e0::/48) - nothing from the local network or
  the internet. A single machine opens nothing. The uninstaller removes the rule.
- **Windows:** Tailscale installed after llm-api is found right away, without
  restarting the computer.

---

<div dir="rtl">

- **Windows, צי:** כשהמכונה מתחילה צי (במסך הפתיחה) או מצטרפת לצי, ההתקנה מוסיפה
  כלל בחומת האש של Windows שמאפשר למכונות אחרות להגיע לפורט ה־API **רק מכתובות
  של Tailscale** (100.64.0.0/10 ו־fd7a:115c:a1e0::/48) - לא מהרשת המקומית ולא
  מהאינטרנט. מכונה בודדת לא פותחת כלום. ההסרה מוחקת את הכלל.
- **Windows:** Tailscale שהותקן אחרי llm-api מזוהה מיד, בלי להפעיל מחדש את המחשב.

</div>

Download page / דף ההורדה: https://yaarilevrosen-cpu.github.io/llm-api-releases/

SHA-256: see `SHA256SUMS`.
