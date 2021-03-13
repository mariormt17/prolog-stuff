/* BaseConocimientos2: tipo de autos
Dominio: con respecto a ciertas caracteristicas, se deduce el tipo de
auto que es, ya sea un Descapotable, Sedán, SUV, Hatchback o Coupé
*/
conocimiento('Auto tipo Descapotable',
['el auto tiene 4 puertas','el auto puede tener 2 asientos o 5 asientos', 'el techo del auto se puede abrir/quitar',
'el auto tiene techo mecanico']).
conocimiento('Auto tipo Sedán',
['el auto tiene 4 puertas', 'el auto cuenta con maletero amplio',
'el auto puede describirse como un auto familiar']).
conocimiento('Auto tipo SUV',
['el auto tiene 4 puertas','el auto tiene mayor capacidad de carga',
'el auto combina elementos todoterreno y de turismo']).
conocimiento('Auto tipo Hatchback',
['el auto tiene 4 puertas', 'el auto se puede describir como compacto',
'la puerta del maletero se abre junto con el parabrisas']).
conocimiento('Auto tipo Coupé',
['el auto tiene 2 puertas', 'el auto puede tener 2 asientos o 5 asientos',
'el auto tiene la carroceria de un Sedan pero con dos puertas']).
