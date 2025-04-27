#ifndef MIPS_OPCODES_H
#define MIPS_OPCODES_H

// J-Type
#define J        0x02
#define JAL      0x03

// I-Type
#define BEQ      0x04
#define BNE      0x05
#define BLEZ     0x06
#define BGTZ     0x07
#define ADDI     0x08
#define ADDIU    0x09
#define SLTI     0x0A
#define SLTIU    0x0B
#define ANDI     0x0C
#define ORI      0x0D
#define XORI     0x0E
#define LUI      0x0F
#define LB       0x20
#define LH       0x21
#define LW       0x23
#define LBU      0x24
#define LHU      0x25
#define SB       0x28
#define SH       0x29
#define SW       0x2B

#define REGIMM   0x01 
// REGIMM (rt field)
#define BLTZ     0x00
#define BGEZ     0x01
#define BLTZAL   0x10
#define BGEZAL   0x11

#define R_TYPE   0x00  
// R-type (funct field)
#define ADD      0x20
#define ADDU     0x21
#define SUB      0x22
#define SUBU     0x23
#define AND      0x24
#define OR       0x25
#define XOR      0x26
#define NOR      0x27
#define SLT      0x2A
#define SLTU     0x2B
#define SLL      0x00
#define SRL      0x02
#define SRA      0x03
#define SLLV     0x04
#define SRLV     0x06
#define SRAV     0x07
#define JR       0x08
#define JALR     0x09
#define SYSCALL  0x0C
#define MFHI     0x10
#define MTHI     0x11
#define MFLO     0x12
#define MTLO     0x13
#define MULT     0x18
#define MULTU    0x19
#define DIV      0x1A
#define DIVU     0x1B


#endif

