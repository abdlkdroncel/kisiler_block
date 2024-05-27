import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_block/data/entity/kisiler.dart';
import 'package:kisiler_block/data/repo/kisiler_repository.dart';

class AnasayfaCubit extends Cubit<List<Kisiler>>{

  AnasayfaCubit():super(<Kisiler>[]);

  var krepo=KisilerRepository();

  Future<void> yukle() async {
    var liste = await krepo.yukle();
    emit(liste);
  }

  Future<void> ara(String kelime) async {
    var liste = await krepo.ara(kelime);
    emit(liste);
  }

  Future<void> sil(int id) async {
    await krepo.sil(id);
    await yukle();
  }

}