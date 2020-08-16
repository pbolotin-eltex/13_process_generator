# Make

.PHONY = clean debug
KEYS :=
TMP  :=
TMPL :=
LIBS_G :=
LIBS :=
CC := gcc

process_generator : process_generator.o
		$(CC) $(TMP) $(KEYS) process_generator.o\
							 -o process_generator $(TMPL) $(LIBS)

process_generator.o : process_generator.c
		$(CC) $(TMP) $(KEYS) -c process_generator.c\
							 -o process_generator.o $(TMPL) $(LIBS_G)


debug : process_generator_g.o
		$(eval KEYS:=-g)
		$(CC) $(TMP) $(KEYS) process_generator_g.o\
							 -o process_generator_g $(TMPL) $(LIBS_G)

process_generator_g.o : process_generator.c
		$(eval KEYS:=-g)
		$(CC) $(TMP) $(KEYS) -c process_generator.c\
							 -o process_generator_g.o $(TMPL) $(LIBS_G)

clean :
		rm -f *.o *.gch process_generator process_generator_g a.out
