ASM=nasm
ASMFLAGS=-f elf64
LD=ld

# Файл это набор правил
# формат каждого правила: 
# имя_файла_для_сборки: зависимость1 зависимость2 ...
# <обязательно символ tab> команда1
# <обязательно символ tab> команда2
#                                              ...
#                                              
# имя файла для сборки также называется "цель", target

# call.o зависит от файла call.asm. Если изменился файл call.asm, нужно выполнить действие
*.o: print_hex.asm
	$(ASM) $(ASMFLAGS) -o print_hex.o print_hex.asm
	$(ASM) $(ASMFLAGS) -o call.o call.asm


# print_hex.o зависит от call.o но также и транзитивно от call.asm.
# Не нужно указывать транзитивные зависимости, make их выводит сам


program: call.o print_hex.o
	$(LD) -o call call.o print_hex.o