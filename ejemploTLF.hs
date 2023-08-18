-- creacion de variables
type Nombre = String
type Nota = Float
data Estudiante = Estudiante Nombre [Nota]

-- funcion para calcular el promedio de un estudiante
promedioEstudiante :: Estudiante -> Nota
promedioEstudiante (Estudiante _ notas) = sum notas / fromIntegral (length notas)

-- funcion para determinar el estado del estudiante
estadoEstudiante :: Estudiante -> String
estadoEstudiante estudiante
    | promedio >= 7.0 = "Aprobado"
    | promedio >= 5.0 = "Regular"
    | otherwise = "Reprobado"
    where promedio = promedioEstudiante estudiante

-- funcion para obtener el nombre de un estudiante
nombreEstudiante :: Estudiante -> Nombre
nombreEstudiante (Estudiante nombre _) = nombre

-- funcion para calcular el promedio de un grupo de estudiantes
promedioGrupo :: [Estudiante] -> Nota
promedioGrupo estudiantes = sum (map promedioEstudiante estudiantes) / fromIntegral (length estudiantes)

-- Ejemplo de datos
estudiantes :: [Estudiante]
estudiantes =
    [ Estudiante "Juan" [8.5, 7.0, 9.0]
    , Estudiante "María" [6.5, 7.5, 6.0]
    , Estudiante "Carlos" [4.0, 5.5, 3.5]
    ]

-- funcion principal que imprime resultados
main :: IO ()
main = do
    putStrLn "Registro de Notas"
    putStrLn "================="
    
    putStrLn "\nEstudiantes:"
    mapM_ (\est -> putStrLn $ nombreEstudiante est ++ " - " ++ estadoEstudiante est) estudiantes
    
    putStrLn "\nPromedio del grupo:"
    print $ promedioGrupo estudiantes
