/* Instituto Tecnologico de Tijuana
Depto de Sistemas y computacion
Ing. En sistemas computacionales
Autor: Garcia Pineda Eduardo Alberto
Repositorio: https://github.com/wTEduardo/2-4-AutoEjercicios-con-AI-2/tree/main


#include <stdio.h>

int main() {
    double num1, num2, suma;

    // Solicitar al usuario que ingrese dos números
    printf("Ingresa el primer número: ");
    scanf("%lf", &num1);

    printf("Ingresa el segundo número: ");
    scanf("%lf", &num2);

    // Realizar la suma
    suma = num1 + num2;

    // Mostrar el resultado
    printf("La suma de %.2lf y %.2lf es %.2lf\n", num1, num2, suma);

    return 0;
}*/

//Codigo ensamblador:

	.arch armv6                @ Definir la arquitectura ARMv6
	.eabi_attribute 28, 1     @ Atributos específicos del ABI (Application Binary Interface)
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file "U2P4.c"            @ Nombre del archivo fuente

	.text                      @ Sección de código
	.section .rodata           @ Sección de datos de solo lectura
	.align 2
.LC0:
	.ascii "Ingresa el primer n\303\272mero: \000"  @ Cadena de texto
	.align 2
.LC1:
	.ascii "%lf\000"            @ Formato de cadena para scanf
	.align 2
.LC2:
	.ascii "Ingresa el segundo n\303\272mero: \000"  @ Cadena de texto
	.align 2
.LC3:
	.ascii "La suma de %.2lf y %.2lf es %.2lf\012\000"  @ Cadena de texto

	.text
	.align 2
	.global main              @ Declaración de la función main
	.arch armv6
	.syntax unified
	.arm
	.fpu vfp

	.type main, %function     @ Definición de la función main
main:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push {r4, r5, fp, lr}      @ Almacenar registros en la pila
	add fp, sp, #12           @ Establecer un nuevo marco de pila
	sub sp, sp, #40            @ Reservar espacio en la pila

	ldr r0, .L3               @ Cargar la dirección de una cadena en r0
	bl printf                 @ Llamar a la función printf

	...                        @ Resto del código para realizar la suma y mostrar el resultado

	mov r3, #0                @ Mover el valor 0 a r3 (retorno)
	mov r0, r3                @ Mover r3 a r0 (retorno)

	sub sp, fp, #12           @ Restaurar el puntero de pila
	pop {r4, r5, fp, pc}      @ Recuperar registros y volver

.L4:
	.align 2
.L3:
	.word .LC0                @ Direcciones de cadenas y formatos
	.word .LC1
	.word .LC2
	.word .LC3
	.size main, .-main
	.ident "GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0"
	.section .note.GNU-stack,"",%progbits
