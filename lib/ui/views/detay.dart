import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_block/data/entity/kisiler.dart';
import 'package:kisiler_block/ui/cubit/detay_cubit.dart';

class Detay extends StatefulWidget {
  Kisiler kisiler;

  Detay(this.kisiler);

  @override
  State<Detay> createState() => _DetayState();
}

class _DetayState extends State<Detay> {
  var tfAd = TextEditingController();
  var tfTel = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var kisi = widget.kisiler;
    tfAd.text = kisi.ad;
    tfTel.text = kisi.tel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kisiler"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfAd,
                decoration: InputDecoration(hintText: "Kişi Ad"),
              ),
              TextField(
                controller: tfTel,
                decoration: InputDecoration(hintText: "Kişi Teş"),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<DetayCubit>().guncelle(widget.kisiler.kisiId, tfAd.text, tfTel.text);
                  },
                  child: Text("Güncelle"))
            ],
          ),
        ),
      ),
    );
  }
}
