import 'package:flutter/material.dart';
import 'package:poke_api/pages/home_page.dart';
import 'package:poke_api/pages/pokemon_page.dart';

void main() {
  runApp(const PokeAPI());
}

class PokeAPI extends StatelessWidget {
  const PokeAPI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home_page(),
        
        '/PrimeraGen': (context) => const Pokemon_Page("https://pokeapi.co/api/v2/pokemon?limit=151"),
        '/SegundaGen': (context) => const Pokemon_Page("https://pokeapi.co/api/v2/pokemon?limit=100&offset=151"),
        '/TerceraGen': (context) => const Pokemon_Page("https://pokeapi.co/api/v2/pokemon?limit=135&offset=251"),
        '/CuartaGen': (context) => const Pokemon_Page("https://pokeapi.co/api/v2/pokemon?limit=107&offset=386"),
        '/QuintaGen': (context) => const Pokemon_Page("https://pokeapi.co/api/v2/pokemon?limit=156&offset=493"),
        '/SextaGen': (context) => const Pokemon_Page("https://pokeapi.co/api/v2/pokemon?limit=72&offset=649"),
        '/SeptimaGen': (context) => const Pokemon_Page("https://pokeapi.co/api/v2/pokemon?limit=88&offset=721"),
        '/OctavaGen': (context) =>  const Pokemon_Page("https://pokeapi.co/api/v2/pokemon?limit=96&offset=809"),
        '/NovenaGen': (context) =>  const Pokemon_Page("https://pokeapi.co/api/v2/pokemon?limit=103&offset=905"),
        
        /*
        '/PrimeraGen': (context) => const Pokemon_Page("https://pokeapi.co/api/v2/pokemon?limit=5"),
        '/SegundaGen': (context) => const Pokemon_Page("https://pokeapi.co/api/v2/pokemon?limit=5&offset=151"),
        '/TerceraGen': (context) => const Pokemon_Page("https://pokeapi.co/api/v2/pokemon?limit=5&offset=251"),
        '/CuartaGen': (context) => const Pokemon_Page("https://pokeapi.co/api/v2/pokemon?limit=5&offset=386"),
        '/QuintaGen': (context) => const Pokemon_Page("https://pokeapi.co/api/v2/pokemon?limit=5&offset=493"),
        '/SextaGen': (context) => const Pokemon_Page("https://pokeapi.co/api/v2/pokemon?limit=5&offset=649"),
        '/SeptimaGen': (context) => const Pokemon_Page("https://pokeapi.co/api/v2/pokemon?limit=5&offset=721"),
        '/OctavaGen': (context) =>  const Pokemon_Page("https://pokeapi.co/api/v2/pokemon?limit=5&offset=809"),
        '/NovenaGen': (context) =>  const Pokemon_Page("https://pokeapi.co/api/v2/pokemon?limit=5&offset=905"),
        */
      },
    );
  }
}

/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
    String url = 'https://pokeapi.co/api/v2/pokemon?limit=10';
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: const Text("PokeAPI"),
      ),
      body: Pokemon_Page(url),
    );
  }
}
*/