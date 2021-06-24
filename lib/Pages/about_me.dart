import 'package:flutter/material.dart';
class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("About Me",style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:50.0),
              child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 75,
                  backgroundImage: AssetImage('images/profile_img.png')),
            ),
            Divider(
              height: 10,
              color: Colors.black12,
              thickness: 3.0,
              indent: MediaQuery.of(context).size.width * 0.05,
              endIndent: MediaQuery.of(context).size.width * 0.05,
            ),


            ProfileCard("Mobil Programlama", Icons.book),//Sadece label ve Icon'u seçerek aynı card widgetini kullanmamıza olanak sağlandı.
            ProfileCard("183301099", Icons.adb),
            ProfileCard("Ahmet Mutlu", Icons.account_box_outlined),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Text("Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen "
                      "3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 183301099 numaralı Öğrenci Ahmet Mutlu "
                      "tarafından 30 Nisan 2021 günü yapılmıştır.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


//Daha kolay card ekleyebilmek için widgeti ayırdık
// bu ayırma işlemi bize daha dinamik bir widget oluşturma konusunda yardımcı oldu.
class ProfileCard extends StatelessWidget {

  final String label;
  final IconData icon;


  ProfileCard(this.label, this.icon);

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
