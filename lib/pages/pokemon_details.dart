import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:poke_api/pages/pokemon_page.dart';
import 'package:http/http.dart' as http;


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
              Text(widget.pokemon.name, style: TextStyle(fontSize: 25),),

              const SizedBox(height: 20),
              Text('HP:  ${widget.pokemon.hp}'),
              Text('Attack:  ${widget.pokemon.attack}'),
              Text('Defense:  ${widget.pokemon.defense}'),
              Text("Special Attack: ${widget.pokemon.specialAttack}"),
              Text("Special Defense: ${widget.pokemon.specialDefense}"),
              Text("Speed: ${widget.pokemon.speed}"),

              SizedBox(height: 20),

              Habilities(widget: widget),
            ],
          ),
        ),
      );
  }
}

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
