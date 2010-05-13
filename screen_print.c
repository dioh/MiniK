#define VIDEO_MEM 0xB8000
#define SCREEN_SIZE (25 * 80) << 1
#define MSG "EaPEPE"



int print_screen()
{
	unsigned int *mem_buffer = (unsigned int*) VIDEO_MEM;

	int color  = 0x1000; //color azul

	int i = 0;
	for(i = 0; i < SCREEN_SIZE; i++)
		mem_buffer[i] = color;
	return 0;
}
