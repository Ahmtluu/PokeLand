import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokemon/Class/pokemon.dart';
import 'package:pokemon/Pages/pokemon_detail.dart';


//Pokemon Grid View
class PokemonGridView extends StatelessWidget {

 PokemonGridView({
    Key key,
    @required this.pokeWorld,
  }) : super(key: key);

  final PokemonWorld pokeWorld;

  @override
  Widget build(BuildContext context) {

    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Image.asset("images/pokemon.png"),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          child: GridView.count(
            crossAxisCount: 2,
            children: pokeWorld.pokemon
            // .map bize JSON içerisinde bulunan elemanların birden fazla özelliğe
            // sahip olduğu durumlarda o elemanlara erişmemizi sağlar.
                .map((poke) => Padding(
              padding: const EdgeInsets.all(2.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      //Seçtiğimiz pokemonun olduğu ayrıntı ekranına gelir. context ile de hangi pokemonu seçtiğimizi belirlenir.
                      MaterialPageRoute(
                          builder: (context) => PokeDetail(
                            pokemon: poke,
                          )));
                },
                child: Hero(
                  tag: poke.img,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        color:Colors.primaries[Random().nextInt(Colors.primaries.length)]

                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        poke.img))),
                          ),
                          Text(
                            poke.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )).toList(),
          ),
        )
      ],
    );
  }
}