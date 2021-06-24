import 'package:flutter/material.dart';
import 'package:pokemon/Components/colorCheckFunctions.dart';
import 'package:pokemon/Components/propertyPoke.dart';
import 'package:pokemon/Components/propertyTitle.dart';
import '../Class/pokemon.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';


class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokeDetail({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorCheck(pokemon),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: colorCheck(pokemon),
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children:[
                        Padding(
                          padding: const EdgeInsets.only(left: 28.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                pokemon.name,
                                style: TextStyle(
                                    fontSize: 32,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Row(
                                children:
                                pokemon.type.map((poke) => Padding(
                                  padding: const EdgeInsets.only(left: 28.0),
                                  child:Container(
                                    width: 36,
                                    height: 36,
                                    child: GestureDetector(
                                      onLongPress:()=>showDialog(
                                        context: context,
                                        builder: (BuildContext context) => AlertDialog(
                                          title:Row(
                                            children: [
                                              Image.asset("images/icons/"+poke+".png",color: typeCheck(poke),
                                                width: MediaQuery.of(context).size.width*0.1,),
                                              SizedBox(
                                                width: 25.0,
                                              ),
                                              Text(poke),
                                            ],
                                          ),
                                        ),
                                      ),
                                      child: Image.asset("images/icons/"+poke+".png",
                                        color: typeCheck(poke),
                                      ),
                                    ),
                                  ),
                                ),
                                ).toList(),
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          alignment:Alignment.topCenter,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.3),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
                                    color: Color(0xffffffff)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.02,bottom:MediaQuery.of(context).size.height*0.14),
                                  child:Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(bottom:10.0),
                                            child: Text("Properties",
                                              style: TextStyle(
                                                  color: Colors.amber,
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      PropertyPoke(propertyLabel: "Height", pokemonProperty: pokemon.height, colour: Colors.blueAccent,maxValue: 360,),
                                      PropertyPoke(propertyLabel: "Weight",pokemonProperty: pokemon.weight, colour: Colors.redAccent,maxValue: 4600),
                                      Visibility(
                                        visible: pokemon.candy == "None"?false:true,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left:20.0,right: 20,bottom: 10),
                                          child: Row(
                                            children: [
                                              ProperTitle(label: "Candy:",),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                pokemon.candy,
                                                style:  TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      pokemon.candyCount != null ? Padding(
                                        padding: const EdgeInsets.only(left:20.0,right: 20,bottom: 10),
                                        child: Row(
                                          children: [
                                            ProperTitle(label: "Candy Count:",),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(pokemon.candyCount.toString(),
                                                style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold
                                                )
                                            ),
                                          ],
                                        ),
                                      ):
                                      Visibility(
                                        visible: false,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left:20.0,right: 20,bottom: 10),
                                          child: Row(
                                            children: [
                                              ProperTitle(label: "Candy Count:",),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text("0",
                                                  style: TextStyle(
                                                      color: Colors.blueGrey,
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold
                                                  )
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:20.0,right: 20,bottom: 10),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                ProperTitle(label: "Weakness:"),
                                                Spacer(),
                                              ],
                                            ),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: pokemon.weaknesses.map((pokeWeak) => Padding(
                                                  padding: const EdgeInsets.only(left:2,top: 8.0),
                                                  child:GestureDetector(
                                                    onLongPress:()=>showDialog(
                                                      context: context,
                                                      builder: (BuildContext context) => AlertDialog(
                                                        title:Row(
                                                          children: [
                                                            Image.asset("images/icons/"+pokeWeak+".png",color: typeCheck(pokeWeak),
                                                              width: MediaQuery.of(context).size.width*0.12,),
                                                            SizedBox(
                                                              width: 25.0,
                                                            ),
                                                            Text(pokeWeak),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    child: Image.asset("images/icons/"+pokeWeak+".png",
                                                      width: MediaQuery.of(context).size.width*0.12,
                                                      color: typeCheck(pokeWeak),
                                                    ),
                                                  ),
                                                ),
                                                ).toList()
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left:8.0,top: 8.0),
                                              child: Row(
                                                children: [
                                                  ProperTitle(label: "Next Evolution:"),
                                                  Spacer(),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: pokemon.nextEvolution != null ? pokemon.nextEvolution
                                                  .map((nextEvo) => Padding(
                                                padding: const EdgeInsets.only(top:8.0, left:8.0),
                                                child: GestureDetector(
                                                  onTap: (){
                                                    print(this.pokemon.name);
                                                    Navigator.push(
                                                      context,
                                                      //Seçtiğimiz pokemonun olduğu ayrıntı ekranına gelir. context ile de hangi pokemonu seçtiğimizi belirlenir.
                                                      MaterialPageRoute(
                                                        //TODO this.pokemon bölümünü düzenle!
                                                        builder: (context) => PokeDetail(pokemon: this.pokemon),
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: colorCheck(pokemon).withOpacity(0.75),
                                                      borderRadius: BorderRadius.circular(10.0),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey.withOpacity(0.5),
                                                          spreadRadius: 5,
                                                          blurRadius: 7,
                                                          offset: Offset(0, 3), // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Center(
                                                      child: Padding(
                                                        padding:EdgeInsets.all(MediaQuery.of(context).size.width*0.035),
                                                        child: Image.network("http://www.serebii.net/pokemongo/pokemon/"+nextEvo.num+".png",fit: BoxFit.fill,),
                                                      ),
                                                      //http://www.serebii.net/pokemongo/pokemon/001.png
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              ).toList():[
                                                Text("This is final form",
                                                  style: TextStyle(
                                                      color: Colors.blueGrey,
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:15.0),
                              child: Container(
                                height: MediaQuery.of(context).size.height*0.3,
                                width:MediaQuery.of(context).size.width*0.5 ,
                                child: Image.network(
                                  pokemon.img,
                                  fit: BoxFit.fill,),
                              ),
                            ),
                          ],
                        ),
                      ]
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
