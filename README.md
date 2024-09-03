# Analizador Sintáctico

Este proyecto es un **analizador sintáctico** desarrollado con **Bison** y **Flex** que permite procesar expresiones aritméticas simples. El analizador reconoce y evalúa expresiones matemáticas que contienen operadores básicos como `+`, `-`, `*`, y `/`.


## Ejecución Inicial

Para ejecutar el analizador sintáctico, sigue los siguientes pasos:

1. **Generar el código C del analizador léxico**:

        flex calculadora.l
    
    Esto generará un archivo llamado lex.yy.c.

2. **Generar el código C del analizador sintáctico**:

        bison -dy calc.y

    Esto generará los archivos y.tab.c y y.tab.h.

3. **Compilar los archivos generados**:

        gcc lex.yy.c y.tab.c -o calculator

4. **Compilar los archivos generados**:

        ./calculator

## Ejemplo de uso

El analizador sintáctico permite evaluar expresiones aritméticas. A continuación, se describen las principales reglas y componentes del analizador:

    1. %{ ... %}: Sección que permite incluir código C 2. directamente en el archivo de Bison. Aquí se incluyen las cabeceras estándar de C y se declaran las funciones yyerror y yylex.

    2. %token NUMBER: Define el token NUMBER utilizado en el análisis léxico para representar números.

    3. input: Regla que permite múltiples expresiones y maneja la salida cuando se encuentra el símbolo =.

    4. expr: Define cómo se construyen las expresiones usando los operadores + y -.

    5. term: Define cómo se construyen los términos usando los operadores * y /.

    6. factor: Define los factores en las expresiones.
    
    7. main: Función principal que inicia el análisis sintáctico llamando a yyparse.

    8. yyerror: Función que se llama en caso de errores sintácticos, imprimiendo un mensaje con información del error.

## Pruebas
Para probar el analizador, puedes ingresar expresiones aritméticas directamente en la entrada estándar del programa.

 Por ejemplo:

    3 + 4 * (2 - 1)

El analizador reconocerá la sintaxis y evaluará la expresión siguiendo las reglas definidas.

## Contribuciones
Las contribuciones son bienvenidas. Por favor, abre un "issue" o un "pull request" en el repositorio de GitHub para sugerir mejoras o correcciones.