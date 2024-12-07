%PUNTO 1:Hablar con propiedad

inmueble(casa(120)).
inmueble(casa(110)).
inmueble(departamento(3 , 2)).
inmueble(loft(2000)).
inmueble(departamento(4 , 1)).

inquilino(juan , casa(120)).
inquilino(nico , departamento(3, 2)).
inquilino(julian , loft(2000)).
inquilino(vale , departamento(4, 1)).
inquilino(alf , departamento(3 ,1)).
inquilino(fer , casa(110)).

zona(alf , almagro).
zona(juan , almagro).
zona(nico , almagro).
zona(julian , almagro).

zona(vale , flores).
zona(fer , flores).

barrio(flores).
barrio(almagro).

%PUNTO 2:Barrio copado , infierno chico

esCopada(casa(Metros)):-
    Metros >= 100.
esCopada(departamento(Ambientes , _)):-
    Ambientes >=3.
esCopada(departamento(_ , Banios)):-
    Banios>=1.
esCopada(loft(AnioDeConstruccion)):-
    AnioDeConstruccion>2015.

elBarrioEsCopado(Barrio):-
    barrio(Barrio),
    forall(zona(Inquilio , Barrio), (inquilino(Inquilio , Inmueble) , esCopada(Inmueble))).

%PUNTO 3:Barrio (caro) talvez

esCaro(casa(Metros)):-
    Metros >= 90.
esCaro(departamento(Ambientes , _)):-
    Ambientes >=3.
esCaro(loft(AnioDeConstruccion)):-
    AnioDeConstruccion>=2005.

elBarrioEsCaro(Barrio):-
    barrio(Barrio),
    forall(zona(Inquilio , Barrio), (inquilino(Inquilio , Inmueble) , esCaro(Inmueble))).


%PUNTO 4:Tasa, tasa, tasacion de la casa
valor(juan , 1500000).
valor(nico , 80000).
valor(alf , 75000).
valor(julian , 140000).
valor(vale , 95000).
valor(fer , 60000).
 
puedeComprar(Dinero, DineroRestante , Duenio):-
    valor(Duenio , Valor),
    Dinero >= Valor,
    DineroRestante is (Dinero-Valor).
    

queCasasPuedeComprar(Dinero , Lista):-
    puedeComprar(Dinero , DineroRestante , Duenio),
    findall(OtroDuenio, (puedeComprar(DineroRestante , OtroDinero , OtroDuenio ) ,  Duenio \=  OtroDuenio , OtroDinero < DineroRestante), Lista).
    sublista([Duenio] , Lista).

sublista([] , []).
sublista([_,Cola] ,Sublista):-
    sublista(Cola , Sublista).
sublista([Cabeza , Cola] , [Cabeza , Sublista]):-
    sublista(Cola , Sublista).