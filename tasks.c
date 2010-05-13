#include "tasks.h"
#include "tss.h"
#include "screen_print.c"

tasks _tasks_list[TSS_COUNT] = {
	(tasks) {
		start_eip =  (void *) &print_screen;
	},
};
