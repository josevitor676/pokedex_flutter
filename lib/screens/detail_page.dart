import 'package:flutter/material.dart';
import 'package:pokedex_aplication/screens/home_page.dart';
import 'package:pokedex_aplication/widget/card_pokemon.dart';
import 'package:pokedex_aplication/widget/info_pokemon.dart';

class DetailPage extends StatefulWidget {
  final Map pokemon;
  const DetailPage({super.key, required this.pokemon});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String moreInfo = '';
  Map pokemon = {};

  @override
  void initState() {
    super.initState();
    setState(() {
      pokemon = widget.pokemon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFD6E5E9),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color(0xFFF4FBFB),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(6),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        style: ButtonStyle(
                          alignment: Alignment.center,
                          overlayColor: MaterialStatePropertyAll(
                            Colors.transparent,
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Color(0xFF888AA1),
                        ),
                        onPressed: () {
                          navigateToHomePage();
                        },
                      ),
                    ),
                    Expanded(
                      flex: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            pokemon['name'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF333754),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            pokemon['num'],
                            textAlign: TextAlign.center,
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6),
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFFD6E5E9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.network(
                    pokemon['img'],
                    alignment: Alignment.center,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        moreInfo = 'Tipo';
                      });
                    },
                    child: Text('Tipo'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        moreInfo = 'Info';
                      });
                    },
                    child: Text('Info'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        moreInfo = 'Fraquezas';
                      });
                    },
                    child: Text('Fraquezas'),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              InfoPokemon(
                pokemon: pokemon,
                info: moreInfo,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> navigateToHomePage() async {
    final route = MaterialPageRoute(
      builder: (context) => HomePage(),
    );
    await Navigator.pushReplacement(context, route);
  }
}
