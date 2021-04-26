import 'package:flutter/material.dart';
class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Padding(
              padding: const EdgeInsets.only(bottom:10.0),
              child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 100,
                  backgroundImage: AssetImage('images/profile_img.png')),
            ),
            Divider(
              height: 10,
              color: Colors.black12,
              thickness: 3.0,
              indent: MediaQuery.of(context).size.width * 0.05,
              endIndent: MediaQuery.of(context).size.width * 0.05,
            ),


            profile_card("Mobil Programlama", Icons.book),//Sadece label ve Icon'u seçerek aynı card widgetini kullanmamıza olanak sağlandı.
            profile_card("183301099", Icons.adb),
            profile_card("Ahmet Mutlu", Icons.account_box_outlined),
            Container(
              width:300.0,
              height: 150,
              child: Text("Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen "
                  "3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 183301099 numaralı Öğrenci Ahmet Mutlu "
                  "tarafından 30 Nisan 2021 günü yapılmıştır.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16
              ),),
            )
          ],
        ),
      ),
    );
  }
}


//Daha kolay card ekleyebilmek için widgeti ayırdık
// bu ayırma işlemi bize daha dinamik bir widget oluşturma konusunda yardımcı oldu.
class profile_card extends StatelessWidget {

  String label;
  IconData icon;


  profile_card(String lbl, IconData iconData){
   label= lbl;
   icon= iconData;

  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Color(0xFF45526C),
        child: ListTile(
          leading: Icon(
              icon,
            color: Colors.orangeAccent,
          ),
          title: Text(label,style: TextStyle(color: Colors.white,fontSize: 18),),

        ),
      ),
    );
  }
}
