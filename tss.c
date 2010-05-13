#include "tss.h"


tss  tsss[TSS_COUNT] = {
	(tss ) { // Inicializada toda en 0
		(unsigned short) 0,
		(unsigned short) 0,
		(unsigned int) 0,
		(unsigned short) 0,
		(unsigned short) 0,
		(unsigned int) 0,
		(unsigned short) 0,
		(unsigned short)  0,
		(unsigned int) 0,
		(unsigned short) 0,
		(unsigned short) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned int) 0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0,
		(unsigned short)  0
	},
	
	(tss)  { // Inicializada toda en 0
		ptl = (unsigned short) 0;
		unused0 = (unsigned short) 0;
		/* TODO: poner un stack real. */
		esp0 = (unsigned int) 0;
		ss0 = (unsigned short) 0;
		unused1 = (unsigned short) 0;
		esp1 = (unsigned int) 0;
		ss1 = (unsigned short) 0;
		unused2 = (unsigned short) 0;
		esp2 = (unsigned int) 0;
		ss2 = (unsigned short) 0;
		unused3 = (unsigned short) 0;
		cr3 = PD;
		/* TODO: agregar una lista task_eip cuyo indice corresponda a la posici'on
		 * de memoria donde apunta la función de la tarea.*/
		eip = (void *) _tasks_list[0].start_eip;
		/* FIXME: MAGIC_NUMBER */
		eflags = (unsigned int)  0x202;
		eax = (unsigned int) 0;
		ecx = (unsigned int) 0;
		edx = (unsigned int) 0;
		ebx = (unsigned int) 0;
		esp = (unsigned int) 0;
		ebp = (unsigned int) 0;
		esi = (unsigned int) 0;
		edi = (unsigned int) 0;
		es = (unsigned short) 0x8;
		unused4 = (unsigned short) 0;
		cs = (unsigned short) 0x10;
		unused5 = (unsigned short) 0;
		ss = (unsigned short) 0x8;
		unused6;
		ds = (unsigned short) 0x8;
		unused7;
		fs = (unsigned short) 0x8;
		unused8;
		gs = (unsigned short) 0x8;
		unused9 = (unsigned short) 0;
		ldt = (unsigned short) 0;
		unused10 = (unsigned short) 0;
		dtrap = (unsigned short) 0;
		iomap = (unsigned short) 0;
	},
	
};
