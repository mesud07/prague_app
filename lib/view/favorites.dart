

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prague_app/utils/box_manager.dart';


class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {



  @override
  Widget build(BuildContext context) {
    Box _cagirmakicin=Hive.box("favoriListesi");

    // debugPrint("Uzunluk "+favoriler.length.toString());
    // debugPrint(favoriler[3]);

    return Scaffold(
      appBar: AppBar(title: Text("favoriler"),),
      body: ValueListenableBuilder(
        valueListenable: _cagirmakicin.listenable(),
        builder: (context, Box box, _) {

          return ListView.builder(
            itemCount: _cagirmakicin.length,
            itemBuilder: (context, listIndex) {

              var isim = _cagirmakicin.getAt(listIndex).toString();
              var o_ismin_indexi = _cagirmakicin.keyAt(listIndex);
              return ListTile(
                title: Text(_cagirmakicin.getAt(listIndex).toString()),

                trailing: IconButton(
                    icon: Icon(Icons.favorite,color: Colors.red,),
                    onPressed:(){
                      setState(() {
                        onFavoritePress(isim,box,o_ismin_indexi);
                      });
                    }
                ),
              );
            },
          );
        },
      ),

    );
  }
  Widget getIcon(int index,var a) {
    if (a.containsKey(index)) {
      return Icon(Icons.favorite, color: Colors.red);
    }
    return Icon(Icons.favorite_border);
  }
  void onFavoritePress(var isim,var a,var o_ismin_indexi) {
    // isim = _cagirmakicin.getAt(listIndex).toString();
    // o_ismin_indexi = _cagirmakicin.keyAt(listIndex);
    for(var i in a.values){

      if(isim==i){
        a.delete(o_ismin_indexi);
      }}}

}

