import 'package:flutter/material.dart';
import 'package:poke_api/pages/pokemon_page.dart';


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
          title: const Text('Material App Bar'),
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
                ),),
              Text(widget.pokemon.name),
              
            ],
          ),
        ),
      );
  }
}
