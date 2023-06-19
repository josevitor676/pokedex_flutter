import 'package:flutter/material.dart';

class InfoPokemon extends StatelessWidget {
  final Map pokemon;
  final String info;
  const InfoPokemon({super.key, required this.pokemon, required this.info});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xFFD6E5E9),
          borderRadius: BorderRadius.circular(15),
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (info == 'Tipo')
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Tipagem',
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xFF333754),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: ListView.builder(
                          itemCount: pokemon['type'].length,
                          itemBuilder: (context, index) {
                            final tipo = pokemon['type'][index];
                            return Text(
                              tipo,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF333754),
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            else if (info == 'Info')
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(20),
                child: Text(
                  pokemon['name'] +
                      ' possui uma Altura de ' +
                      pokemon['height'] +
                      ' e o peso de ' +
                      pokemon['weight'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF333754),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            else if (info == 'Fraquezas')
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Fraquezas',
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xFF333754),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: ListView.builder(
                          itemCount: pokemon['weaknesses'].length,
                          itemBuilder: (context, index) {
                            final tipo = pokemon['weaknesses'][index];
                            return Text(
                              tipo,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF333754),
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            else
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Tipagem',
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xFF333754),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: ListView.builder(
                          itemCount: pokemon['type'].length,
                          itemBuilder: (context, index) {
                            final tipo = pokemon['type'][index];
                            return Text(
                              tipo,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF333754),
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}




