import 'package:flutter/material.dart';
import 'package:poke_api/pages/pokemon_page.dart';
import 'package:poke_api/pages/backend/pokemon_details(backend).dart';

class Pokemon_Details extends StatefulWidget {
  final Pokemon pokemon;
  const Pokemon_Details(this.pokemon,{super.key});

  @override
  State<Pokemon_Details> createState() => _Pokemon_DetailsState();
}

class _Pokemon_DetailsState extends State<Pokemon_Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Entrada Pokedex'),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: Transform.scale(
                  scale: 1,
                  child: Image.network(widget.pokemon.urlImagen, fit: BoxFit.cover),
                ),
              ),
              Text(widget.pokemon.name, style: const TextStyle(fontSize: 25)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Types(type: widget.pokemon.types[0]),
                  if (widget.pokemon.types.length > 1) // Verifica si hay más de un tipo
                    Types(type: widget.pokemon.types[1]),
                  
                ],
              ),

              const SizedBox(height: 20),
              Stats(statName: 'Hp', statValue: widget.pokemon.hp),
              Stats(statName: 'Attack', statValue: widget.pokemon.attack),
              Stats(statName: 'Defense', statValue: widget.pokemon.defense),
              Stats(statName: 'Special Attack', statValue: widget.pokemon.specialAttack),
              Stats(statName: 'Special Defense', statValue: widget.pokemon.specialDefense),
              Stats(statName: 'Speed', statValue: widget.pokemon.speed),              
  
              const SizedBox(height: 20),

              Habilities(widget: widget),
            ],
          ),
        ),
      );
  }
}




