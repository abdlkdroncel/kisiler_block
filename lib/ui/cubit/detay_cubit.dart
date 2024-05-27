import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_block/data/repo/kisiler_repository.dart';
import 'package:kisiler_block/ui/views/detay.dart';

class DetayCubit extends Cubit<void>{


  DetayCubit():super(0);

  var krepo=KisilerRepository();

  Future<void> guncelle(int id, String ad, String tel) async{
    await krepo.guncelle(id,ad, tel);
  }
}