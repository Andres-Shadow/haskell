{-
=============================================================
haskell es un lenguaje de programación funcional
además tiene muchas similitudes a expresiones matemáticas
es igual de celoso a python con los tabs
los archivos se llaman modulos, es similar al concepto de clases en java
al inicio de los modulos se debe poner module Nombre where 
donde Nombre suele ser el nombre del archivo
=============================================================
-}

-- ===================================    
-- ejemplo de creación de una función
-- primero declaro la función y luego se especifica
-- ===================================    

-- función que recibe dos enteros y los divide
{-
public int division(int x, int y){
    return x / y;
}
-}
division :: Int -> Int -> Int
division x y = x `div` y
-- funcion que retorna el cuadrado de un número
{-
publid int cuadrado(int a){
    return a * a;
}
-}
cuadrado :: Int -> Int 
cuadrado a = a * a

{-
se puede decir que las funciones hacen un retorno directo
porque no es necesario ni buena práctia utilizar una variable como retorno
-}

-- no es necesario declarar la función pero es una buena práctia segun su 
-- funcionan exactamente igual
division2 x2 y2 = x2 `div` y2
cuadrado2 a2 = a2 * a2

-- no se pueden tener dos funciones con el mismo nombre pero se puede 
-- primar la función
division' x y = x / y


-- ===================================    
-- ejemplo de condicionales
-- ===================================    

{-
como todo es una función, existe una forma sencilla de hacer las condiciones
en este caso es una función de una sola línea donde se retorna un string
pero se puede obviar la declaración de variable para el retorno
-}

--con declaración de variable para retorno ::string es como tener
--public String decisionSimple() 
--como un equivalente tenemos public String () -> ::string
decisionSimple :: String = if 1 == 1 then "verdadero" else "falso"

--sin declaración de variable para retorno, el compilador lo
--puede inferir a partir del tipo de retorno
--en este caso el compilador entiende que se debe retornar un Int
--se evita poner decisionSimple2 ::Int 
decisionSimple2 = if 1 == 1 then 1 else 2

-- tambien se puede hacer la condición utilizando varias lineas 
decisionSimple3 = if 1 == 1
                then "True"
                else "False"

{-
se tiene un caso especial con los condicionales case pues si 
cambian bastante a lo que conocemos viniendo de java,
como dato relevante esta el cambio de los case y el default
se omite el case directamente y se pone la opcion
 case 2:  =  2 -> 

el default cambia por _ y obligatoriamente tiene que ir de último
 default: = _ ->
-}

{-
public String opcion(int opcion){
    switch(opcion){
        case 1: return "uno";
        case 2: return "dos";
        default: return "otro numero"
    }
}
-}

opcion :: Int -> String
opcion n = case n of
    1 -> "uno"
    2 -> "dos"
    _ -> "otro numero"

-- otro ejemplo
opcion2 :: Int -> Int
opcion2 n = case n of
    1 -> 1
    2 -> 2
    _ -> 0
    

-- ===================================    
-- en haskell no existen los ciclos
-- todo se hace forma recursiva lamentablemente
-- ===================================    


sumNumerosNaturales :: Int -> Int
sumNumerosNaturales n
    | n <= 0    = 0
    | otherwise = n + sumNumerosNaturales (n - 1)


-- funciones curiosas que me encontré
-- map aplica una función ya creada o una operación matematica sobre los elementos de un arreglo
{-
publit []int dobleDeUnArray (){
    int [] arreglo = {1,2,3,4,5};
    for (int i = 0; i< 5 ; i++){
        arreglo[i] = arreglo[i]*2
    }
    return arreglo;
}
-}
-- es mucho más rapido
dobleDeUnArray :: [Int]
dobleDeUnArray = map (*2) [1..5] -- [2,4, 6, 8, 10]


-- ===================================    
-- los tipos de datos son un chicharon una gonorrea
-- con eso les resumo toda la documentación
-- ===================================    

-- para nombrar una variable se pone type al inicio y se igual al tipo de dato
-- SIEMPRE SE NOMBRAR LAS VARIABLES CON LA INICIAL EN MAYUSCULA

type Entero = Int
type Flotante = Float
type Cadena = String
type Caracter = Char
type Logico = Bool

-- pero uno también puede crear su tipo de dato
-- moy parecido a la creación de clases en java

-- se crean las variables nombre y nota
-- a partir de ahi se crea un objeto estudiante que tiene nombre y un array de notas
type Nombre = String
type Nota = Float
data Estudiante = Estudiante Nombre [Nota]

-- LO MEJOR PARA LO ÚLTIMO, LA CLASE IO
-- ===================================    
-- en resumen todas los programas en haskell tiene que tener un main
-- por regla obligatorio ese main TIENE QUE RETORNAR UN OBJETO IO()
-- ===================================  

main :: IO()
main = putStrLn "Hola mundo!"

-- se puede decir que IO() es la representación de una secuencia de pasos
-- que realiza el computador, por lo general se utiliza el do para señalar
-- el inicio de esas instrucciones

saludar :: IO()
saludar = do 
    putStrLn "Hola, Ingresa tu nombre: "
    nombre <- getLine -- así es como se capturan los datos por consola xd
    putStrLn $ "Hola, " ++ nombre

-- con $ se le indica al programa que se va a usar una variable en la impresión
-- muy similar a c donde uno usaba el printf("texto %i", numero) para indicar la variable
-- creo que con todo eso les hice un mega resumen de como sirve esta monda
  