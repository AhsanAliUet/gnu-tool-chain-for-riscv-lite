
::riscv64-unknown-elf-as -c -o build/startup.o src/startup.s -march=rv32i -mabi=ilp32
rmdir -r build
mkdir build
riscv64-unknown-elf-as -c -o build/r_type.o src/r_type.s -march=rv32i -mabi=ilp32
riscv64-unknown-elf-gcc -o build/r_type.elf build/r_type.o -T linker.ld -nostdlib -march=rv32i -mabi=ilp32
riscv64-unknown-elf-objcopy -O binary --only-section=.data* --only-section=.text* build/r_type.elf build/r_type.bin
python3 maketxt.py build/r_type.bin > build/r_type.txt
riscv64-unknown-elf-objdump -S -s build/r_type.elf > build/r_type.dump