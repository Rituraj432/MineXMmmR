<div align="center">

  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:0d1117,50:1f2937,100:ff6600&height=220&section=header&text=MineXMmmR&fontSize=65&fontColor=ffffff&fontAlignY=38&desc=Automated%20Monero%20(XMR)%20%26%20QRL%20CPU%20Mining%20Suite%20for%20Windows&descAlignY=62&descSize=18" width="100%" alt="MineXMmmR Header Banner" />

  <br />

  <p>
    <img src="https://img.shields.io/badge/Platform-Windows%20x64-0078D6?style=for-the-badge&logo=windows&logoColor=white" alt="Windows x64" />
    <img src="https://img.shields.io/badge/Engine-XMRig%20v6.26.0-FF6600?style=for-the-badge&logo=monero&logoColor=white" alt="XMRig" />
    <img src="https://img.shields.io/badge/Algorithm-RandomX%20(rx%2F0)-00D4FF?style=for-the-badge" alt="RandomX" />
    <img src="https://img.shields.io/badge/Automation-Batch%20%26%20VBScript-2EA44F?style=for-the-badge" alt="Batch & VBS" />
  </p>

  <br />

  <table>
    <tr>
      <td align="center" width="320" style="background-color:#0d1117; padding:20px;">
        <img src="https://cryptologos.cc/logos/monero-xmr-logo.png?v=035" width="140" height="140" alt="Monero (XMR) Official Logo" />
        <h3>Monero (XMR)</h3>
        <p><strong>Pool:</strong> SupportXMR (Port 3333)<br/><strong>Algorithm:</strong> RandomX (<code>rx/0</code>)</p>
      </td>
      <td align="center" width="320" style="background-color:#0d1117; padding:20px;">
        <img src="https://cryptologos.cc/logos/quantum-resistant-ledger-qrl-logo.png?v=035" width="140" height="140" alt="Quantum Resistant Ledger (QRL) Official Logo" />
        <h3>Quantum Resistant Ledger (QRL)</h3>
        <p><strong>Pool:</strong> HeroMiners SG (Port 1166)<br/><strong>Algorithm:</strong> RandomX (<code>rx/0</code>)</p>
      </td>
    </tr>
  </table>

</div>

---

## Overview

**MineXMmmR** is a lightweight, automated Windows CPU mining framework powered by **XMRig**. Designed for stability, background execution, and controlled resource utilization, it enables seamless mining of **Monero (XMR)** and **Quantum Resistant Ledger (QRL)** with built-in network verification, silent execution, and password-protected termination.

---

## Key Features

* **Network-Aware Auto-Start:** Continuously verifies active internet connectivity (`1.1.1.1`) before initializing the miner to prevent connection drops or failed share submissions on boot.
* **Dual-Coin Support (`rx/0`):** Pre-configured launchers for both **Monero (XMR)** via SupportXMR and **QRL** via HeroMiners.
* **Thermal & Resource Throttling:** Caps CPU thread allocation at **35%** with low process priority (`--cpu-priority 1`) so host machines remain responsive and cool during extended sessions.
* **Stealth Background Execution:** Uses a native Windows Script Host wrapper (`silent.vbs`) to run mining operations completely hidden without cluttering the taskbar or desktop.
* **Password-Protected Termination:** Prevents unauthorized shutdowns by requiring password verification before terminating active `xmrig.exe` processes.

---

## Repository Architecture

| File / Component | Role & Technical Function |
| :--- | :--- |
| **`mine.bat`** | Primary Monero (XMR) launcher. Navigates to `C:\xmrig`, waits for network readiness via ICMP ping, and initiates XMRig on SupportXMR. |
| **`QRLmine.bat`** | Primary QRL launcher. Performs network verification and connects XMRig (`rx/0` with keepalive) to HeroMiners (`sg.qrl.herominers.com:1166`). |
| **`mine2.bat`** | Deployment and maintenance utility script handling automated archive download and directory extraction. |
| **`silent.vbs`** | VBScript wrapper (`WScript.Shell`) that executes the batch launcher in hidden window mode (`0`) asynchronously. |
| **`stop.bat`** | Interactive termination utility that prompts for an authorization password before executing `taskkill` on `xmrig.exe`. |
| **`CMD`** | Attribute and command configuration helper for XMRig runtime parameters. |
| **`xmrig-6.26.0-windows-x64.zip`** | Bundled 64-bit Windows release archive of the XMRig miner. |

---

## Deployment & Workflow

1. **Extract Miner Binary:** Unpack `xmrig-6.26.0-windows-x64.zip` into **`C:\xmrig`** so that `xmrig.exe` resides directly inside the root directory.
2. **Select Target Coin:**
   * Run **`mine.bat`** to mine **Monero (XMR)**.
   * Run **`QRLmine.bat`** to mine **Quantum Resistant Ledger (QRL)**.
3. **Silent Background Mode:** Execute **`silent.vbs`** to launch the miner invisibly in the background (update the script target path if switching between `mine.bat` and `QRLmine.bat`).
4. **Authorized Shutdown:** Run **`stop.bat`** and enter the verification password to cleanly terminate the mining process.

---

<div align="center">
  <sub>Maintained by <strong>Rituraj432</strong> • Powered by XMRig RandomX Engine</sub>
</div>
