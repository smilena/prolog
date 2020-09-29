materia('bd').
materia('seminario').
materia('matematicas').
materia('informatica').
materia('anteproyecto').

/* Notas bases de datos */

nota('bd', [4.3, 4, 4, 4, 4, 0]).

/* Notas seminario de investigación*/

nota('seminario', [5, 5, 2.5, 5, 5]).

/* Notas informática */

nota('informatica', [5, 5, 0]).

/* Notas herramientas matemáticas */

nota('matematicas', [4.5, 4.5, 0]).

/* Avance anteproyecto */

itemAnteproyecto('problema', 1).
itemAnteproyecto('objetivos', 1).
itemAnteproyecto('justificacion', 1).
itemAnteproyecto('marco referencia', 0).
itemAnteproyecto('hipotesis', 0).
itemAnteproyecto('metodología', 0).
itemAnteproyecto('impacto y resultados', 0).
itemAnteproyecto('recursos y presupuesto', 0).
itemAnteproyecto('cronograma', 0).
itemAnteproyecto('limitaciones', 0).

sumar([], 0).
sumar([H|T],Suma) :- sumar(T,Suma1), Suma is Suma1 + H.

tamano([], 0 ).
tamano([_|T], L ) :- tamano(T, N), L is N+1.

promedio(List, A) :-
    tamano(List, L),
    sumar(List, S),
    A is S / L.

avanceMateria(Materia, Avance) :- nota(Materia, Notas), promedio(Notas, Promedio), progresoMateria(Promedio, Avance).

progresoMateria(Promedio, Y) :- 
    ( 
        Promedio < 3 -> Y = malo;
	    Promedio < 4 -> Y = normal;
        Promedio < 5 -> Y = bueno 
    ).

avanceAnteproyecto(Avance) :- 
    findall(X, itemAnteproyecto(_, X), L), 
    sumar(L, Suma),
    tamano(L, Tamano) ,
    Avance is (Suma/Tamano)*100.