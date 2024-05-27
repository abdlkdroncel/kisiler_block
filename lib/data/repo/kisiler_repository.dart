import 'package:kisiler_block/data/entity/kisiler.dart';

class KisilerRepository{

  Future<void> kaydet(String ad,String tel) async{
    print("Kaydet");
    print(ad);
    print(tel);

  }

  Future<void> guncelle(int id, String ad, String tel) async {
    print("Guncelle");
    print(ad);
    print(tel);
  }

  Future<List<Kisiler>> yukle() async {
    var liste = <Kisiler>[];
    var k1 = Kisiler(kisiId: 1, ad: "Test1", tel: "100");
    var k2 = Kisiler(kisiId: 2, ad: "Test2", tel: "200");
    var k3 = Kisiler(kisiId: 2, ad: "Test3", tel: "300");
    liste.add(k1);
    liste.add(k2);
    liste.add(k3);

    return liste;
  }

  Future<List<Kisiler>> ara(String kelime) async {
    var liste = <Kisiler>[];
    var k1 = Kisiler(kisiId: 1, ad: "Test1", tel: "100");
    liste.add(k1);
    return liste;
  }

  Future<void> sil(int id) async {}


}