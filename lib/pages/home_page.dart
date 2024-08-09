import 'package:flutter/material.dart';


class Home_page extends StatelessWidget {
  const Home_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PokeAPI'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              CustomButton(
              text: "Primera Generación",
              imageUrl: 'https://static.wikia.nocookie.net/espokemon/images/7/77/Pikachu.png/revision/latest?cb=20150621181250',
              onPressed: () {
                Navigator.pushNamed(context, '/PrimeraGen');
              },
            ),
            CustomButton(
              text: "Segunda Generación",
              imageUrl: 'https://images.wikidexcdn.net/mwuploads/wikidex/thumb/4/4e/latest/20230523204350/Chikorita.png/800px-Chikorita.png',
              onPressed: () {
                Navigator.pushNamed(context, '/SegundaGen');
              },
            ),
            CustomButton(
              text: "Tercera Generación",
              imageUrl: 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/258.png',
              onPressed: () {
                Navigator.pushNamed(context, '/TerceraGen');
              },
            ),
            CustomButton(
              text: "Cuarta Generación",
              imageUrl: 'https://static.wikia.nocookie.net/espokemon/images/9/9f/Chimchar.png/revision/latest?cb=20120927233211',
              onPressed: () {
                Navigator.pushNamed(context, '/CuartaGen');
              },
            ),
            CustomButton(
              text: "Quinta Generación",
              imageUrl: 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/495.png',
              onPressed: () {
                Navigator.pushNamed(context, '/QuintaGen');
              },
            ),
            CustomButton(
              text: "Sexta Generación",
              imageUrl: 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/656.png',
              onPressed: () {
                Navigator.pushNamed(context, '/SextaGen');
              },
            ),
            CustomButton(
              text: "Séptima Generación",
              imageUrl: 'https://images.wikidexcdn.net/mwuploads/wikidex/thumb/6/6e/latest/20230716212816/Litten.png/800px-Litten.png',
              onPressed: () {
                Navigator.pushNamed(context, '/SeptimaGen');
              },
            ),
            CustomButton(
              text: "Octava Generación",
              imageUrl: 'https://static.wikia.nocookie.net/espokemon/images/7/7a/Grookey.png/revision/latest?cb=20190606080924',
              onPressed: () {
                Navigator.pushNamed(context, '/OctavaGen');
              },
            ),
            CustomButton(
              text: "Novena Generación",
              imageUrl: 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/912.png',
              onPressed: () {
                Navigator.pushNamed(context, '/NovenaGen');
              },
            ),
              /*
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/PrimeraGen');
                },
                child: const Text("Primera Generación"),
              ),

              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/SegundaGen');
                },
                child: const Text("Segunda Generación"),
              ),

              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/TerceraGen');
                },
                child: const Text("Tercera Generación"),
              ),

              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/CuartaGen');
                },
                child: const Text("Cuarta Generación"),
              ),

              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/QuintaGen');
                },
                child: const Text("Quinta Generación"),
              ),

              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/SextaGen');
                },
                child: const Text("Sexta Generación"),
              ),

              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/SeptimaGen');
                },
                child: const Text("Septima Generación"),
              ),

              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/OctavaGen');
                },
                child: const Text("Octava Generación"),
              ),

              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/NovenaGen');
                },
                child: const Text("Novena Generación"),
              ),
            */  
            
            ]
          ),
        ),
      );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final String imageUrl;
  final VoidCallback onPressed;

  const CustomButton({
    required this.text,
    required this.imageUrl,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5.0,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.network(
              imageUrl,
              width: 40.0,
              height: 40.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 12.0),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}