# ChaCha20 Core
> FPGA-Oriented ChaCha20 RTL Architecture Featuring Iterative Quarter-Round Transformation Logic, FSM-Controlled Sequencing, Staged Datapath Organization, Synthesis-Aware Hardware Exploration, and Foundational Accelerator-Oriented Design Evolution

---
**Full Name:** FPGA-Based ChaCha20 Encryption Core using SystemVerilog  
**Status:**    Complete / Foundational Architectural Project  
**Duration:**  August 28, 2025 - December 10, 2025  
.
---
**Primary Objective:**
> To design and implement a synthesizable ChaCha20 encryption architecture capable of executing iterative quarter-round transformations using structured RTL datapath organization and FSM-controlled sequencing.

**Engineering Purpose:**
> To develop practical expertise in cryptographic hardware implementation, iterative datapath sequencing, combinational vs sequential RTL interaction, FPGA synthesis workflows, timing analysis, and hardware-oriented algorithm realization using SystemVerilog.

---

## Project Context:

### 1. NTCC Minor Project Foundation

**Academic Encryption Hardware Project**

* Originally developed as part of the NTCC Minor Project requirement under the university academic framework.
* The project objective required the implementation of a hardware encryption unit along with FPGA synthesis and implementation analysis.
* Initial exploration considered both AES and ChaCha20 architectures.
* AES was intentionally avoided due to its excessive commonality in student projects and the desire to explore a more unique cryptographic design.
* ChaCha20 was selected after studying:
  * RFC7539 specification methodology,
  * quarter-round transformation behavior,
  * state evolution mechanisms,
  * and stream-cipher-oriented computational structure.
* The project became one of the earliest serious explorations into:
  * synthesis workflows,
  * timing analysis,
  * implementation reports,
  * power analysis,
  * and FPGA-oriented hardware realization.

### 2. Personal RTL Architecture Exploration

**Cryptographic Datapath & Sequencing Exploration**

* Although initially approached as an academic requirement, the project gradually evolved into a significantly larger RTL architecture exploration effort.
* The implementation introduced increasingly complex hardware concepts including:
  * iterative datapath sequencing,
  * FSM-controlled operation flow,
  * internal state management,
  * valid-ready synchronization behavior,
  * and staged computational execution.
* The project marked one of the earliest transitions from:
  * simple RTL experimentation,
  * toward structured hardware subsystem thinking.
* Major learning areas included:
  * combinational vs sequential interaction,
  * register-driven state evolution,
  * transformation-cycle management,
  * timing closure awareness,
  * synthesis visibility,
  * and implementation tradeoffs.

### 3. Evolution into Pipelined ChaCha20 Architecture

**Architectural Scalability & Accelerator Evolution**

* The original architecture successfully demonstrated functional ChaCha20 RTL execution but exposed several scalability and integration limitations.
* The implementation relied heavily on:
  * large exposed interfaces,
  * explicit internal state visibility,
  * direct datapath accessibility,
  * and manually coordinated transformation flow.
* These architectural limitations eventually motivated the development of:
  * a significantly more structured pipelined ChaCha20 architecture,
  * scalable datapath organization,
  * improved modularity,
  * and accelerator-oriented refinement.
* The later pipelined ChaCha20 revision eventually evolved into:
  * standalone advanced cryptographic architecture work,
  * IEEE publication-oriented research,
  * and more integration-friendly hardware organization.

### 4. Future Accelerator & SoC Relevance

**Foundation for Future Hardware Accelerator Integration**

* Although not originally designed as a production accelerator IP, this project became one of the earliest architectural foundations for:
  * hardware acceleration concepts,
  * iterative compute-engine organization,
  * staged datapath execution,
  * and modular cryptographic subsystem design.
* Several architectural concepts explored here later influenced:
  * future RISC-V SoC integration planning,
  * hardware accelerator experimentation,
  * and larger RTL subsystem development.

---

## Version & Development Timeline

### v1.0 - NTCC Functional ChaCha20 Revision

* Initial ChaCha20 RTL implementation
* Quarter-round transformation architecture
* FSM-controlled sequencing behavior
* Directed waveform-level validation
* FPGA synthesis and implementation exploration
* Timing and utilization analysis
* Internal state-register organization
* Functional encryption datapath established

### v1.1 - Architectural Refinement Revision

* Improved modular decomposition
* Internal state organization refinement
* Enhanced sequencing behavior
* Better datapath stabilization
* Improved waveform-driven validation
* Structural RTL cleanup and refinement
* Hardware behavior stabilization across synthesis workflows

### v2.0 - Accelerator Evolution Revision

* Architectural transition toward pipelined ChaCha20 design
* Improved scalability-oriented thinking
* Better modular hardware organization
* Foundation for accelerator-oriented cryptographic architecture
* Future RISC-V hardware accelerator relevance established

| Version | Duration | Context | Description |
| --- | --- | --- | --- |
| v1.0    | August 28, 2025 - September 20, 2025 | NTCC Minor Project Foundation | Initial ChaCha20 RTL implementation involving quarter-round transformation logic, FSM-controlled sequencing, waveform-driven validation, FPGA synthesis exploration, and early hardware-oriented cryptographic architecture development. |
| v1.1    | September 20, 2025 - September 26, 2025 | Architectural Refinement & Datapath Stabilization | Major architectural refinement focused on modular decomposition, transformation sequencing stabilization, improved internal state organization, synthesis behavior refinement, and more structured hardware datapath organization.       |
| v2.0    | October 05, 2025 - December 10, 2026 | Pipelined Architecture & Accelerator Evolution    | Architectural transition toward more scalable pipelined ChaCha20 organization, accelerator-oriented hardware structuring, future cryptographic subsystem planning, and early hardware accelerator integration relevance.                 |  

---

# 1. Executive Summary

This project implements a **modular FPGA-oriented ChaCha20 encryption core** designed using SystemVerilog and synthesizable RTL methodology for iterative stream-cipher execution, staged datapath sequencing, and FSM-controlled cryptographic transformation flow. The architecture was developed initially as part of an NTCC Minor Project and later evolved into a significantly deeper exploration of cryptographic hardware organization, synthesis-aware RTL engineering, and accelerator-oriented architectural thinking.

The primary engineering challenge addressed by this project is the hardware realization of a modern stream-cipher architecture capable of performing deterministic iterative state transformations while maintaining structured datapath organization, modular execution flow, and synthesizable FPGA-compatible hardware behavior. Unlike conventional AES-oriented student encryption implementations, ChaCha20 introduced a substantially different architectural model based on:

* iterative quarter-round transformations,
* state-driven computation,
* add–XOR–rotate arithmetic structure,
* and sequential transformation-cycle progression.

The design separates:

* quarter-round transformation logic,
* key and nonce management,
* internal state organization,
* and FSM-controlled execution sequencing

into independently managed architectural subsystems coordinated through staged datapath progression.

The ChaCha20 architecture uses:

* iterative quarter-round execution,
* register-based state evolution,
* FSM-controlled operational sequencing,
* and staged transformation flow

to progressively update the internal 512-bit ChaCha20 state matrix across multiple execution cycles.

The project evolved through multiple engineering revisions:

* initial academic encryption implementation,
* waveform-driven functional validation,
* synthesis and timing-analysis exploration,
* modular architectural refinement,
* and eventually accelerator-oriented pipelined architecture evolution.

A major focus of the project was understanding:

* combinational vs sequential RTL interaction,
* transformation-cycle management,
* FPGA synthesis workflows,
* timing-analysis interpretation,
* hardware resource utilization,
* and interface scalability limitations.

The verification environment was implemented using:

* SystemVerilog,
* Vivado simulation workflows,
* waveform-driven validation,
* directed functional testing,
* and RFC7539-oriented transformation analysis.

The architecture implemented:

* FSM-controlled execution states,
* staged datapath sequencing,
* iterative transformation progression,
* internal register-driven state management,
* and synchronized output-delivery behavior.

Synthesis and implementation analysis explored:

* FPGA timing behavior,
* utilization reporting,
* implementation constraints,
* power estimation,
* and datapath-driven hardware cost visibility.

One of the most important architectural realizations encountered during development involved the scalability limitations associated with excessively exposed datapath interfaces and large external I/O visibility. These observations eventually motivated the transition toward a significantly more scalable pipelined ChaCha20 architecture developed later as a separate advanced project.

The later pipelined ChaCha20 evolution eventually contributed toward:

* IEEE publication-oriented work,
* accelerator-oriented cryptographic architecture exploration,
* and future RISC-V SoC hardware accelerator integration planning.

From an engineering perspective, this repository represents a major transition from:

> waveform-oriented RTL experimentation

toward:

> structured cryptographic hardware architecture reasoning, synthesis-aware RTL engineering, and accelerator-oriented datapath design methodology.

The project is historically important within the broader RTL portfolio because it marks the beginning of:

* serious datapath-oriented architectural thinking,
* iterative hardware transformation design,
* synthesis-aware FPGA implementation analysis,
* and future accelerator-oriented RTL subsystem development.

---

## 2. Repository Folder Structure

```
ChaCha20 Core/  
│  
├── build/  
│   └── vivado/  
│  
├── constraints/  
│   └── constraints.xdc  
│  
├── data/  
│   ├── constants.txt
│   ├── keys.txt
│   ├── nonce.txt
│   └── value.txt
│  
├── docs/  
│   └── architecture/  
│       │── complete code.txt  
│       └── structure.md  
│  
├── results/  
│   ├── core waveform.png  
│   ├── data flow design.png  
│   ├── key manager waveform.png  
│   ├── power  
│   ├── quarter round waveform.png  
│   ├── schematic.pdf  
│   └── tb waveform.png  
│  
├── rtl/  
│   ├── chacha20_top.sv  
│   ├── core.sv  
│   ├── key_manager.sv  
│   └── quarter_round.sv  
│  
├── scripts/  
│   ├── gen_scripts/  
│   │   │── gen_constants.py  
│   │   │── gen_keys.py  
│   │   │── gen_nonce.py  
│   │   └── gen_values.py  
│   └── key_generator.bat  
│  
├── sim/  
│   └── sim_inputs/  
│   │   │── constants.txt  
│   │   │── keys.txt  
│   │   │── nonce.txt  
│   │   └── values.txt  
│   └── tcl_main.txt  
│  
├── tb/  
│   └── mainTB.sv  
│  
├── .gitignore  
└── README.md  
```

---

# 3. Design Architecture

The ChaCha20 encryption core was architected as a modular FPGA-oriented RTL subsystem focused on iterative cryptographic state transformation, staged datapath sequencing, and deterministic FSM-controlled execution flow. Unlike conventional AES-oriented encryption implementations commonly seen in academic FPGA projects, this architecture explored a significantly different computational model centered around sequential add–XOR–rotate transformations operating over an evolving 512-bit internal state matrix.

The primary architectural objective of the design was not simply functional encryption correctness, but rather the hardware realization of a standardized stream-cipher algorithm using:
* synthesizable RTL methodology,
* modular subsystem decomposition,
* sequential transformation progression,
* and FPGA-aware implementation structure.

A major focus of the project involved understanding how large cryptographic state transformations behave under:
* sequential RTL execution,
* synthesis constraints,
* timing-analysis visibility,
* and staged datapath organization.

The architecture intentionally avoided:
* fully combinational transformation execution,
* deep parallelism,
* and lookup-table-heavy cryptographic organization

in favor of:
* iterative sequential progression,
* waveform-visible transformation stages,
* and synthesis-friendly hardware decomposition.

## 3.1 High-Level Architecture

The architecture is organized around four primary subsystem layers:

| Subsystem | Primary Function | Architectural Role |
|---|---|---|
| Input & State Initialization | Organizes plaintext, constants, key, and nonce values | Builds the initial ChaCha20 state matrix |
| Key Manager | Controls key/nonce preparation and initialization sequencing | Coordinates cryptographic state setup |
| Quarter-Round Engine | Executes add–XOR–rotate transformations | Performs iterative ChaCha20 state mixing |
| FSM Core Controller | Coordinates staged execution behavior | Manages transformation sequencing and output synchronization |

The overall architecture follows a staged sequential execution model where the internal state matrix evolves progressively across multiple clock cycles through repeated quarter-round transformations.

Unlike throughput-oriented industrial cryptographic pipelines, this architecture prioritizes:
* architectural clarity,
* transformation observability,
* synthesis visibility,
* and staged datapath reasoning.

---

## System-Level Communication Flow

```text
Input Values / Constants / Keys / Nonce
                    ↓
         Internal State Initialization
                    ↓
            Key Preparation Stage
                    ↓
        FSM-Controlled Operation Flow
                    ↓
      Iterative Quarter-Round Execution
                    ↓
        Internal State Transformation
                    ↓
          Ciphertext Output Delivery
```

---

## Architectural Execution Philosophy

The design adopts:
* iterative state transformation,
* staged sequential progression,
* and register-driven datapath evolution

instead of:
* single-cycle combinational execution.

This decision significantly reduced:
* combinational path complexity,
* immediate synthesis pressure,
* and timing instability

while improving:
* waveform-level debugging visibility,
* architectural observability,
* and deterministic operational sequencing.

The architecture later became the conceptual foundation for:
* pipelined ChaCha20 evolution,
* accelerator-oriented datapath refinement,
* and future cryptographic subsystem integration work.

## 3.2 Module Hierarchy

The architecture separates:
* transformation logic,
* control sequencing,
* state organization,
* and output coordination

into independently managed RTL subsystems connected through staged sequential datapath propagation.

---

## Structural Architecture Overview

| Module | Responsibility | Engineering Significance |
|---|---|---|
| Top Module | Coordinates subsystem integration and execution flow | Central architectural orchestration layer |
| Quarter-Round Module | Executes ChaCha20 arithmetic transformations | Core cryptographic transformation engine |
| Key Manager | Handles key, nonce, and initialization sequencing | Cryptographic state preparation |
| FSM Core Controller | Controls operational sequencing and execution states | Deterministic hardware lifecycle management |
| Internal State Structures | Stores evolving transformation states and intermediate arrays | Sequential datapath evolution infrastructure |

---

## Inter-Module Connectivity

Inter-module communication is coordinated through:
* internal register structures,
* staged transformation arrays,
* FSM-generated control signals,
* synchronized state-update paths,
* and valid-ready operational coordination.

The architecture heavily relies on:
* deterministic sequential propagation,
* controlled transformation visibility,
* and register-synchronized state evolution behavior.

---

## Interface Organization

The architecture exposes interfaces for:
* plaintext/state initialization,
* constants input,
* key loading,
* nonce handling,
* clock/reset control,
* operational-valid signaling,
* and ciphertext output delivery.

One of the most important architectural realizations encountered during development involved the scalability limitations associated with:
* excessively exposed datapath visibility,
* wide external interface structures,
* and large bonded I/O utilization growth.

These observations later motivated:
* more scalable pipelined architectural organization,
* reduced datapath exposure,
* and accelerator-oriented subsystem refinement.

## 3.3 FSM Architecture

The ChaCha20 engine relies heavily on FSM-controlled sequencing to coordinate:
* operational staging,
* transformation progression,
* iterative state evolution,
* and synchronized output behavior.

The FSM became one of the earliest major explorations into:
* hardware execution lifecycle management,
* deterministic staged operation control,
* and sequential cryptographic transformation behavior.

---

## FSM State Organization

```text
IDLE
KEY_OPR
SEND
```

---

## State Transition Flow

```text
IDLE → KEY_OPR → SEND
```

---

## FSM Behavioral Responsibilities

| FSM State | Operational Responsibility | Hardware Behavior |
|---|---|---|
| IDLE | Waits for initialization conditions | Maintains inactive synchronized state |
| KEY_OPR | Executes iterative quarter-round sequencing | Updates internal cryptographic state |
| SEND | Coordinates ciphertext output delivery | Finalizes transaction execution |

---

## Sequential Execution Model

The FSM architecture distributes computation across multiple cycles through:
* staged operational progression,
* iterative state updates,
* synchronized register evolution,
* and transformation-cycle coordination.

This allowed the architecture to maintain:
* deterministic execution behavior,
* manageable synthesis complexity,
* and stable timing characteristics

while preserving:
* transformation visibility,
* waveform traceability,
* and architectural debugging clarity.

## 3.4 Data Flow Architecture

The overall dataflow organization reflects one of the earliest transitions from:
> signal-level RTL experimentation

toward:

> structured datapath-oriented hardware architecture reasoning.

---

## Cryptographic Dataflow Progression

```text
Input State Initialization
            ↓
   Internal State Assembly
            ↓
 Quarter-Round Transformation
            ↓
 Iterative State Evolution
            ↓
  Sequential State Updates
            ↓
 Ciphertext Output Generation
```

---

## Internal State Organization

The architecture organizes the ChaCha20 state using:
* internal register structures,
* transformation arrays,
* staged intermediate values,
* and iterative state-update propagation.

Intermediate transformation values are preserved across operational cycles using:
* sequential register synchronization,
* staged datapath progression,
* and FSM-controlled update timing.

---

## Timing & Transformation Relationships

The architecture relies on:
* clock-driven sequential progression,
* deterministic transformation timing,
* FSM-controlled operational staging,
* and register-synchronized state evolution.

Transformation behavior progresses iteratively across multiple cycles instead of:
* deeply parallel execution,
* speculative transformation flow,
* or combinational state collapse.

This greatly improved:
* synthesis stability,
* operational visibility,
* and waveform-level transformation analysis.

## 3.5 Design Decisions

Several architectural decisions significantly shaped the final implementation.

---

## ChaCha20 Selection Strategy

ChaCha20 was intentionally selected instead of AES due to:
* architectural uniqueness,
* hardware-friendly arithmetic structure,
* RFC7539 standardization clarity,
* and reduced dependency on lookup-table-oriented cryptographic design.

The add–XOR–rotate computational model made the architecture significantly more suitable for:
* iterative RTL exploration,
* sequential datapath reasoning,
* and FPGA-oriented transformation design.

---

## Sequential Transformation Strategy

The architecture intentionally adopted:
* iterative sequential execution

instead of:

* fully combinational cryptographic execution.

This decision improved:
* synthesis behavior,
* timing stability,
* transformation observability,
* and architectural debugging clarity

while sacrificing:
* raw throughput,
* aggressive parallelism,
* and low-latency execution.

This tradeoff later motivated:
* future pipelined ChaCha20 evolution.

---

## FSM-Controlled Operational Coordination

FSM-driven sequencing was selected to:
* coordinate transformation stages,
* simplify execution synchronization,
* manage operational lifecycle progression,
* and maintain deterministic cryptographic behavior.

This also significantly improved:
* waveform-level analysis,
* staged execution visibility,
* and architectural observability during debugging.

---

## Resource & Power Visibility

Although not formally optimized for low-power operation, the project introduced early exposure to:
* switching activity behavior,
* I/O-driven power contribution,
* synthesis-aware implementation cost,
* and hardware activity visibility.

Large externally-visible datapath structures revealed important relationships between:
* interface width,
* datapath exposure,
* routing complexity,
* and dynamic hardware power behavior.

---

## Latency vs Throughput Tradeoff

The architecture prioritizes:
* implementation clarity,
* synthesis stability,
* staged execution reasoning,
* and deterministic transformation visibility

over:
* aggressive throughput optimization.

The iterative execution strategy increased operational latency but substantially improved:
* architectural understandability,
* hardware observability,
* and transformation-level debugging capability.

## 3.6 Assumptions and Constraints

The architecture was developed under several implementation assumptions and hardware constraints.

---

## Architectural Assumptions

The design assumes:
* single synchronous FPGA clock operation,
* deterministic sequential execution,
* stable transformation progression,
* and synchronized register-driven datapath evolution.

---

## Data Structure Constraints

The implementation follows standard ChaCha20 structural requirements including:
* 512-bit internal state organization,
* 256-bit key structure,
* 32-bit transformation words,
* and fixed transformation sequencing behavior.

---

## FPGA-Oriented Constraints

The architecture was constrained by:
* FPGA I/O limitations,
* synthesis-driven interface visibility cost,
* routing complexity growth,
* and datapath scalability restrictions associated with large external state exposure.

These limitations later became one of the primary motivations behind:
* pipelined architectural refinement,
* scalable subsystem decomposition,
* and accelerator-oriented hardware organization.

---

## Timing Assumptions

The architecture assumes:
* deterministic FSM progression,
* stable synchronous timing behavior,
* and sequential transformation-cycle advancement.

Timing closure relied heavily on:
* staged datapath organization,
* sequential operation distribution,
* and reduced combinational-path complexity.

---

## Environmental Assumptions

The implementation assumes:
* FPGA-oriented deployment conditions,
* deterministic simulation behavior,
* stable initialization prior to execution,
* and synthesis-safe RTL operation throughout transformation flow.

---

# 4. Verification Strategy

The verification methodology for the ChaCha20 encryption core focused primarily on:

* directed functional transformation validation,
* waveform-oriented execution analysis,
* FSM sequencing observation,
* and staged datapath correctness verification.

The overall verification strategy focused heavily on:

* transformation consistency,
* sequential state evolution,
* deterministic execution behavior,
* and stable ciphertext generation.

Unlike later projects involving:
* randomized protocol stress testing,
* scoreboard-driven infrastructure,
* transaction-level UVM environments,
* or assertion-based verification,

this project intentionally remained focused on:

* waveform-driven architectural validation,
* deterministic simulation behavior,
* and sequential cryptographic transformation observability.

The verification environment emphasized:

* staged transformation visibility,
* FSM progression analysis,
* internal state observability,
* and simulation-oriented RTL debugging methodology.

## 4.1 Testbench Methodology

The verification environment utilized a directed SystemVerilog testbench architecture focused on validating iterative ChaCha20 transformation behavior and staged execution sequencing.

Rather than abstracting verification into reusable transaction-level infrastructure, the environment relied primarily on:

* directed initialization flow,
* deterministic execution sequencing,
* waveform-level analysis,
* and controlled transformation observation.

This project represented one of the earliest transitions from:

> simple signal-oriented RTL testing

toward:

> structured architectural waveform analysis and sequential datapath verification methodology.

The verification environment was organized around:

* initialization-state generation,
* transformation execution flow,
* FSM progression observation,
* and ciphertext output inspection.

The directed verification environment implemented:

* deterministic input initialization,
* controlled execution sequencing,
* waveform-driven transformation observation,
* and simulation-based output validation.

The simulation workflow additionally utilized:

* Python helper scripts,
* batch execution utilities,
* and organized simulation automation

to assist with:
* repetitive simulation execution,
* initialization generation,
* and structured verification workflow management.

## 4.2 Functional Verification

Functional verification focused primarily on validating:

* ChaCha20 transformation behavior,
* iterative quarter-round execution,
* sequential state evolution,
* and ciphertext generation consistency.

The verification environment validated:

* initialization-state correctness,
* FSM-controlled execution sequencing,
* internal state transformation progression,
* and synchronized output-delivery behavior.

The architecture additionally verified:

* quarter-round operational behavior,
* staged datapath progression,
* deterministic transformation sequencing,
* and repeatable encryption execution flow.

Verification relied heavily on observing:

* internal register evolution,
* transformation-array updates,
* FSM state transitions,
* and sequential operational progression

through waveform-level simulation analysis.

The architecture was developed using RFC7539 documentation as the primary behavioral reference for:

* ChaCha20 operational structure,
* state initialization methodology,
* and quarter-round transformation behavior.

Console-output validation was additionally used to inspect:

* initialization values,
* internal transformation outputs,
* and generated ciphertext behavior.

## 4.3 Edge Case Validation

The verification strategy primarily explored operational stability and deterministic transformation behavior under controlled synchronous simulation conditions.

Unlike later projects involving:
* randomized asynchronous timing stress testing,
* protocol-error injection,
* or large-scale randomized regression infrastructure,

this project intentionally remained focused on:

* stable sequential execution,
* transformation consistency,
* and staged operational correctness.

Boundary-condition observation included:

* reset initialization behavior,
* FSM transition consistency,
* sequential transformation completion,
* and stable output synchronization behavior.

The architecture additionally validated:

* deterministic sequential progression,
* synchronized transformation execution,
* and repeatable operational flow across multiple simulation runs.

The design primarily assumed:

* valid initialization structures,
* stable synchronous execution conditions,
* and deterministic operational sequencing.

No dedicated:
* invalid-input recovery logic,
* fault-tolerant cryptographic handling,
* or randomized corruption testing

was implemented during this project.

## 4.4 Timing Verification

The project focused primarily on functional sequential correctness rather than aggressive timing-closure-oriented optimization.

Timing-oriented verification therefore focused mainly on:

* FSM progression consistency,
* sequential transformation timing,
* register-synchronized datapath evolution,
* and stable staged execution behavior.

The verification environment observed:

* transformation-stage propagation,
* sequential state-update timing,
* FSM-controlled operational staging,
* and synchronized output-delivery progression.

Particular attention was given to understanding:

* how internal states evolved over time,
* how transformation updates propagated sequentially,
* and how staged execution behaved across multiple clock cycles.

The architecture operates entirely within:

* a single synchronous clock domain

and therefore:

* no CDC verification,
* asynchronous synchronization validation,
* metastability analysis,
* or multi-clock timing verification

was implemented during this project.

Timing analysis was additionally explored using:

* Vivado timing reports,
* synthesis-summary infrastructure,
* and implementation-generated timing visibility.

Implementation reports indicated:

* stable sequential timing behavior,
* successful timing closure,
* and no failing endpoints under synthesis conditions.

## 4.5 Assertions and Checks

The project did not implement:

* SystemVerilog Assertions (SVA),
* formal property verification,
* protocol assertion frameworks,
* or industrial assertion-driven verification infrastructure.

Instead, the verification methodology relied primarily on:

* waveform-driven debugging,
* deterministic execution observation,
* FSM transition analysis,
* and sequential operational visibility.

The verification environment performed:

* transformation progression observation,
* FSM state-transition checking,
* sequential state-evolution analysis,
* and ciphertext output inspection.

The verification flow additionally monitored:

* operational consistency,
* transformation stability,
* staged execution behavior,
* and deterministic simulation progression

throughout iterative transformation execution.

Although formal assertions were not implemented, the project still established an important transition toward:

* structured architectural verification methodology,
* waveform-oriented datapath reasoning,
* and synthesis-aware RTL debugging infrastructure.

---

# 5. Implementation Results

The ChaCha20 encryption core was successfully synthesized and analyzed using FPGA-oriented implementation workflows within Xilinx Vivado. Although the architecture was not deployed onto physical FPGA hardware, complete synthesis, utilization, DRC, timing, and power-analysis workflows were performed on the RTL implementation.

This project became one of the earliest practical explorations into:

* FPGA synthesis methodology,
* implementation-report interpretation,
* timing-analysis visibility,
* utilization-driven architectural understanding,
* and hardware-oriented RTL realization.

The implementation flow additionally exposed several important architectural limitations involving:

* excessive external datapath visibility,
* large bonded I/O growth,
* interface scalability constraints,
* and routing-oriented hardware complexity.

Unlike later accelerator-oriented projects focused on:
* aggressive timing optimization,
* deep pipelining,
* or integration-oriented refinement,

this implementation primarily emphasized:

* functional synthesizability,
* staged transformation observability,
* and synthesis-aware cryptographic hardware realization.

## 5.1 Synthesis Results

The architecture was synthesized successfully using:

* Xilinx Vivado 2025.1,
* SystemVerilog RTL methodology,
* and FPGA-oriented synthesis infrastructure.

The synthesized implementation targeted:

```text
xc7s15ftgb196-1
```

corresponding to the:

* Xilinx Spartan-7 FPGA family.

The synthesis flow generated:

* synthesized netlists,
* utilization reports,
* timing summaries,
* DRC reports,
* and implementation-oriented architectural visibility.

The synthesized architecture implemented:

* iterative quarter-round datapath logic,
* FSM-controlled execution sequencing,
* staged transformation progression,
* and register-driven internal state evolution.

The synthesis reports additionally revealed:

* successful RTL elaboration,
* successful module integration,
* and stable sequential hardware realization.

The synthesized hierarchy included:

* top module integration,
* core transformation logic,
* key manager infrastructure,
* and iterative cryptographic execution flow.

## 5.2 Timing Analysis

Timing analysis focused primarily on validating:

* stable sequential progression,
* deterministic FSM-controlled execution,
* synchronized datapath evolution,
* and iterative transformation timing behavior.

The implementation reports indicated:

| Timing Metric | Result |
|---|---|
| Worst Negative Slack (WNS) | Positive |
| Total Negative Slack (TNS) | 0.000 ns |
| Failing Endpoints | 0 |
| Timing Closure | Successful |

The architecture achieved stable timing behavior primarily because computation was distributed across multiple cycles using:

* staged sequential execution,
* iterative quarter-round progression,
* FSM-controlled synchronization,
* and register-driven datapath evolution.

Rather than implementing:
* large fully combinational cryptographic execution paths,

the architecture intentionally adopted:
* iterative sequential transformation behavior

which significantly reduced:

* combinational path pressure,
* timing instability,
* and critical-path growth.

The implementation therefore demonstrated:

* stable sequential timing behavior,
* deterministic transformation progression,
* and synthesis-safe operational timing characteristics.

## 5.3 STA Summary

Static Timing Analysis (STA) was performed using Vivado timing-analysis infrastructure to evaluate:

* sequential timing consistency,
* propagation behavior,
* setup/hold stability,
* and synchronized operational sequencing.

The STA reports confirmed:

* successful timing closure,
* stable sequential execution,
* and deterministic transformation progression under synthesis conditions.

No major:

* setup violations,
* hold violations,
* or failing timing endpoints

were observed during timing analysis.

The architecture maintained timing stability primarily due to:

* iterative execution distribution,
* staged datapath organization,
* reduced combinational complexity,
* and synchronized register-driven transformation flow.

The timing reports additionally provided visibility into:

* sequential propagation timing,
* FSM-controlled execution behavior,
* and staged transformation-cycle progression.

## 5.4 Resource Utilization

The utilization reports provided detailed FPGA resource visibility across the synthesized ChaCha20 architecture.

The implementation consumed FPGA resources primarily through:

* sequential register structures,
* transformation datapath logic,
* FSM-control infrastructure,
* and externally-visible interface organization.

Reported utilization characteristics included:

| Resource Type | Used | Available | Utilization |
|---|---|---|---|
| Slice LUTs | 1917 | 8000 | 23.96% |
| Slice Registers | 2295 | 16000 | 14.34% |
| Block RAM | 0 | 10 | 0.00% |
| DSP Blocks | 0 | 20 | 0.00% |

One of the most important implementation observations involved:

| Resource Type | Used | Available | Utilization |
|---|---|---|---|
| Bonded IOB | 1128 | 100 | 1128.00% |

This extremely high bonded I/O utilization was caused primarily by:

* excessive datapath exposure,
* large externally-visible state structures,
* and wide interface organization.

This became one of the earliest major architectural lessons regarding:

* interface scalability,
* datapath encapsulation,
* integration-oriented subsystem organization,
* and FPGA I/O limitations.

The architecture intentionally prioritized:

* architectural visibility,
* transformation observability,
* and explicit datapath accessibility

over:

* interface minimization,
* hardware encapsulation,
* or deployment-oriented integration efficiency.

## 5.5 Power Analysis

Power analysis was explored using Vivado implementation-report infrastructure.

The analysis provided visibility into:

* switching activity behavior,
* sequential transformation activity,
* I/O-driven power contribution,
* and datapath-oriented hardware activity characteristics.

The architecture primarily generated dynamic activity through:

* iterative quarter-round transformations,
* sequential register updates,
* FSM-controlled operational progression,
* and large externally-visible datapath transitions.

Observed implementation behavior indicated:

* dynamic power dominated overall activity contribution,
* I/O activity contributed significantly toward switching behavior,
* and sequential transformation progression produced consistent datapath activity.

One of the most important implementation observations involved:

* the substantial impact of large externally-visible interfaces on overall switching activity and implementation power behavior.

Although the architecture was not formally optimized for low-power execution, the project became one of the earliest practical explorations into:

* synthesis-aware power visibility,
* FPGA switching behavior,
* and datapath-driven hardware activity analysis.

## 5.6 Performance Metrics

The architecture prioritized:

* deterministic sequential execution,
* staged transformation visibility,
* synthesis-safe operational behavior,
* and architectural clarity

over:

* aggressive throughput optimization,
* deep cryptographic pipelining,
* or high-frequency accelerator-class performance.

Observed implementation characteristics included:

| Performance Characteristic | Observation |
|---|---|
| Execution Model | Iterative Sequential Transformation |
| Transformation Flow | FSM-Controlled |
| Operational Stability | Stable |
| Timing Closure | Successful |
| Sequential Behavior | Deterministic |
| Datapath Visibility | High |
| Throughput Orientation | Functional / Architectural |
| Latency Characteristic | Multi-Cycle Sequential Execution |

The iterative execution model increased:

* operational latency

but significantly improved:

* waveform-level transformation visibility,
* staged execution observability,
* synthesis stability,
* and architectural debugging clarity.

The implementation additionally demonstrated:

* stable iterative cryptographic transformation behavior,
* repeatable ciphertext-generation flow,
* deterministic FSM-controlled execution progression,
* and successful synthesis-aware RTL realization.

The architectural limitations observed during implementation eventually motivated:

* pipelined ChaCha20 evolution,
* scalable cryptographic subsystem refinement,
* and future accelerator-oriented architectural development.

---

# 6. Engineering Challenges & Lessons Learned

The ChaCha20 encryption core became significantly more valuable as an engineering exercise because the architecture repeatedly exposed practical limitations of large RTL datapaths, staged cryptographic transformation flow, and synthesis-aware hardware implementation that were not immediately visible during early functional simulation.

One of the earliest challenges involved realizing that:

> functionally correct RTL behavior does not automatically imply scalable or integration-friendly hardware architecture.

The initial revisions of the design focused heavily on:

* functional encryption execution,
* transformation correctness,
* and waveform-level operational visibility.

However, once the architecture progressed through synthesis and implementation workflows, several hardware-level limitations began appearing involving:

* excessive external datapath visibility,
* bonded I/O overutilization,
* routing complexity growth,
* and poor subsystem scalability.

This became one of the project’s first major engineering lessons:

> architectural visibility and architectural scalability are fundamentally different design goals.

A major implementation challenge involved understanding how iterative cryptographic datapaths behave under sequential hardware execution.

Early development stages implicitly assumed that:

* transformation progression would remain straightforward,
* internal state evolution would remain easily observable,
* and sequential datapath interaction would remain manageable as complexity increased.

However, as the architecture evolved, debugging increasingly required reasoning about:

* staged transformation sequencing,
* iterative state evolution,
* synchronized register propagation,
* and FSM-controlled execution coordination.

This became one of the earliest important architectural transitions within the project:

> sequential datapath behavior must be reasoned about across time, not only through isolated signal values.

Another major challenge involved stabilizing FSM-controlled operational sequencing.

The architecture depended heavily on:

* IDLE → KEY_OPR → SEND progression,
* synchronized transformation execution,
* iterative state updates,
* and deterministic output-delivery coordination.

As the transformation engine became more complex, maintaining consistency between:

* FSM transitions,
* datapath progression,
* internal register evolution,
* and transformation completion timing

became increasingly difficult during simulation and debugging.

This forced the architecture toward:

* clearer staged execution behavior,
* more structured operational sequencing,
* and stronger separation between:
  * control logic,
  * datapath transformation,
  * and output synchronization responsibilities.

The project additionally became an important debugging exercise in:

* waveform-oriented architectural analysis,
* transformation-stage tracing,
* sequential timing interpretation,
* and synthesis-aware RTL reasoning.

Unlike smaller combinational designs where behavior can often be understood immediately from direct signal interaction, the ChaCha20 architecture required reasoning about:

* iterative transformation flow,
* staged state evolution,
* multi-cycle operational progression,
* and synchronized register-driven execution behavior.

A major implementation realization emerged during FPGA synthesis and implementation analysis.

Initially, the architecture exposed large portions of the internal cryptographic state directly through external interfaces to simplify:

* waveform visibility,
* debugging observability,
* and transformation analysis.

However, synthesis reports later revealed that:

* external datapath exposure dramatically increased bonded I/O utilization,
* routing complexity escalated rapidly,
* and integration scalability deteriorated significantly.

This became another major engineering milestone:

> explicit architectural observability can become a hardware scalability liability.

The implementation process additionally exposed practical hardware tradeoffs involving:

* latency versus transformation visibility,
* sequential execution versus combinational complexity,
* and implementation simplicity versus throughput optimization.

Rather than pursuing:

* deeply pipelined execution,
* aggressive parallelism,
* or high-frequency optimization,

the architecture intentionally adopted:

* iterative sequential progression,
* staged transformation execution,
* and waveform-visible operational flow.

Although this increased operational latency, it substantially improved:

* debugging visibility,
* synthesis stability,
* transformation observability,
* and architectural understandability.

The project also became one of the earliest practical exposures to:

* FPGA timing-analysis interpretation,
* synthesis-report analysis,
* implementation-driven architectural visibility,
* and hardware activity observation.

The synthesis and implementation workflows introduced practical understanding of:

* timing closure behavior,
* sequential propagation timing,
* switching activity,
* power visibility,
* and datapath-driven implementation cost.

Although the project did not implement:

* transaction-level verification infrastructure,
* assertion-based validation,
* randomized stress testing,
* or accelerator-grade performance optimization,

it established foundational understanding in:

* iterative cryptographic datapath design,
* FSM-controlled execution architecture,
* synthesis-aware RTL development,
* staged hardware transformation methodology,
* and FPGA-oriented implementation reasoning.

From a long-term engineering perspective, the ChaCha20 project became one of the earliest repositories where the architectural learning process became more important than the final encryption output itself.

The project ultimately marked the transition from:

> writing RTL that performs cryptographic functionality

toward:

> engineering hardware architectures that must remain synthesizable, observable, scalable, and structurally manageable under real implementation constraints.

---

# 7. Tools Used

## EDA & RTL Development Tools

The project was developed primarily as an FPGA-oriented cryptographic RTL architecture exploration focused on:

* iterative datapath sequencing,
* FSM-controlled execution flow,
* synthesis-aware RTL realization,
* and staged ChaCha20 transformation behavior.

The architecture, transformation engine, and implementation workflows were developed using industry-standard RTL design and FPGA synthesis tooling focused on:

* cryptographic datapath development,
* waveform-driven debugging,
* timing-analysis visibility,
* and implementation-oriented hardware exploration.

### RTL Design & Development

* Verilog
* SystemVerilog
* Tcl

### FPGA Synthesis & Implementation

* Xilinx Vivado 2025.1
* Vivado Synthesis Flow
* Vivado Implementation Flow
* Vivado Timing Analysis Infrastructure

### Simulation & Verification Tools

* Vivado Simulator
* Waveform Viewer
* Timing Reports
* Utilization Reports
* Power Analysis Reports

### Verification & Debugging Workflow

* Directed transformation validation
* Waveform-oriented sequential debugging
* FSM-state progression analysis
* Iterative datapath observation
* Sequential state-evolution tracing

### Documentation & Standards

* RFC7539 - ChaCha20 and Poly1305 for IETF Protocols

### Automation & Workflow Utilities

* Python helper scripts
* Batch execution utilities

### Version Control & Repository Management

* Git
* GitHub



# Repository

GitHub Repository:

```text
https://github.com/yusuf-silicon/Chacha20-Hardware-Encryption
```

# Notes

The project primarily focused on:

* cryptographic RTL architecture development,
* iterative transformation sequencing,
* synthesis-aware FPGA implementation,
* and staged datapath-oriented hardware reasoning.

The repository therefore emphasizes:

* architectural clarity,
* waveform-visible execution flow,
* synthesis-oriented hardware realization,
* and sequential transformation observability

rather than:

* production-grade cryptographic acceleration,
* deep throughput optimization,
* physically deployed FPGA systems,
* or industrial accelerator-class implementation infrastructure.

---

# 8. Publication / Research Association

> No publications was done with regards to this project

---

# 9. Author

## Yusuf Ahmad

B.Tech Electronics & Communication Engineering  
Amity University Lucknow

Focused on:

* RTL Design
* Cryptographic Hardware Architectures
* FPGA-Oriented RTL Development
* Verification & Waveform Analysis
* SoC & Accelerator-Oriented Architecture Development

---

### Roles & Contributions

#### RTL Design

* ChaCha20 encryption core architecture development
* Iterative quarter-round transformation implementation
* FSM-controlled execution sequencing
* Register-driven datapath organization
* Internal state-management infrastructure

#### Verification

* Directed transformation validation
* Waveform-oriented sequential debugging
* FSM-state progression analysis
* Iterative datapath observation
* Transformation-stage verification

#### FPGA Synthesis & Implementation

* Vivado synthesis & implementation analysis
* Timing-report interpretation
* Resource-utilization analysis
* Power-analysis exploration
* FPGA-oriented hardware realization

#### Documentation & Engineering Analysis

* Architectural documentation
* Cryptographic datapath analysis
* Synthesis-aware implementation analysis
* Engineering revision tracking
* Historical project evolution preservation

---

### Engineering Focus Areas

* Cryptographic RTL Architectures
* Iterative Datapath Design
* FSM-Controlled Hardware Systems
* FPGA-Oriented Hardware Realization
* Sequential Transformation Architectures
* Accelerator-Oriented RTL Development

---

### Professional Links

LinkedIn:  
[https://www.linkedin.com/in/yusuf-silicon/]

GitHub Repository:  
[https://github.com/yusuf-silicon/Chacha20-Hardware-Encryption]

GitHub Profile:  
[https://github.com/yusuf-silicon]

---
