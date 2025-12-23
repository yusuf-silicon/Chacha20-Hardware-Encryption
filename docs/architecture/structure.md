**STRUCTURE**
========================================================================================
**Top Wrapper** (`chacha20_fpga_top.sv`) -

Role : Glue logic between the physical FPGA board and your ChaCha20 engine.

Purpose: Connect board pins (clocks, resets, buttons, LEDs, UART/AXI signals, etc.) to your internal design.
* Logic content:
  * Clock buffers (e.g., `IBUF`, `BUFG`) if needed.
  * Reset synchronizer (to clean mechanical reset switches).
  * Simple signal routing.
* Hierarchy: Instantiates one main submodule (`chacha20_core` or `chacha20_system`) and nothing else.

Think of this as the adapter layer. It has no ChaCha20 logic only board specific I/O.

**Core** (`chacha20_core.sv`) -
----------------------------------------------------------------------------------------

Role: The heart of the cipher.

* Contains the state machine to orchestrate ChaCha20:

  * Load constants, key, counter, nonce.
  * Run 20 rounds (10 double-rounds).
  * Output 512-bit keystream blocks.
* Instantiates the algorithmic submodules below.
* Interfaces with:

  * Key/Nonce/Counter Manager to get key material.
  * State Matrix to store intermediate results.
  * Quarter Round Units for the math.

All the crypto happens here.

**Key/Nonce/Counter Manager** (`key_manager.sv`) -
----------------------------------------------------------------------------------------

Role: Owns the input material for each encryption block.

 * Key storage: Holds the 256-bit key loaded at configuration time (from BRAM, file, or hard-coded ROM).
 * Counter logic: 32-bit counter that increments every 512-bit block.
 * Nonce input: Accepts the 96-bit nonce for each session/message.
 * Output: Supplies these to the core at the start of each block.

This module guarantees that the correct “seed” (constant + key + counter + nonce) is always ready.

**State Matrix** (`state_matrix.sv`) -
----------------------------------------------------------------------------------------

Role: Stores the 4×4 grid of 32-bit words (512 bits total).

* Initial state: constant, key, counter, nonce → 16 words.
* Update: After each quarter-round, holds the intermediate 16 words.
* Provides easy read/write for the quarter-round operations.

Think of it as a register file specialized for ChaCha20.

**Quarter Round Unit** (`quarter_round.sv`) -
----------------------------------------------------------------------------------------

Role: Implements the fundamental math step of ChaCha20.

* Performs the sequence of Add–XOR–Rotate on four 32-bit words.
* Reused repeatedly across columns/diagonals and rounds.
* Can be:

  * Single-cycle (combinational) → simple but slower clock.
  * Pipelined (sequential) → higher clock speed for FPGA.

The smallest algorithmic building block.

**Optional I/O Interface** (`chacha20_if.sv`) -
----------------------------------------------------------------------------------------
 
Role: Runtime configurability (only if needed).

* AXI-Lite or simple memory-mapped interface.
* Lets a processor or host PC:

  * Load a new key or nonce without rebuilding the FPGA.
  * Read back status or keystream.

Skip this if you’re hardcoding keys and focusing on algorithm proof-of-concept.


**Hierarchy Overview**
========================================================================================
  ```
  FPGA Pins
    │
    └─ chacha20_fpga_top  <-- Only board I/O glue
          │
          └─ chacha20_core  <-- Main crypto FSM
              ├─ key_manager
              ├─ state_matrix
              ├─ quarter_round (×N instances or reused)
              └─ (optional) chacha20_if
  ```

----------------------------------------------------------------------------------------
Top wrapper: board-specific, re-usable across projects.  
Core + submodules: board-agnostic; can be simulated or reused in ASIC flow.  
Submodules: Each has a *single, clear responsibility*, making unit testing easier.  

This separation keeps your code:

* Maintainable (easy to debug).
* Reusable (core can drop into another FPGA/ASIC).
* Synthesizable (each module synthesizes cleanly).
