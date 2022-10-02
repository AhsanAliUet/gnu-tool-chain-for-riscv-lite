
::riscv64-unknown-elf-as -c -o build/startup.o src/startup.s -march=rv32i -mabi=ilp32
rmdir -r build
mkdir build
riscv64-unknown-elf-as -c -o build/fact.o src/fact.s -march=rv32i -mabi=ilp32
riscv64-unknown-elf-gcc -o build/fact.elf build/fact.o -T linker.ld -nostdlib -march=rv32i -mabi=ilp32
riscv64-unknown-elf-objcopy -O binary --only-section=.data* --only-section=.text* build/fact.elf build/fact.bin
python3 maketxt.py build/fact.bin > build/fact.txt
riscv64-unknown-elf-objdump -S -s build/fact.elf > build/fact.dump