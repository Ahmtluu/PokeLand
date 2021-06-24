import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokemon/Class/pokemon.dart';
import 'package:pokemon/Components/colorCheckFunctions.dart';
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
        AnimationLimiter(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: GridView.count(
              crossAxisCount: 2,
              children: pokeWorld.pokemon
                  // .map bize JSON içerisinde bulunan elemanların birden fazla özelliğe
                  // sahip olduğu durumlarda o elemanlara erişmemizi sağlar.
                  .map(
                    (poke) => AnimationConfiguration.staggeredGrid(
                      position: pokeWorld.pokemon.length,
                      duration: const Duration(milliseconds: 375),
                      columnCount: 2,
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  //Seçtiğimiz pokemonun olduğu ayrıntı ekranına gelir. context ile de hangi pokemonu seçtiğimizi belirlenir.
                                  MaterialPageRoute(
                                      builder: (context) => PokeDetail(pokemon: poke),
                                  ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:colorCheck(poke),
                                  boxShadow: [
                                    BoxShadow(
                                      color:colorCheck(poke),
                                      blurRadius: 5,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(poke.img),
                                    Text(
                                      poke.name,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
