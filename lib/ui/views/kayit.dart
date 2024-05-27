import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_block/ui/cubit/kayit_cubit.dart';

class Kayit extends StatefulWidget {
  const Kayit({super.key});

  @override
  State<Kayit> createState() => _KayitState();
}

class _KayitState extends State<Kayit> {

  var tfAd=TextEditingController();
  var tfTel=TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kisiler"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfAd,decoration: InputDecoration(hintText: "Kişi Ad"),),
              TextField(controller: tfTel,decoration: InputDecoration(hintText: "Kişi Teş"),),
              ElevatedButton(onPressed: (){
                context.read<KayitCubit>().kaydet(tfAd.text, tfTel.text);
              }, child: Text("Kaydet"))
            ],
          ),
        ),
      ),
    );
  }
}