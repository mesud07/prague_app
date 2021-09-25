import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:prague_app/helper/datahelper.dart';
import 'package:prague_app/services/all_Attractions.dart';
import 'package:prague_app/utils/widgets/appbar.dart';

class AllMap extends StatefulWidget {
  @override
  State<AllMap> createState() => _AllMapState();


}

class _AllMapState extends State<AllMap> {
  Set<Marker> markered = {};

  Set<Marker> _markers = {};


 // var markerr;

  Future<void> getir() async {
;
;

    //SET DÖNDÜREN markersData() fonksiyonundan markered'a aktarıyorum.

    markered=await markersData();

    _markers=markered;
    setState(() {

    });

    print("markered listesinin uzunluğı " + markered.length.toString());
    print("first object of markered : " + markered.first.toString());


  }

  //haritanın görünümü'nü değiştiren değişken
  MapType currentType = MapType.normal;


  static const LatLng _center = const LatLng(46.521563, -122.677433);

  //başlangıç camera pozisyonu
  late CameraPosition _kLake;


  LatLng _lastMapPosition = _center;


  @override
  void initState() {
    // TODO: implement initState
    //markered'a verilerin aktarılmasını sağlıyorum.


    super.initState();
    getir();

    _kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(50.087875102788665, 14.420316950418055),
        tilt: 59.440717697143555,
        zoom: 14.151926040649414);
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: header(context, "attractions"),
      bottomNavigationBar: MyBottomApp(context, "attractions"),
      drawer: NavigationDrawerWidget(),
      body: GoogleMap(
        onCameraMove: _onCameraMove,

        markers: _markers,
        mapType: currentType,
        //ilk kamera konumu
        initialCameraPosition: _kLake,

      ),
      floatingActionButton: Container(

        margin: EdgeInsets.only(right: 60, bottom: 10),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            Container(
              margin: EdgeInsets.all(5),

              child: FloatingActionButton(
                heroTag: "bir",
                onPressed: _changeMap,
                child: Icon(Icons.directions_boat),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: FloatingActionButton(
                heroTag: "iki",
                onPressed: _onAddMarkerButtonPressed,
                child: Icon(Icons.add),
              ),
            )
          ],
        ),
      ),

    );
  }

  Future<void> _changeMap() async {
    setState(() {
      if (currentType == MapType.normal) {
        currentType = MapType.hybrid;
      } else {
        currentType = MapType.normal;
      }
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  //Bu fonksiyon içinde konum atamalarını yapıyorum.
  //_markers'ın uzunluğunu istediğimde 0 dönüyor.Çünkü sayfa oluşturulurken bu fonksiyonu kullanılıyor.
  void _onMapCreated(GoogleMapController controller) {

  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }
}