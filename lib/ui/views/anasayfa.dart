import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_block/data/entity/kisiler.dart';
import 'package:kisiler_block/ui/cubit/anasayfa_cubit.dart';
import 'package:kisiler_block/ui/views/detay.dart';
import 'package:kisiler_block/ui/views/kayit.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool arama = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AnasayfaCubit>().yukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: arama
            ? TextField(
                decoration: InputDecoration(hintText: "Ara"),
                onChanged: (value) {
                  context.read<AnasayfaCubit>().ara(value);
                },
              )
            : Text("Kisiler"),
        actions: [
          arama
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      arama = false;
                    });
                    context.read<AnasayfaCubit>().yukle();
                  },
                  icon: Icon(Icons.clear))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      arama = true;
                    });
                  },
                  icon: Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<AnasayfaCubit,List<Kisiler>>(
        builder: (context, kisiler) {
          if (kisiler.isNotEmpty) {
            return ListView.builder(
              itemCount: kisiler!.length,
              itemBuilder: (context, index) {
                var kisi = kisiler[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Detay(kisi),
                        )).then((value) => {});
                  },
                  child: Card(
                    child: SizedBox(
                      height: 80,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  kisi.ad,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(kisi.tel),
                              ],
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("${kisi.ad} Silinsin mi?"),
                                    action: SnackBarAction(
                                      label: "Evet",
                                      onPressed: () {
                                        setState(() {
                                          context.read<AnasayfaCubit>().sil(kisi.kisiId);
                                        });
                                      },
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(Icons.clear))
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Kayit(),
              )).then((value) => {print("Anasayfaya donuldu")});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
