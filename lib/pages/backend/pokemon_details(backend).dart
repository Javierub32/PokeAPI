import 'package:flutter/material.dart';

class Habilities extends StatelessWidget {
  const Habilities({
    super.key,
    required this.habilities,
  });

  final List<String> habilities;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 0), // Márgenes para separarlo de otros widgets
      child: ListTile(
        title: const Text(
          'Abilities',
          textAlign: TextAlign.center,
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < habilities.length; i++)
              Container(
                padding: const EdgeInsets.all(
                    10.0), // Agrega padding alrededor del widget
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: i == 0
                      ? 5.0
                      : 0.0, // Márgenes para separarlo de otros widgets
                ),
                decoration: BoxDecoration(
                  color: Colors.white, // Fondo blanco para destacar
                  borderRadius:
                      BorderRadius.circular(10.0), // Bordes redondeados
                  boxShadow: const [
                    BoxShadow(
                      color: Colors
                          .black12, // Sombra ligera para dar un efecto de elevación
                      blurRadius: 8.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(habilities[i]), // Tu widget original
              ),
          ],
        ),
      ),
    );
  }
}

class Types extends StatelessWidget {
  final List<String> types;

  const Types({
    super.key,
    required this.types,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < types.length; i++)
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
                vertical: 5.0), // Agrega padding alrededor del widget
            margin: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 5.0), // Márgenes para separarlo de otros widgets
            decoration: BoxDecoration(
              color: elegirColor(
                  types[i].toLowerCase()), // Fondo blanco para destacar
              borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
              //border: Border.all(color: Colors.limeAccent), //
              boxShadow: const [
                BoxShadow(
                  color: Colors
                      .black12, // Sombra ligera para dar un efecto de elevación
                  blurRadius: 8.0,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              types[i],
              style: const TextStyle(
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ), // Tu widget original
          ),
      ],
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
        //Espacio entre el nombre del stat y el valor del stat
        SizedBox(
          width: 125,
          child: Text('$statName: '),
        ),
        // Espacio entre el stat y la barra
        SizedBox(
          width: 35,
          child: Text('$statValue'),
        ),

        Visibility(
            visible: statName != 'Total',
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: statBar()),
      ],
    );
  }

  Widget statBar() {
    return Container(
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
    );
  }

  Color elegirColor(int statValue) {
    Color color =
        Colors.grey; // Initialize the color variable with a default value
    if (statValue < 30) {
      color = Colors.red;
    } else if (statValue < 60) {
      color = Colors.orange;
    } else if (statValue < 90) {
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

List<String> weaknesses(List<String> types) {
  Map<String, Map<String, double>> typeEffectiveness = {
    'Normal': {
      'Fighting': 2.0,
      'Ghost': 0.0,
    },
    'Fire': {
      'Water': 2.0,
      'Ground': 2.0,
      'Rock': 2.0,
      'Fire': 0.5,
      'Grass': 0.5,
      'Ice': 0.5,
      'Bug': 0.5,
      'Steel': 0.5,
    },
    'Water': {
      'Electric': 2.0,
      'Grass': 2.0,
      'Fire': 0.5,
      'Water': 0.5,
      'Ice': 0.5,
      'Steel': 0.5,
    },
    'Electric': {
      'Ground': 2.0,
      'Flying': 0.5,
      'Electric': 0.5,
      'Steel': 0.5,
    },
    'Grass': {
      'Fire': 2.0,
      'Ice': 2.0,
      'Poison': 2.0,
      'Flying': 2.0,
      'Bug': 2.0,
      'Water': 0.5,
      'Electric': 0.5,
      'Grass': 0.5,
      'Ground': 0.5,
    },
    'Ice': {
      'Fire': 2.0,
      'Fighting': 2.0,
      'Rock': 2.0,
      'Steel': 2.0,
      'Ice': 0.5,
    },
    'Fighting': {
      'Flying': 2.0,
      'Psychic': 2.0,
      'Fairy': 2.0,
      'Bug': 0.5,
      'Rock': 0.5,
      'Dark': 0.5,
    },
    'Poison': {
      'Ground': 2.0,
      'Psychic': 2.0,
      'Poison': 0.5,
      'Fighting': 0.5,
      'Bug': 0.5,
      'Grass': 0.5,
      'Fairy': 0.5,
    },
    'Ground': {
      'Water': 2.0,
      'Ice': 2.0,
      'Grass': 2.0,
      'Electric': 0.0,
      'Poison': 0.5,
      'Rock': 0.5,
    },
    'Flying': {
      'Electric': 2.0,
      'Ice': 2.0,
      'Rock': 2.0,
      'Fighting': 0.5,
      'Bug': 0.5,
      'Grass': 0.5,
      'Ground': 0.0,
    },
    'Psychic': {
      'Bug': 2.0,
      'Ghost': 2.0,
      'Dark': 2.0,
      'Fighting': 0.5,
      'Psychic': 0.5,
    },
    'Bug': {
      'Fire': 2.0,
      'Flying': 2.0,
      'Rock': 2.0,
      'Fighting': 0.5,
      'Ground': 0.5,
      'Grass': 0.5,
    },
    'Rock': {
      'Water': 2.0,
      'Grass': 2.0,
      'Fighting': 2.0,
      'Ground': 2.0,
      'Steel': 2.0,
      'Normal': 0.5,
      'Fire': 0.5,
      'Poison': 0.5,
      'Flying': 0.5,
    },
    'Ghost': {
      'Ghost': 2.0,
      'Dark': 2.0,
      'Normal': 0.0,
      'Fighting': 0.0,
      'Poison': 0.5,
      'Bug': 0.5,
    },
    'Dragon': {
      'Ice': 2.0,
      'Dragon': 2.0,
      'Fairy': 2.0,
      'Fire': 0.5,
      'Water': 0.5,
      'Electric': 0.5,
      'Grass': 0.5,
    },
    'Dark': {
      'Fighting': 2.0,
      'Bug': 2.0,
      'Fairy': 2.0,
      'Ghost': 0.5,
      'Dark': 0.5,
      'Psychic': 0.0,
    },
    'Steel': {
      'Fire': 2.0,
      'Fighting': 2.0,
      'Ground': 2.0,
      'Poison': 0.0,
      'Normal': 0.5,
      'Grass': 0.5,
      'Ice': 0.5,
      'Flying': 0.5,
      'Psychic': 0.5,
      'Bug': 0.5,
      'Rock': 0.5,
      'Dragon': 0.5,
      'Steel': 0.5,
      'Fairy': 0.5,
    },
    'Fairy': {
      'Poison': 2.0,
      'Steel': 2.0,
      'Fighting': 0.5,
      'Bug': 0.5,
      'Dark': 0.5,
      'Dragon': 0.0,
    },
  };

  Set<String> weaknesses = {};
  Set<String> resistances = {};

  for (String type in types) {
    if (typeEffectiveness.containsKey(type)) {
      for (String weakness in typeEffectiveness[type]!.keys) {
        if (typeEffectiveness[type]![weakness]! > 1) {
          weaknesses.add(weakness);
        }
        if (typeEffectiveness[type]![weakness]! < 1) {
          resistances.add(weakness);
        }
      }
    }
  }

  weaknesses.removeAll(resistances);
  return weaknesses.toList();
}

class Weaknesess extends StatelessWidget {
  final List<String> types;

  const Weaknesess({
    super.key,
    required this.types,
  });

  @override
  Widget build(BuildContext context) {
    List<String> weaknessesList = weaknesses(types);
    return Card(
      margin: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 0), // Márgenes para separarlo de otros widgets
      child: ListTile(
        title: const Text(
          'Weaknesses',
          textAlign: TextAlign.center,
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < weaknessesList.length; i++)
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0,
                    vertical: 5.0), // Agrega padding alrededor del widget
                margin: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                    vertical: 5.0), // Márgenes para separarlo de otros widgets
                decoration: BoxDecoration(
                  color: elegirColor(weaknessesList[i]
                      .toLowerCase()), // Fondo blanco para destacar
                  borderRadius:
                      BorderRadius.circular(10.0), // Bordes redondeados
                  //border: Border.all(color: Colors.limeAccent), //
                  boxShadow: const [
                    BoxShadow(
                      color: Colors
                          .black12, // Sombra ligera para dar un efecto de elevación
                      blurRadius: 8.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  weaknessesList[i],
                  style: const TextStyle(
                    color: Colors.white,
                    //fontWeight: FontWeight.bold
                  ),
                ), // Tu widget original
              ),
          ],
        ),
      ),
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
