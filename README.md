**CHACHA20 ENCRYPTION CIPHER - FPGA SYNTHESIS**
=============================================================================================================  
	Start   - 21/09/2025  
	End	- xx/xx/20xx  

ABOUT  
-------------------------------------------------------------------------------------------------------------  
```
  This project implements the chacha20 encryption cipher on a hardware level, with proper simulation across all test cases, synthesis and implementation on FPGA board (board yet to be decided). This project is being executed while implementing all Professional standards across various domains namely, Github,repository managment, scripting using Tcl for automation, using python to convert logs and data into visual graphs.
```  

STRUTURE  
-------------------------------------------------------------------------------------------------------------  
```
  └─ Chacha20/  
    ├─ chacha20/        ← Vivado’s internal project folder (all .xpr, .runs, .Xil, etc.)  
    ├─ src/             ← Your clean RTL  
    ├─ tb/              ← Testbench  
    ├─ sim/             ← TCL/run scripts  
    ├─ docs/            ← Reports, diagrams  
    ├─ constraints/     ← XDC files  
    ├─ build/           ← (optional) manual build outputs  
    └─ .gitignore    
```

TOOLS & TECHNIQUES  
-------------------------------------------------------------------------------------------------------------   
```
1. Vivado  - GUI + Tcl  
2. Python  - Pandas  
3. Github  - Repo Management  
4. GTKwave - Waveform  
5. SystemVerilog - Module + Testbench  
```


# Async FIFO with CDC, UVM & STA (Planned)

> **Status:** RTL in progress (write path partially implemented).  
> **Goal:** Build an industry-grade Async FIFO IP with correct CDC handling, UVM-based verification, and STA-aware synthesis results.

---

## 1. Project Overview
This project implements a **configurable asynchronous FIFO** supporting independent read and write clock domains. The design follows industry-standard CDC practices using Gray-coded pointers and multi-flop synchronizers, and is verified incrementally using waveform-based testing and later **UVM**. Timing closure and quality-of-results (QoR) are evaluated using **STA** after synthesis.

This repository is intentionally structured to scale from **basic RTL bring-up → UVM → STA → publishable IP-quality results**.

---

## 2. Repository Folder Structure

```
ChaCha20 Hardware Encryption Engine/  
│ 
├── build/                     # vivado internal and operational files (hidden)  
│  
├── docs/                      # Documentation, diagrams, PDFs  
│   ├── architecture/          # Block diagrams, CDC explanation  
│   │   └── structure.md            
│   ├── waveforms/             # Final waveform screenshots (.png/.wlf refs)  
│   ├── reports/               # Synthesis / STA reports (timing, utilization)  
│   └── notes.md               # Design notes & observations  
│                          
├── results/                   # (hidden) 
│   ├── waveforms/             (NEEDS TO BE ADDED)       
│   ├── timing/                (NEEDS TO BE ADDED)       
│   └── utilization/           (NEEDS TO BE ADDED)       
│  
├── rtl/                       # Synthesizable RTL  
│   ├── chacha20_top.sv  
│   ├── core.sv  
│   ├── key_manager.sv  
│   └── quarter_round.sv  
│  
├── scripts/                    
│   ├── gen_scripts/           # constraint file for fpga board (NA) 
│   │   │── gen_constants.py            
│   │   │── gen_keys.py            
│   │   │── gen_nonce.py          
│   │   └── gen_values.py          
│   └── key_generator.bat  
│  
├── sim/                       # Simulator-specific scripts  
│   └── sim_inputs/  
│   │   │── constants.txt            
│   │   │── keys.txt            
│   │   │── nonce.txt          
│   │   └── values.txt          
│   └── tcl_main.txt  
│  
├── syn/                       (NEEDS TO BE ADDED)
│   ├── constraints/           (NEEDS TO BE ADDED)
│   │   └── constraints.xdc    (NEEDS TO BE ADDED)
│   ├── scripts/               (NEEDS TO BE ADDED)
│   └── reports/               (NEEDS TO BE ADDED)
│  
├── tb/                        # Non-UVM testbench (initial bring-up)  
│   └── mainTB.sv  
│  
├── README.md
└── .gitignore  
```

---

## 3. Design Architecture

### 3.1 Key Features
- Independent **read/write clock domains**
- Gray-coded pointer based CDC
- Dual-flop synchronizers
- Full / Empty / (Planned) Almost-Full flags
- Parameterized depth and data width

### 3.2 CDC Strategy
- Binary pointers generated locally
- Gray-coded pointers synchronized across domains
- Gray → Binary conversion post-synchronization
- Full/Empty computed using synchronized pointers only

*(Add block diagram here in `/docs/architecture`)*

---

## 4. Verification Strategy

### 4.1 Phase 1 – Directed Testbench (Current)
- Clock-domain independent stimulus
- Write/read burst testing
- Wrap-around and boundary stress
- Manual waveform inspection

### 4.2 Phase 2 – UVM (Planned)
**Components:**
- Write Agent (Driver + Monitor)
- Read Agent (Driver + Monitor)
- Scoreboard with data integrity checks
- Functional coverage:
  - Wrap conditions
  - Empty → Non-empty transitions
  - Full → Non-full transitions

*(Place UVM diagrams and class hierarchy here later)*

---

## 5. Static Timing Analysis (STA) Plan

### Tools
- Vivado (primary)
- Constraints via XDC

### Focus Areas
- Synchronizer paths (CDC marked false paths)
- Write/read domain separation
- Setup / Hold margins

---

## 6. Results & Metrics (Placeholders)

> **NOTE:** These sections will be populated after UVM + STA completion.

### 6.1 Synthesis Results
| Metric | Value |
|------|------|
| LUTs | TBD |
| FFs | TBD |
| BRAM | TBD |
| Fmax | TBD |

### 6.2 Timing Summary
| Path | Slack |
|----|------|
| Write Domain | TBD |
| Read Domain | TBD |

### 6.3 Waveform Evidence
- Write wrap-around verification
- Read/write concurrency
- CDC stability

*(Waveforms stored in `/docs/waveforms`)*

---

## 7. Simulation Instructions

### ModelSim
```
do sim/modelsim/compile.do
do sim/modelsim/simulate.do
```

### Vivado
```
source sim/vivado/sim.tcl
```

---

## 8. Roadmap

- [x] RTL skeleton
- [ ] Folder restructuring (current)
- [ ] README standardization
- [ ] GitHub initial upload
- [ ] Correct read/write CDC handling
- [ ] UVM verification
- [ ] STA & synthesis results
- [ ] Resume & portfolio update
- [ ] Log → Graph automation (Python)

---

## 9. Author
**Yusuf Ahmad**  
B.Tech ECE | RTL & VLSI Design  

---

> *This project is part of a long-term RTL IP portfolio targeting industry-grade design and verification roles.*

