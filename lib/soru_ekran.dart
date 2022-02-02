import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:true_or_false/constants.dart';
import 'package:true_or_false/soru.dart';

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];

  TestVeri test_1 = TestVeri();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF84C192),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  test_1.getSoruMetni(),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Wrap(
            //row'da eklenenlerin arasına boşluk bırakıyor
            spacing: 5,
            //column'da eklenenler arasına boşluk bırakıyor
            runSpacing: 5,
            alignment: WrapAlignment.center,
            children: secimler,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                children: [
                  RaisedButtonTasari(false, Colors.red, Icons.thumb_down),
                  RaisedButtonTasari(true, Colors.green, Icons.thumb_up),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void butonTiklama(bool booldeger) {
    if (test_1.testDurumu() == true) {
      //alertDialog
      showAlertDialog();
    } else {
      setState(() {
        test_1.getSoruYaniti() == booldeger
            ? secimler.add(kDogruIcon)
            : secimler.add(kYanlisIcon);

        test_1.sonrakiSoru();
      });
    }
  }

  Expanded RaisedButtonTasari(deger, Color color, IconData icons) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: RaisedButton(
          onPressed: () {
            butonTiklama(deger);
          },
          padding: const EdgeInsets.all(12),
          textColor: Colors.white,
          color: color,
          child: Icon(icons),
        ),
      ),
    );
  }

  void showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Test Bitti!"),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();

                setState(() {
                  test_1.testiSifirla();
                  secimler = [];
                });
              },
              child: Text("Tekrar"),
            ),
          ],
        );
      },
    );
  }
}
