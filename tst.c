/* Global Uninitialized Data Stored in => .bss[RAM] section */ 
unsigned int gVarOne; 

/* Global Initialized Data Stored in => .data section in [RAM] and [FLASH] sections */ 
unsigned int gVarTwo = 3; 

/* Static Global Initialized Data Stored in => .data section in [RAM] and [FLASH] */ 
static int gVarThree = 3; 

/* Static Global Uninitialized Data Stored in => .bss[RAM] section */ 
static unsigned int gVarFour; 

/* Static Global Initialized by 0 Data Stored in => .bss[RAM] section */ 
static int gVarFive = 0; 

/* Global Initialized by 0 Data Stored in => .bss[RAM] section */ 
unsigned int gVarSix = 0; 

/* Global Constant Data Stored in => .rodata[Flash] section */ 
const unsigned int gVarSeven = 5; 


int main() 
{ 
	/* Local Uninitialized Data Stored in => stack[RAM] */ 
	signed int lVarOne; 
	
	/* Local Initialized Data Stored in => stack[RAM] */ 
	signed int lVarTwo = 3; 
	
	/* Local Static Initialized Data => .data section in [RAM] and [FLASH] sections */ 
	static signed int lVarThree = 3; 
	
	/* Local Static Uninitialized Data Stored in => .bss[RAM] section */ 
	static signed int lVarFour; 

	return 0;
} 
