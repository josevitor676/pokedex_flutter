import 'package:flutter/material.dart';
import 'package:pokedex_aplication/screens/detail_page.dart';
import 'package:pokedex_aplication/service/pokemons.service.dart';
import 'package:pokedex_aplication/widget/card_pokemon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchPokemonController = TextEditingController();
  List pokemons = [];
  List searchPokemon = [];
  bool isLoading = true;
  double larguraTela = 0.0;
  @override
  void initState() {
    searchPokemon = pokemons;
    super.initState();
    getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    larguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Color(0xFFD6E5E9),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color(0xFFF4FBFB),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.start,
                  'Pokédex',
                  style: TextStyle(
                    color: Color(0xFF333754),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  textAlign: TextAlign.start,
                  'Search for a pokemon by name or using its National Pokédex number.',
                  style: TextStyle(
                    color: Color.fromARGB(185, 51, 55, 84),
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 45,
                        alignment: Alignment.center,
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              searchPokemon = pokemons
                                  .where((element) =>
                                      element['name']
                                          .toLowerCase()
                                          .contains(value.toLowerCase()) ||
                                      element['num']
                                          .toLowerCase()
                                          .contains(value.toLowerCase()))
                                  .toList();
                            });
                          },
                          controller: searchPokemonController,
                          style: TextStyle(
                            color: Color(0xFF333754),
                            fontSize: 13,
                          ),
                          cursorColor: Color(0xFF333754),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(213, 214, 229, 233),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color.fromARGB(202, 51, 55, 84),
                            ),
                            labelText: 'Name or Number',
                            labelStyle: TextStyle(
                              color: Color.fromARGB(202, 51, 55, 84),
                              fontSize: 13,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Color(0xFFD6E5E9),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Color(0xFFD6E5E9),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 45,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          alignment: Alignment.center,
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(178, 51, 55, 84),
                          ),
                        ),
                        onPressed: () {},
                        child: Icon(Icons.add_to_photos_rounded),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: isLoading,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                  replacement: searchPokemonController.text.isNotEmpty &&
                          searchPokemon.isEmpty
                      ? Expanded(
                          child: Center(
                            child: Text(
                              'Nenhum pokemon encontrado.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      : Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: larguraTela < 330 ? 1 : 2,
                              crossAxisSpacing: 2.0,
                              mainAxisSpacing: 2.0,
                            ),
                            itemCount: searchPokemon.isNotEmpty
                                ? searchPokemon.length
                                : pokemons.length,
                            itemBuilder: (context, index) {
                              if (searchPokemon.isNotEmpty) {
                                final pokemon = searchPokemon[index];
                                return CardPokemon(
                                  pokemon: pokemon,
                                  navigateDetail: navigateToDetailPage,
                                  larguraTela: larguraTela,
                                );
                              } else {
                                final pokemon = pokemons[index];
                                return CardPokemon(
                                  pokemon: pokemon,
                                  navigateDetail: navigateToDetailPage,
                                  larguraTela: larguraTela,
                                );
                              }
                            },
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> navigateToDetailPage(Map pokemon) async {
    final route = MaterialPageRoute(
      builder: (context) => DetailPage(
        pokemon: pokemon,
      ),
    );
    await Navigator.pushReplacement(context, route);
  }

  Future<void> getPokemons() async {
    final response = await Pokemon.getAllPokemons();

    if (response != null) {
      setState(() {
        pokemons = response['pokemon'];
      });
    } else {
      print('erro');
    }
    setState(() {
      isLoading = false;
    });
  }
}
