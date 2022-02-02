import 'package:flutter/material.dart';

class Soru {
  late String soruMetni;
  late bool soruYaniti;

  Soru({required this.soruMetni, required this.soruYaniti});
}

class TestVeri {
  int _soruIndex = 0;

  //"_" ile listeyi private yaptık
  final List<Soru> _soruBankasi = [
    Soru(soruMetni: "Titanic en büyük gemidir", soruYaniti: false),
    Soru(
        soruMetni: "Dünyadaki tavuk sayısı insan sayısından fazladır",
        soruYaniti: true),
    Soru(soruMetni: "Kelebeklerin ömrü bir gündür", soruYaniti: false),
    Soru(soruMetni: "Dünya düzdür", soruYaniti: false),
    Soru(soruMetni: "Kaju fıstığı bir meyvenin sapıdır", soruYaniti: true),
    Soru(
        soruMetni: "Fatih Sultan Mehmet hiç patates yememiştir",
        soruYaniti: true),
  ];

  //diğer sınıflardan ulaşabileceğimiz methodları tanımlıyoruz
  String getSoruMetni() {
    return _soruBankasi[_soruIndex].soruMetni;
  }

  bool getSoruYaniti() {
    return _soruBankasi[_soruIndex].soruYaniti;
  }

  //Soru indexini artıran method
  void sonrakiSoru() {
    if (_soruIndex < _soruBankasi.length - 1) {
      _soruIndex++;
    }
  }

  //Testin bitip bitmediğini kontrol eden durum
  bool testDurumu() {
    if (_soruIndex >= _soruBankasi.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  //soruindexi sıfırlayan fonksiyon
  void testiSifirla(){
    _soruIndex = 0;
  }

}
