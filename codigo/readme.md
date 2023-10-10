Codigo utilizado:

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
}

Cod
