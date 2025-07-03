
# RTL-to-GDS Implementation of Low Power Configurable Multi-Clock Digital System

This project implements a complete digital system using Verilog HDL that supports multiple clock domains and power-saving mechanisms. The design is fully verified and follows the ASIC flow from RTL to synthesis, timing analysis, and layout generation (GDSII).

<p align="center">
  <img src="docs/final_system_block_diagram.png" alt="System Block Diagram" width="700"/>
</p>

## 🔍 Overview

The system is designed to demonstrate how low-power design and multi-clock domain support can be integrated into a complete digital datapath that communicates over UART. The block diagram above illustrates the core modules and their interconnections.

### 🎯 Key Features

- Multiple independent clock domains: REF_CLK, UART_CLK, TX_CLK, RX_CLK
- Low power design using clock gating
- Reset synchronization across domains
- Fully decoupled transmit/receive via Async FIFO
- Complete ALU and register file integration
- UART-based communication with external testbench

---

## 🧱 Top-Level Modules

| Module        | Description |
|---------------|-------------|
| SYS_CTRL      | Controls operation, communication, and data flow across the system |
| RegFile       | Register file to hold operands and results |
| ALU           | Arithmetic and logic operations |
| ASYNC FIFO    | Asynchronous FIFO for clock domain crossing |
| Clock Dividers| Independent dividers for TX and RX paths |
| UART          | Serial communication interface |
| Reset Syncs   | Domain-specific reset synchronization modules |
| Clock Gating  | Power optimization via gating unused clocks |

---

## 🛠️ Technologies Used

- Verilog HDL (RTL design)
- Synthesis-ready and FPGA-validatable
- Clock gating and reset synchronization techniques
- Designed for implementation from RTL to GDSII in ASIC flow

---

## 📂 File Structure

```
├── rtl/                # Verilog source files
├── synthesis/          # Synthesis scripts and reports
├── reports/            # Power, timing, and area reports
├── docs/               # Project documentation and diagrams
├── testbench/          # Verification files
└── README.md
```

---

## 📊 Results Summary

| Metric         | Value         |
|----------------|---------------|
| Max Freq       | xxx MHz       |
| Area           | xx,xxx µm²    |
| Dynamic Power  | x.xx mW       |
| Static Power   | x.xx µW       |
| Hold Violations| 0             |

---

## 📤 How to Run

1. Clone this repo:
   ```bash
   git clone https://github.com/Sara2mahmoud/RTL-to-GDS-Implementation-of-Low-Power-Configurable-Multi-Clock-Digital-System.git
   cd RTL-to-GDS-Implementation-of-Low-Power-Configurable-Multi-Clock-Digital-System
   ```

2. Run synthesis scripts:
   ```bash
   cd synthesis
   source run_dc.tcl
   ```

3. Simulate and verify:
   ```bash
   cd testbench
   # Run your simulator with testbench files
   ```

4. Analyze power and timing:
   ```bash
   cd reports
   # View area, power, and STA results
   ```

---

## 👩‍💻 Author

- Sara Mahmoud — [GitHub](https://github.com/Sara2mahmoud)

---

## 📜 License

This project is provided for educational purposes and non-commercial use.
