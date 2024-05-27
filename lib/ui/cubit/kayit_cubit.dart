import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_block/data/repo/kisiler_repository.dart';
import 'package:kisiler_block/ui/views/kayit.dart';

class KayitCubit extends Cubit<void>{

  KayitCubit():super(0);

  var krepo=KisilerRepository();

  Future<void> kaydet(String ad,String tel) async{
   await krepo.kaydet(ad, tel);
  }

}