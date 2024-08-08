import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:poke_api/pages/pokemon_details.dart';

class Pokemon_Page extends StatefulWidget {
  final String url;
  const Pokemon_Page(this.url,{super.key});

  @override
  State<Pokemon_Page> createState() => _Pokemon_PageState();
}

class _Pokemon_PageState extends State<Pokemon_Page> {
  late Future<List<Pokemon>> _listadoPokemons;

  final Dio _dio = Dio(); // Crear una instancia de Dio

  Future<List<Pokemon>> fetchPokemon() async {
    final response = await _dio.get(widget.url);
    List<Pokemon> pokemons = [];

    if (response.statusCode == 200) {
      final jsonData = response.data;
      List<Future<Pokemon>> futures = [];

      for (var pokemon in jsonData['results']) {
        futures.add(fetchPokemonDetails(pokemon));
      }

      pokemons = await Future.wait(futures); // Esperar todas las solicitudes de imagen concurrentemente
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
   
    return pokemons;
  }

  Future<Pokemon> fetchPokemonDetails(dynamic pokemon) async {
    String nombrePokemon = capitalizeFirstLetter(pokemon['name']);
    String referenciaPokemon = pokemon['url'];
    String pokemonImageUrl = await fetchPokemonImageUrl(referenciaPokemon);
    return Pokemon(name: nombrePokemon, urlImagen: pokemonImageUrl);
  }

  Future<String> fetchPokemonImageUrl(String referenciaPokemon) async {
    final responseImagen = await _dio.get(referenciaPokemon);
    String urlImagenPokemon = '';

    if (responseImagen.statusCode == 200) {
      final jsonDataImagen = responseImagen.data;
      urlImagenPokemon = jsonDataImagen['sprites']['front_default'];
    } else {
      print('Request failed with status: ${responseImagen.statusCode}');
    }

    return urlImagenPokemon;
  }

  String capitalizeFirstLetter(String s) {
    if (s.isEmpty) return s;
    return s[0].toUpperCase() + s.substring(1);
  }

  @override
  void initState() {
    super.initState();
    _listadoPokemons = fetchPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Pokemons'),
      ),
      body: Center(
        child: FutureBuilder(
          future: _listadoPokemons,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: _listPokemon(snapshot.data!),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  List<Widget> _listPokemon(List<Pokemon> data) {
    List<Widget> pokemons = [];

    for (var pokemon in data) {
      pokemons.add(
        Card(
          child: ListTile(
            title: Text(pokemon.name),
            leading: Image.network(pokemon.urlImagen),
            onTap: () {
              Pokemon pokemonDetalled;
              Navigator.push(context,
               MaterialPageRoute(builder: (context) => Pokemon_Details(pokemon))
               );
            },
          ),
        ),
      );
    }

    return pokemons;
  }
}

class Pokemon {
  String name;
  String urlImagen;

  Pokemon({required this.name, required this.urlImagen});

  getName() {
    return name;
  }
}
