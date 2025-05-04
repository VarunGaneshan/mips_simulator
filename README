# MIPS Instruction-Level Simulator

This project is a C-based instruction-level simulator for a subset of the MIPS architecture. It mimics the execution of MIPS assembly code by implementing instruction parsing, memory access, and register updates.

---

## 📁 Project Structure

```plaintext
├── src
│   ├── shell.c          # Main simulator logic
│   ├── shell.h          # Global variables and state
│   ├── mips_opcodes.h   # Opcode and funct macro definitions
├── inputs
│   ├── *.s              # MIPS assembly test programs
```

---

## 🚀 Features

- Supports **R-type, I-type, and J-type** instructions.
- Handles arithmetic, logical, shift, memory, and branch operations.
- Implements special registers: **HI, LO, and $ra (return address)**.
- Supports `syscall` for halting simulation.
- Simulates a **little-endian memory** model.
- This project does not handle Branch delay slots and exceptions.

---

## 🧠 Supported Instructions

- **Arithmetic**: `add`, `addu`, `sub`, `subu`, `mult`, `multu`, `div`, `divu`
- **Logical**: `and`, `or`, `xor`, `nor`
- **Shift**: `sll`, `srl`, `sra`, `sllv`, `srlv`, `srav`
- **Set-on-compare**: `slt`, `sltu`, `slti`, `sltiu`
- **Load/Store**: `lw`, `sw`, `lh`, `lhu`, `lb`, `lbu`, `sh`, `sb`, `lui`
- **Branch/Jump**: `beq`, `bne`, `bgtz`, `blez`, `jr`, `jal`, `jalr`, `j`, `bltz`, `bgez`, `bltzal`, `bgezal`
- **Syscall**

---

## 🛠️ Compilation and Run

```bash
0. Modify the path of spim in asm2hex file. (spim will be under path/spisimulator/spim/)

1. For converting .s to .x
./asm2hex name.s

2. For compiling sim.c (Refer Makefile)
make clean
make

3. To run the hex file in simulator
./src/sim inputs/name.x
```

```text
>> MIPS Simulator
>> 
>> Read x words from program into memory.
>> 
>> MIPS-SIM> go
>> 
>> Simulating...
```
Use `go`, `run 1`, `rdump` commands to verify your outputs.
