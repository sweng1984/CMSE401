all: process 

main_process.o: main_process.c
	gcc -c main_process.c

serial_process.o: serial_process.c
	gcc -c serial_process.c

parallel_process.o: parallel_process.c
	gcc -c parallel_process.c 

png_util.o: png_util.c
	gcc -l lpng16 -c png_util.c

process: main_process.o png_util.o
	gcc -o process -lm -l png16 main_process.o png_util.o

serial_process: serial_process.o png_util.o
	gcc -o process -lm -l png16 -Ofast serial_process.o png_util.o

parallel_process: parallel_process.o png_util.o
	gcc -o process -lm -l png16 -fOpenmp parallel_process.o png_util.o


test: process 
	./process ./cube.png test.png
	./serial_process ./cube.png test.png
	./parallel_process ./cube.png test/png

clean:
	rm *.o
	rm process 

