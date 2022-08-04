import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _userLocation;

  Future<void> _getUserLocation() async {
    Location location = Location();

    // Check if location service is enable
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    // Check if permission is granted
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    final _locationData = await location.getLocation();
    setState(() {
      _userLocation = _locationData;
      _lastMapPosition = LatLng(_locationData.latitude! ,_locationData.longitude!);
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        icon: BitmapDescriptor.defaultMarker,
      ));
      showMap = true;
    });
  }


  @override
  void initState() {
    _getUserLocation();
    super.initState();
  }

  final Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> _markers = {};

  late LatLng _lastMapPosition ;

  MapType _currentMapType = MapType.normal;

  bool showMap = false;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        // infoWindow: const InfoWindow(
        //   title: 'Really cool place',
        //   snippet: '5 Star Rating',
        // ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: showMap != true? Center(
          child: CircularProgressIndicator(),
        ): SafeArea(
          child: Stack(
            children: <Widget>[
              GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(_userLocation.latitude! , _userLocation.longitude!),
                  zoom: 15.0,
                ),
                mapType: _currentMapType,
                markers: _markers,
                onCameraMove: _onCameraMove,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    children: <Widget> [
                      FloatingActionButton(
                        onPressed: _onMapTypeButtonPressed,
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        backgroundColor: Colors.green,
                        child: const Icon(Icons.map, size: 36.0),
                      ),
                      SizedBox(height: 16.0),
                      FloatingActionButton(
                        onPressed: _onAddMarkerButtonPressed,
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        backgroundColor: Colors.green,
                        child: const Icon(Icons.add_location, size: 36.0),
                      ),
                    ],
                  ),
                ),
              ),
              
              Padding(padding: const EdgeInsets.all(8.0),
                
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget> [
                      
                      SizedBox(
                         width: 150 ,
                        child: ElevatedButton(
                          onPressed: (){
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            )),
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                            padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
                          ),
                          child: Text("Add location"),),
                      ) ,

                     SizedBox(
                       width: 150,
                       child: ElevatedButton(onPressed: (){

                        },
                         style: ButtonStyle(
                             shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                                 borderRadius: BorderRadius.all(Radius.circular(10))
                             )),
                             padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
                             backgroundColor: MaterialStateProperty.all(Colors.green)
                         ),
                          child: Text("End destination"),),
                     ) ,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}