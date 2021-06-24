import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/Class/pokemon.dart';
import 'package:pokemon/Components/pokemonList.dart';
import 'package:pokemon/Pages/about_me.dart';
import 'dart:math' as math;
import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
import 'package:http/http.dart'
as http; //Resimleri ve JSON dosyasındaki verileri alabilmek için import etmek zorundayız
import 'dart:convert'; // Convert ile JSOn dosyasondaki veriler ayrıştırıyorz yani belli bir veri çekebilmek için kullanıyoruz

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  var url = Uri.parse('https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');

  //JSON dosyasındaki veriyi kullanabilmek için JSON to Dart bölümünde
  // oluşturduğumuz sınıftan eleman türetiyoruz ki kolay bir şekilde veri çekebilelim
  PokemonWorld pokeWorld;

  //initState dongünün sonsuza dek tekrar etmesini engeller
  // yani verilerde son elemana ulaşıldığında fonksiyon içinde yapılan işlemi durdurur.

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    fetchData();

    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2))..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //url'den aldığımız verileri işlenebilir hale getiriyorz ve onu "pokeWorld" değişkenine aktarıyoruz
  //bu sayede JSON içerisindeki herhangi veriye mesela "name" attributene pokeWorld.name şeklinde kullanabiliriz.
  fetchData() async {
    var res = await http.get(url);
    Map<String, dynamic> decodedJson = jsonDecode(res.body);
    pokeWorld = PokemonWorld.fromJson(decodedJson);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //Uygulama ilk başlatıldığında JSON'dan veriler çekilirken halkasal doldurma barı görünür daha sonra çekilen veriler liste üzerinde sıralı
      //şekilde dizilirler
        body:pokeWorld == null
            ? Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (_, child) {
                    return Transform.rotate(
                      angle: _controller.value * 2 * math.pi,
                      child: child,
                    );
                  },
                  child: Image.asset("images/poke_ball.png"),
                ),
              ],
            ),
          ),
        )
            : PokemonGridView(pokeWorld: pokeWorld),

        floatingActionButton: AnimatedFloatingActionButton(
          //Fab list
            fabButtons: <Widget>[
              Container(
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed:() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => About()),
                    );
                  },
                  tooltip: 'First button',
                  child: Icon(Icons.account_circle,color: Colors.white),
                ),
              ),
              Container(
                child: FloatingActionButton(
                  elevation: 0,
                  heroTag: null,
                  onPressed: () {
                    setState(() {
                      pokeWorld = null;
                      fetchData();
                    });
                  },
                  tooltip: 'Second button',
                  child: Icon(Icons.refresh,color: Colors.white,),
                ),
              )

            ],
            colorStartAnimation: Colors.teal,
            colorEndAnimation: Colors.red,
            animatedIconData: AnimatedIcons.menu_close //To principal button
        ));
  }
}