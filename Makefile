COMPILER = g++
FLAGS = -std=c++14 -Wall -Werror -Wvla -Wextra -pedantic -O3 

test: VariantTypeImpl VariantType unit_test main
	$(COMPILER) $(FLAGS) VariantTypeImpl.o VariantType.o test.o unit_test.o -o test_exec
	@./test_exec

VariantTypeImpl: VariantTypeImpl.cpp
	$(COMPILER) $(FLAGS) -c VariantTypeImpl.cpp

VariantType: VariantType.cpp
	$(COMPILER) $(FLAGS) -c VariantType.cpp

unit_test: unit_test.cpp
	$(COMPILER) $(FLAGS) -c unit_test.cpp

main: test.cpp
	$(COMPILER) $(FLAGS) -c test.cpp

debug: FLAGS += -g3 -DDEBUG
debug: test

clean: 
	rm -f *.o
	rm -f test_exec
