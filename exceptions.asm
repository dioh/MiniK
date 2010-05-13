divide_error:
	 jmp $ 

who_the_fuck_knows:
	 jmp $ 

nmi_interrupt:
	 jmp $ 

breakpoint:
	 jmp $ 

overflow:
	 jmp $ 

bound_range_exceed:
	 jmp $ 

invalid_op_code:
	 jmp $ 

device_not_available:
	 jmp $ 

double_fault:
	 jmp $ 

invalid_tss:
	 jmp $ 

segment_not_present:
	 jmp $ 

stack_segment_fault:
	 jmp $ 

general_protection:
	 jmp $ 

page_fault:
	 jmp $ 

yet_another_wtfk:
	 jmp $ 

fpu_error:
	 jmp $ 

alignment_check:
	 jmp $ 

machine_check:
	 jmp $ 

simd_fp_exception:
	 jmp $ 

yet_yet_another_wtfk:
	 jmp $ 
	 
e0_to_21_exceptions:
	jmp $

timer_tick:
	call  print_tsd:0x0

keyboard_interrupt:
	iret