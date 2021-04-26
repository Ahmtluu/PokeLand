import 'dart:convert'; // Convert ile JSOn dosyasondaki veriler ayrıştırıyorz yani belli bir veri çekebilmek için kullanıyoruz
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //Resimleri ve JSON dosyasındaki verileri alabilmek için import etmek zorundayız
import 'Class/pokemon.dart';
import 'Components/pokemonList.dart';
import 'Pages/about_me.dart';

void main() => runApp(MaterialApp(
  //ThemeData uygulamamızda kullandığımız renklerin, temaların veya fontların saklandığı bölümdür.
  //Eğer karanlık tema kullanmak isterseniz ThemeData.dark() şeklinde değiştirebilirsiniz.
      theme: ThemeData.light(),
      title: "PokeLand",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {


  var url = Uri.parse(
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');

  //JSON dosyasındaki veriyi kullanabilmek için JSON to Dart bölümünde
  // oluşturduğumuz sınıftan eleman türetiyoruz ki kolay bir şekilde veri çekebilelim
  PokemonWorld pokeWorld;

  //initState dongünün sonsuza dek tekrar etmesini engeller
  // yani verilerde son elemana ulaşıldığında fonksiyon içinde yapılan işlemi durdurur.
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  //url'den aldığımız verileri işlenebilir hale getiriyorz ve onu "pokeWorld" değişkenine aktarıyoruz
  //bu sayede JSON içerisindeki herhangi veriye mesela "name" attributene pokeWorld.name şeklinde kullanabiliriz.
  fetchData() async {
    var res = await http.get(url);
    var decodedJson = jsonDecode(res.body);
    pokeWorld = PokemonWorld.fromJson(decodedJson);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      //Uygulama ilk başlatıldığında JSON'dan veriler çekilirken halkasal doldurma barı görünür daha sonra çekilen veriler liste üzerinde sıralı
      //şekilde dizilirler
        body: pokeWorld == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : PokemonGridView(pokeWorld: pokeWorld),
        bottomNavigationBar: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xFF45526C),

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => About()),
                      );
                    },
                    child:  Icon(
                      Icons.person,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  Text(
                      "About Me",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ],
              ),

              //Gesture Detector button olmayan bir widgeta gesture ekleme olanağı sağlar.
              GestureDetector(
                  onTap: () {
                    setState(() {
                      pokeWorld = null;
                      fetchData();
                    });
                  },
                  child: Icon(
                    Icons.refresh,
                    color: Colors.orangeAccent,
                  )),
            ],
          ),
        ));
  }
}


