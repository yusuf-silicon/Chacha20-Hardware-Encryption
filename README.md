**CHACHA20 ENCRYPTION CIPHER - FPGA SYNTHESIS**
=============================================================================================================  
	Start   - 21/09/2025  
	End	- xx/xx/20xx  

ABOUT  
-------------------------------------------------------------------------------------------------------------  
```
  This project implements the chacha20 encryption cipher on a hardware level, with proper simulation across all  
  test cases, synthesis and implementation on FPGA board (board yet to be decided). This project is being execu  
  -ted while implementing all Professional standards across various domains namely -  UVM verification, Github,   
  repository managment, scripting using Tcl for automation, using python to convert logs and data into visual g  
  -raphs.
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