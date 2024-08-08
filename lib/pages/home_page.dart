import 'package:flutter/material.dart';


class Home_page extends StatelessWidget {
  const Home_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomePage'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
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
            ]
          ),
        ),
      );
  }
}