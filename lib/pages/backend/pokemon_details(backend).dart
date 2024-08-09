import 'package:flutter/material.dart';

import 'package:poke_api/pages/pokemon_details.dart';

class Habilities extends StatelessWidget {
  const Habilities({
    super.key,
    required this.widget,
  });

  final Pokemon_Details widget;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text('Abilities', textAlign: TextAlign.center,),
        
        subtitle: Row(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0), // Agrega padding alrededor del widget
              margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0), // Márgenes para separarlo de otros widgets
              decoration: BoxDecoration(
                color: Colors.white, // Fondo blanco para destacar
                borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12, // Sombra ligera para dar un efecto de elevación
                    blurRadius: 8.0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Text(widget.pokemon.habilities[0]), // Tu widget original
            ),
            Container(
              padding: const EdgeInsets.all(10.0), // Agrega padding alrededor del widget
              margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0), // Márgenes para separarlo de otros widgets
              decoration: BoxDecoration(
                color: Colors.white, // Fondo blanco para destacar
                borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12, // Sombra ligera para dar un efecto de elevación
                    blurRadius: 8.0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Text(widget.pokemon.habilities[1]), // Tu widget original
            ),

            if (widget.pokemon.habilities.length > 2)
            Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8.0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Text(widget.pokemon.habilities[2]),
              
            ),
          ],
        ),
      ),
    );
  }
}

class Types extends StatelessWidget {
  final String type;

  const Types({
    super.key,
    required this.type,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0), // Agrega padding alrededor del widget
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0), // Márgenes para separarlo de otros widgets
      decoration: BoxDecoration(
        color: elegirColor(type.toLowerCase()), // Fondo blanco para destacar
        borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
        //border: Border.all(color: Colors.limeAccent), //
        boxShadow: const [
          BoxShadow(
            color: Colors.black12, // Sombra ligera para dar un efecto de elevación
            blurRadius: 8.0,
            offset: Offset(0, 4),
          ),
          
        ],
      ),
      child: Text(
        type,
        style: const TextStyle(
          color: Colors.white,
          //fontWeight: FontWeight.bold
        ),
      ), // Tu widget original
    );
  }

  Color elegirColor(String type) {
    switch (type) {
      case 'fire':
        return const Color(0xFFFF5733);
      case 'water':
        return const Color(0xFF3498DB);
      case 'grass':
        return const Color(0xFF7AC74C);
      case 'electric':
        return const Color(0xFFF1C40F);
      case 'psychic':
        return const Color(0xFF9B59B6);
      case 'ice':
        return const Color(0xFF5DADE2);
      case 'dragon':
        return const Color(0xFF8E44AD);
      case 'dark':
        return const Color(0xFF34495E);
      case 'fairy':
        return const Color(0xFFFADBD8);
      case 'normal':
        return const Color(0xFFAAB7B8);
      case 'poison':
      return const Color(0xFF8E44AD);
      case 'bug':
        return const Color(0xFFA6B91A);
      case 'flying':
      return const Color(0xFFA98FF3);
      case 'steel':
        return const Color(0xFFB7B7CE);
      case 'ghost':
      return const Color(0xFF735797);
      case 'rock':
        return const Color(0xFFB6A136);
      case 'ground':
      return const Color(0xFFE2BF65);
      case 'fighting':
        return const Color(0xFFC22E28);
      default:
        return Colors.grey; // Color por defecto si el tipo no coincide
    }
  }
}

class Stats extends StatelessWidget {
  final String statName;
  final int statValue;
  const Stats({
    required this.statName,
    required this.statValue,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 0), // Espacio entre el borde de la pantalla y el texto
        //Text('$statName: $statValue'),
        SizedBox(
          width: 125,
          child: Text('$statName: '), // Espacio entre el texto y la barra
        ), // Espacio entre el texto y la barra
        SizedBox(
          width: 35,
          child: Text('$statValue'), // Espacio entre el texto y la barra
        ), // Valor del stat
        Container(
          width: 170, // Limitar el ancho máximo de la barra
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey[300],
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: statValue / 255.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: elegirColor(statValue), // Color de la barra
              ),
            ),
          ),
        ),
      ],
    );
  }

  Color elegirColor(int statValue) {
      Color color = Colors.grey; // Initialize the color variable with a default value
      if (statValue < 30) {
        color = Colors.red;
      } else if (statValue < 50) {
        color = Colors.orange;
      } else if (statValue < 100) {
        color = const Color(0xffffdd57);
      } else if (statValue < 125) {
        color = const Color(0xffa0e515);
      } else if (statValue < 150) {
        color = const Color(0xff23cd5e);
      } else if (statValue <= 255) {
        color = const Color(0xff00c2b8);
      }
      return color;
    }
}