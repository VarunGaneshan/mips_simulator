#include <stdio.h>
#include <stdlib.h>
#include "shell.h"
#include "mips_opcodes.h"

int pc_set_by_instruction = 0; 

void execute_r_type(uint32_t rs, uint32_t rt, uint32_t rd, uint32_t shamt, uint32_t funct);
void execute_regimm(uint32_t rt, uint32_t rs, int16_t imm);
void execute_j_type(uint32_t opcode, uint32_t target);
void execute_i_type(uint32_t opcode, uint32_t rs, uint32_t rt, int16_t imm);

void process_instruction()
{
    uint32_t instruction = mem_read_32(CURRENT_STATE.PC);
    printf("PC: 0x%08x, Instruction: 0x%08x\n", CURRENT_STATE.PC, instruction);

    uint32_t opcode = (instruction >> 26) & 0x3F;
    uint32_t rs = (instruction >> 21) & 0x1F;
    uint32_t rt = (instruction >> 16) & 0x1F;
    uint32_t rd = (instruction >> 11) & 0x1F;
    uint32_t shamt = (instruction >> 6) & 0x1F;
    uint32_t funct = instruction & 0x3F;
    int16_t imm = instruction & 0xFFFF;
    uint32_t target = instruction & 0x03FFFFFF;

    switch (opcode) {
        case R_TYPE:
            execute_r_type(rs, rt, rd, shamt, funct);
	    if (!pc_set_by_instruction) {
            	NEXT_STATE.PC = CURRENT_STATE.PC + 4;
	    }
	    pc_set_by_instruction = 0;
            break;

        case REGIMM:
            execute_regimm(rt, rs, imm);
	    if (!pc_set_by_instruction) {
            	NEXT_STATE.PC = CURRENT_STATE.PC + 4;
	    }
            pc_set_by_instruction = 0;
            break;

        case J:
        case JAL:
            execute_j_type(opcode, target);
            break;

        default:
            execute_i_type(opcode, rs, rt, imm);
	    if (!pc_set_by_instruction) {
            	NEXT_STATE.PC = CURRENT_STATE.PC + 4;
	    }
	    pc_set_by_instruction = 0;
            break;
    }
}

void execute_r_type(uint32_t rs, uint32_t rt, uint32_t rd, uint32_t shamt, uint32_t funct)
{
    switch (funct) {
	//Arithmetic
	case ADD:
    	    NEXT_STATE.REGS[rd] = (int32_t)CURRENT_STATE.REGS[rs] + (int32_t)CURRENT_STATE.REGS[rt];
    	    break;

	case ADDU:
    	    NEXT_STATE.REGS[rd] = (int32_t)CURRENT_STATE.REGS[rs] + (int32_t)CURRENT_STATE.REGS[rt];
    	    break;

	case SUB:
    	    NEXT_STATE.REGS[rd] = (int32_t)CURRENT_STATE.REGS[rs] - (int32_t)CURRENT_STATE.REGS[rt];
    	    break;

	case SUBU:
    	    NEXT_STATE.REGS[rd] = (int32_t)CURRENT_STATE.REGS[rs] - (int32_t)CURRENT_STATE.REGS[rt];
    	    break;
	//Logical
	case AND:
    	    NEXT_STATE.REGS[rd] = CURRENT_STATE.REGS[rs] & CURRENT_STATE.REGS[rt];
    	    break;

	case OR:
    	    NEXT_STATE.REGS[rd] = CURRENT_STATE.REGS[rs] | CURRENT_STATE.REGS[rt];
    	    break;

	case XOR:
    	    NEXT_STATE.REGS[rd] = CURRENT_STATE.REGS[rs] ^ CURRENT_STATE.REGS[rt];
    	    break;

	case NOR:
    	    NEXT_STATE.REGS[rd] = ~(CURRENT_STATE.REGS[rs] | CURRENT_STATE.REGS[rt]);
   	    break;
	//Set
        case SLT:
            NEXT_STATE.REGS[rd] = ((int32_t)CURRENT_STATE.REGS[rs] < (int32_t)CURRENT_STATE.REGS[rt]) ? 1 : 0;
            break;

        case SLTU:
            NEXT_STATE.REGS[rd] = (CURRENT_STATE.REGS[rs] < CURRENT_STATE.REGS[rt]) ? 1 : 0;
            break;
	//Shift
	case SLL:
    	    NEXT_STATE.REGS[rd] = CURRENT_STATE.REGS[rt] << shamt;
    	    break;

	case SRL:
    	    NEXT_STATE.REGS[rd] = CURRENT_STATE.REGS[rt] >> shamt;
    	    break;

	case SRA:
    	    NEXT_STATE.REGS[rd] = ((int32_t)CURRENT_STATE.REGS[rt]) >> shamt;
    	    break;

	case SLLV:
    	    NEXT_STATE.REGS[rd] = CURRENT_STATE.REGS[rt] << (CURRENT_STATE.REGS[rs] & 0x1F);//5bits
    	    break;

	case SRLV:
    	    NEXT_STATE.REGS[rd] = CURRENT_STATE.REGS[rt] >> (CURRENT_STATE.REGS[rs] & 0x1F);
    	    break;

	case SRAV:
    	    NEXT_STATE.REGS[rd] = ((int32_t)CURRENT_STATE.REGS[rt]) >> (CURRENT_STATE.REGS[rs] & 0x1F);
    	    break;
	//Jump
	case JR:
    	    NEXT_STATE.PC = CURRENT_STATE.REGS[rs];
	    pc_set_by_instruction = 1;
    	    break;

	case JALR:
	    if (rd == 0) {
            	rd = 31;  
    	    }
    	    NEXT_STATE.REGS[rd] = CURRENT_STATE.PC + 4;
            NEXT_STATE.PC = CURRENT_STATE.REGS[rs];       
            pc_set_by_instruction = 1;                    
            break;
	//Mult,Div
	case MULT: 
	{
    		int64_t result = (int64_t)(int32_t)CURRENT_STATE.REGS[rs] * (int64_t) (int32_t)CURRENT_STATE.REGS[rt];
    		NEXT_STATE.HI = (uint32_t)(result >> 32);
    		NEXT_STATE.LO = (uint32_t)result;
    		break;
	}

	case MULTU: 
	{
    		uint64_t result = (uint64_t)CURRENT_STATE.REGS[rs] * (uint64_t) CURRENT_STATE.REGS[rt];
    		NEXT_STATE.HI = (uint32_t)(result >> 32);
    		NEXT_STATE.LO = (uint32_t)result;
    		break;
	}
	
	case DIV: 
	{
    		int32_t s = (int32_t)CURRENT_STATE.REGS[rs];
    		int32_t t = (int32_t)CURRENT_STATE.REGS[rt];
		if (t == 0) {
       			printf("Division by zero,skipped\n"); 		
		} else {
        		NEXT_STATE.LO = (uint32_t)(s / t);
        		NEXT_STATE.HI = (uint32_t)(s % t);
    		}
    		break;
	}

	case DIVU: 
        	NEXT_STATE.LO = CURRENT_STATE.REGS[rs] / CURRENT_STATE.REGS[rt];
        	NEXT_STATE.HI = CURRENT_STATE.REGS[rs] % CURRENT_STATE.REGS[rt];
    		break;
	//Move
	case MFHI:
    		NEXT_STATE.REGS[rd] = CURRENT_STATE.HI;
    		break;
	
	case MFLO:
    		NEXT_STATE.REGS[rd] = CURRENT_STATE.LO;
    		break;

	case MTHI:
    		NEXT_STATE.HI = CURRENT_STATE.REGS[rs];
    		break;

	case MTLO:
    		NEXT_STATE.LO = CURRENT_STATE.REGS[rs];
    		break;
	//SYSCALL
        case SYSCALL:
            if (CURRENT_STATE.REGS[2] == 10) {
                printf("SYSCALL exit requested.\n");
                RUN_BIT = FALSE;
            }
	    else{
		printf("v0 != 10\n");
	    }
            break;

        default:
            printf("Unknown R-type function: 0x%02x\n", funct);
            exit(1);
    }
}


void execute_regimm(uint32_t rt, uint32_t rs, int16_t imm)
{
    int32_t offset = (int32_t)imm << 2; 

    switch (rt) {
        case BLTZ:
            if ((int32_t)CURRENT_STATE.REGS[rs] < 0) {
                NEXT_STATE.PC = CURRENT_STATE.PC + offset;
	        pc_set_by_instruction = 1;
            }
            break;

        case BGEZ:
            if ((int32_t)CURRENT_STATE.REGS[rs] >= 0) {
                NEXT_STATE.PC = CURRENT_STATE.PC + offset;
		pc_set_by_instruction = 1;
            }
            break;

        case BLTZAL:
	    NEXT_STATE.REGS[31] = CURRENT_STATE.PC + 4;
            if ((int32_t)CURRENT_STATE.REGS[rs] < 0) {
                NEXT_STATE.PC = CURRENT_STATE.PC + offset;
		pc_set_by_instruction = 1;
            }
            break;

        case BGEZAL:
	    NEXT_STATE.REGS[31] = CURRENT_STATE.PC + 4;
            if ((int32_t)CURRENT_STATE.REGS[rs] >= 0) {
                NEXT_STATE.PC = CURRENT_STATE.PC + offset;
		pc_set_by_instruction = 1;
            }
            break;

        default:
            printf("Unknown REGIMM rt value: 0x%02x\n", rt);
            exit(1);
    }
}


void execute_j_type(uint32_t opcode, uint32_t target)
{
    uint32_t jump_addr = (CURRENT_STATE.PC & 0xF0000000) | (target << 2);//absolute address

    switch (opcode) {
        case J:
            NEXT_STATE.PC = jump_addr;
            break;

        case JAL:
            NEXT_STATE.REGS[31] = CURRENT_STATE.PC + 4; //$ra 
            NEXT_STATE.PC = jump_addr;
            break;
	
        default:
            printf("Unknown J-type opcode: 0x%02x\n", opcode);
            exit(1);
    }
}


void execute_i_type(uint32_t opcode, uint32_t rs, uint32_t rt, int16_t imm)
{
    switch (opcode) {
	//Arithmetic
        case ADDI:
	    if(rt != 0) { //avoid modifying $zero
            	NEXT_STATE.REGS[rt] = (int32_t)CURRENT_STATE.REGS[rs] + (int32_t)imm;
            }
	    break;

        case ADDIU:
	    if(rt != 0) {
            	NEXT_STATE.REGS[rt] = (int32_t)CURRENT_STATE.REGS[rs] + (int32_t)imm;
            }
	    break;
	//Set
        case SLTI:
            NEXT_STATE.REGS[rt] = ((int32_t)CURRENT_STATE.REGS[rs] < (int32_t)imm) ? 1 : 0;
            break;

	case SLTIU:
            NEXT_STATE.REGS[rt] = (CURRENT_STATE.REGS[rs] < (uint32_t)imm) ? 1 : 0;
    	    break;
	//Logical
	case ANDI:
	    NEXT_STATE.REGS[rt] = CURRENT_STATE.REGS[rs] & (uint32_t)(imm & 0xFFFF); //zero-extend
    	    break;

	case ORI:
            NEXT_STATE.REGS[rt] = CURRENT_STATE.REGS[rs] | (uint32_t)(imm & 0xFFFF);
    	    break;

	case XORI:
    	    NEXT_STATE.REGS[rt] = CURRENT_STATE.REGS[rs] ^ (uint32_t)(imm & 0xFFFF);
    	    break;
	//Branch
	case BEQ:
    	    if (CURRENT_STATE.REGS[rs] == CURRENT_STATE.REGS[rt]) {
            	int32_t branch_offset = (int32_t)(imm) << 2;  
        	NEXT_STATE.PC = CURRENT_STATE.PC + branch_offset;
        	pc_set_by_instruction = 1;  
    	    }
    	    break;

	case BNE:
    	    if (CURRENT_STATE.REGS[rs] != CURRENT_STATE.REGS[rt]) {
            	int32_t branch_offset = (int32_t)(imm) << 2;  
        	NEXT_STATE.PC = CURRENT_STATE.PC + branch_offset;
        	pc_set_by_instruction = 1;  
    	    }
    	    break;

	case BGTZ:
    	    if ((int32_t)CURRENT_STATE.REGS[rs] > 0) {
            	int32_t branch_offset = (int32_t)(imm) << 2;  
        	NEXT_STATE.PC = CURRENT_STATE.PC + branch_offset;
        	pc_set_by_instruction = 1;  
    	    }
    	    break;

	case BLEZ:
    	    if ((int32_t)CURRENT_STATE.REGS[rs] <= 0) {
            	int32_t branch_offset = (int32_t)(imm) << 2;  
        	NEXT_STATE.PC = CURRENT_STATE.PC + branch_offset;
        	pc_set_by_instruction = 1;  
    	    }
    	    break;
	//Load
	case LUI:
            NEXT_STATE.REGS[rt] = (uint32_t)imm << 16;
    	    break;

	case LW:
	    {
    	    	uint32_t address = (int32_t)CURRENT_STATE.REGS[rs] + (int32_t)imm;
    	    	NEXT_STATE.REGS[rt] = mem_read_32(address);
	    	break;
	    }

	case SW:
	    {
    	    	uint32_t address = (int32_t)CURRENT_STATE.REGS[rs] + (int32_t)imm;
    	    	mem_write_32(address, CURRENT_STATE.REGS[rt]);
	    	break;
	    }

	case LH:
	    {
    		uint32_t address = (int32_t)CURRENT_STATE.REGS[rs] + (int32_t)imm;
    		uint32_t word = mem_read_32(address & ~0x3); //word align  
    		uint16_t halfword;
    		if (address & 0x2) { 
        		halfword = (word >> 16) & 0xFFFF; //uppers address[1]=1:2,3,6,7,10,11
    		} else {
        		halfword = word & 0xFFFF;         
    		}
    		NEXT_STATE.REGS[rt] = (int32_t)(int16_t)halfword; 
    		break;
	    }

	case LHU:
	    {
    		uint32_t address = (int32_t)CURRENT_STATE.REGS[rs] + (int32_t)imm;
    		uint32_t word = mem_read_32(address & ~0x3);  
    		uint16_t halfword;
    		if (address & 0x2) { 
        		halfword = (word >> 16) & 0xFFFF; 
    		} else {
        		halfword = word & 0xFFFF;         
    		}
    		NEXT_STATE.REGS[rt] = (uint32_t)halfword; 
    		break;
	    }

	case LB:
	    {
    		uint32_t address = (int32_t)CURRENT_STATE.REGS[rs] + (int32_t)imm;
    		uint32_t word = mem_read_32(address & ~0x3);  
    		uint8_t byte;
    		switch (address & 0x3) {
        		case 0: byte = word & 0xFF; break;          // Byte[0]
        		case 1: byte = (word >> 8) & 0xFF; break;    // Byte[1]
        		case 2: byte = (word >> 16) & 0xFF; break;   // Byte[2]
        		case 3: byte = (word >> 24) & 0xFF; break;   // Byte[3]
    		}	
    		NEXT_STATE.REGS[rt] = (int32_t)(int8_t)byte; 
    		break;
	    }

	case LBU:
	    {
    		uint32_t address = (int32_t)CURRENT_STATE.REGS[rs] + (int32_t)imm;
    		uint32_t word = mem_read_32(address & ~0x3);  
    		uint8_t byte;
    		switch (address & 0x3) {
        		case 0: byte = word & 0xFF; break;          
        		case 1: byte = (word >> 8) & 0xFF; break;    
        		case 2: byte = (word >> 16) & 0xFF; break;   
        		case 3: byte = (word >> 24) & 0xFF; break;   
    		}	
    		NEXT_STATE.REGS[rt] = (uint32_t)byte; 
    		break;
	    }

	case SH: 
	    {
    		uint32_t address = (int32_t)CURRENT_STATE.REGS[rs] + (int32_t)imm;
		uint32_t aligned_address = address & ~0x3;
    		uint32_t word = mem_read_32(aligned_address); 
    		uint16_t data = CURRENT_STATE.REGS[rt] & 0xFFFF;
		if (address & 0x2) {
        		word = (word & 0x0000FFFF) | (data << 16); 
    		} else {
        		word = (word & 0xFFFF0000) | data;         
    		}
		mem_write_32(aligned_address, word);
    		break;
	    }

	case SB: 
	    {
    		uint32_t address = (int32_t)CURRENT_STATE.REGS[rs] + (int32_t)imm;
		uint32_t aligned_address = address & ~0x3;
    		uint32_t word = mem_read_32(aligned_address);
    		uint8_t data = CURRENT_STATE.REGS[rt] & 0xFF;
    		switch (address & 0x3) {
        		case 0:
            			word = (word & 0xFFFFFF00) | data;
            			break;
			case 1:
            			word = (word & 0xFFFF00FF) | (data << 8);
            			break;
       			case 2:
           			word = (word & 0xFF00FFFF) | (data << 16);
            			break;
       			case 3:
            			word = (word & 0x00FFFFFF) | (data << 24);
            			break;
    	    	}
	   	mem_write_32(aligned_address, word);
    		break;
	    }

        default:
            printf("Unknown I-type opcode: 0x%02x\n", opcode);
            exit(1);
    }
}


/*Improvements-Hardcoded constants,Branch instruction as function,word & 0xFFFF;Store and load*/
