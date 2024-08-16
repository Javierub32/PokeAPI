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
                height: 125,
                width: 125,
                child: Transform.scale(
                  scale: 1,
                  child: Image.network(widget.pokemon.urlImagen, fit: BoxFit.cover),
                ),
              ),

              Text(widget.pokemon.name, style: const TextStyle(fontSize: 25)),
              
              Types(types: widget.pokemon.types),

              const SizedBox(height: 20),
              Stats(statName: 'Hp', statValue: widget.pokemon.hp),
              Stats(statName: 'Attack', statValue: widget.pokemon.attack),
              Stats(statName: 'Defense', statValue: widget.pokemon.defense),
              Stats(statName: 'Special Attack', statValue: widget.pokemon.specialAttack),
              Stats(statName: 'Special Defense', statValue: widget.pokemon.specialDefense),
              Stats(statName: 'Speed', statValue: widget.pokemon.speed),
              Stats(statName: 'Total', statValue: calcularTotalStats()),            
  
              const SizedBox(height: 20),

              Habilities(habilities: widget.pokemon.habilities),

              const SizedBox(height: 20),

              Weaknesess(types: widget.pokemon.types),
            ],
          ),
        ),
      );
  }

  int calcularTotalStats(){
    return widget.pokemon.hp + widget.pokemon.attack + widget.pokemon.defense + widget.pokemon.specialAttack + widget.pokemon.specialDefense + widget.pokemon.speed;
  }
}




