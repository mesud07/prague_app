import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
  final double lat,len;
  MapSample(this.lat,this.len);

}

class MapSampleState extends State<MapSample> {
late LatLng konum;



  final Set<Marker> _markers = {};
  MapType currentType=MapType.normal;



  static const LatLng _center = const LatLng(46.521563, -122.677433);
  late CameraPosition _kLake;


  LatLng _lastMapPosition = _center;

@override
  void initState() {
    // TODO: implement initState
    konum=LatLng(widget.lat, widget.len);
    super.initState();

        _kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(widget.lat, widget.len),
        tilt: 59.440717697143555,
        zoom: 14.151926040649414);  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        onCameraMove: _onCameraMove,

        markers: _markers,
        mapType: currentType,
        initialCameraPosition: _kLake,
        onMapCreated:_onMapCreated,

      ),
      floatingActionButton: Container(
        
        margin: EdgeInsets.only(right: 60,bottom: 10),

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
      if(currentType==MapType.normal){
        currentType = MapType.hybrid;

      }else{
        currentType=MapType.normal;
      }

    });
  }
  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }
  void _onMapCreated(GoogleMapController controller){
  setState(() {
    _markers.add(Marker(
      markerId: MarkerId('id-1'),
        position: konum,
    ));
    print("Set içi : "+_markers.toString());
  });
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