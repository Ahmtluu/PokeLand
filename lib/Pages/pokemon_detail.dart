import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Class/pokemon.dart';

class PokeDetail extends StatefulWidget {
  final Pokemon pokemon;

  PokeDetail({this.pokemon});

  @override
  _PokeDetailState createState() => _PokeDetailState();
}

class _PokeDetailState extends State<PokeDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF45526C),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF45526C),
        title: Text(widget.pokemon.name),
      ),

      body:  Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,

            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child:  Container(
                            decoration: BoxDecoration(
                                color:Colors.primaries[Random().nextInt(Colors.primaries.length)],
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Hero(
                                tag: widget.pokemon.img,
                                child: Container(
                                  height: 150.0,
                                  width: 150.0,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(widget.pokemon.img))),
                                )),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                widget.pokemon.name,
                                style: TextStyle(color: Color(0xFFF05945), fontSize: 25.0, fontWeight: FontWeight.bold),
                              ),
                              Divider(
                                color: Colors.red,
                                thickness: 1,
                                indent: 10,
                                endIndent: 10,
                              ),

                              Text("Height: ${widget.pokemon.height}",style: TextStyle(color: Color(0xFF45526C), fontSize: 18.0, fontWeight: FontWeight.bold),),
                              Text("Weight: ${widget.pokemon.weight}",style: TextStyle(color:  Color(0xFF45526C), fontSize: 18.0, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                        children: [
                          Text(
                            "Types:",
                            style: TextStyle(color: Color(0xFF45526C), fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: widget.pokemon.type
                                .map((pokemonName) => Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: FilterChip(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  backgroundColor: Colors.teal,
                                  label: Text(pokemonName,style: TextStyle(color: Colors.white),),
                                  onSelected: (b) {}),
                            ))
                                .toList(),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text("Weakness:",
                          style: TextStyle(color: Color(0xFF45526C), fontSize: 18.0, fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: widget.pokemon.weaknesses
                            .map((pokemonWeakness) => FilterChip(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            backgroundColor: Colors.red,
                            label: Text(
                              pokemonWeakness,
                              style: TextStyle(color: Colors.white),
                            ),
                            onSelected: (b) {}))
                            .toList(),
                      )

                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Next Evolution:",
                              style: TextStyle(color: Color(0xFF45526C), fontSize: 18.0, fontWeight: FontWeight.bold)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: widget.pokemon.nextEvolution == null
                                ? <Widget>[Text("This is the final form")]
                                : widget.pokemon.nextEvolution.map((pokemonEvolution) => Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: FilterChip(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                backgroundColor: Colors.green,
                                label: Text(
                                  pokemonEvolution.name,
                                  style: TextStyle(color: Colors.white),
                                ),
                                onSelected: (b) {},
                              ),
                            ))
                                .toList(),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
