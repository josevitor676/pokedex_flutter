import 'package:flutter/material.dart';
import 'package:pokedex_aplication/service/pokemons.service.dart';

class CardPokemon extends StatelessWidget {
  final Map pokemon;
  final Function(Map) navigateDetail;
  final double larguraTela;
  const CardPokemon({
    super.key,
    required this.pokemon,
    required this.navigateDetail,
    required this.larguraTela,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateDetail(pokemon);
      },
      child: Card(
        color: Color(0xFFD6E5E9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(2),
              child: Image.network(
                pokemon['img'],
                height: larguraTela < 330 ? 100 : 70,
                width: 65,
                alignment: Alignment.center,
              ),
            ),
            Text(
              pokemon['name'],
              style: TextStyle(
                  color: Color(0xFF333754),
                  fontWeight: FontWeight.bold,
                  fontSize: larguraTela < 330 ? 25 : 14),
            ),
            Text(
              pokemon['num'],
              style: TextStyle(
                color: Color(0xFF333754),
                fontSize: larguraTela < 330 ? 20 : 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
