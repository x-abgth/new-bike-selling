import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'dart:convert';

import '../../utils/constants.dart';
import 'package:ktm/models/ktmCenterModel.dart';

class NearestKtm extends StatefulWidget {
  @override
  _NearestKtmState createState() => _NearestKtmState();
}

class _NearestKtmState extends State<NearestKtm> {
  final GlobalKey scaffoldKey = GlobalKey();
  var geoLocator = Geolocator();
  final Map<String, Marker> markers = {};

  BitmapDescriptor mapMarker;
  Position currentPosition;
  GoogleMapController mapController;
  List<CenterData> _data = [];
  List ktmCenters;

  @override
  void initState() {
    super.initState();
    setCustomMarker();
    fetchData().then((value) {
      print("value : $value");
      setState(() {
        _data.addAll(value);
      });
    });
  }

  // fetching  the location data from internet
  Future<List<CenterData>> fetchData() async {
    var response = await http.get(Uri.parse(ktmCenterUrl));
    List<CenterData> datas = [];
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      for (var dataJson in jsonData) {
        datas.add(CenterData.fromJson(dataJson));
      }
    }
    return datas;
  }

  // Loacting current position of the user
  void locatePosition() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        currentPosition = position;
        print("currentPosition = $currentPosition");
        print("position = ${position.latitude}");

        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 11.5,
            ),
          ),
        );
      });
      if (currentPosition == null) {
        Navigator.of(context).pop();
      }
    });
  }

  // Assigning custom marker for the map
  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/geo-icon.png",
    );
  }

  // Assigning markers and setting a map style
  Future<void> _onMapCreated(GoogleMapController mapController) async {
    mapController.setMapStyle(Utils.mapStyle);
    Color callIconColor = kPrimary;
    Color callBgColor = Colors.transparent;
    locatePosition();
    setState(() {
      markers.clear();
      for (var i = 0; i <= _data.length; i++) {
        final xMarker = Marker(
          markerId: MarkerId(_data[i].id),
          icon: mapMarker,
          position: LatLng(double.parse(_data[i].latitude),
              double.parse(_data[i].longitude)),
          infoWindow: InfoWindow(
            title: _data[i].center_name,
            snippet: _data[i].center_address ?? _data[i].center_name,
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.all(15),
                    height: 170,
                    color: kPrimaryDark,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _data[i].center_name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: kPrimary,
                            fontFamily: "Roboto",
                          ),
                        ),
                        SizedBox(height: 5),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  _data[i].center_address ?? "",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Roboto",
                                      color: Colors.white60),
                                ),
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(50),
                                splashColor: Colors.white12,
                                onFocusChange: (e) {
                                  if (e == true) {
                                    setState(() {
                                      callIconColor = kPrimaryDark;
                                      callBgColor = kPrimary;
                                    });
                                  }
                                },
                                onTap: _data[i].contact_number == ""
                                    ? () {
                                        Fluttertoast.showToast(
                                          msg:
                                              "Contact number is not provided by KTM",
                                          toastLength: Toast.LENGTH_LONG,
                                          gravity: ToastGravity.BOTTOM,
                                        );
                                      }
                                    : () async {
                                        String url =
                                            'tel:${_data[i].contact_number}';
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        } else {
                                          throw 'Could not call ${_data[i].contact_number}';
                                        }
                                      },
                                child: Container(
                                  margin: EdgeInsets.only(left: 50),
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: callBgColor,
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                        color: kPrimary,
                                        width: 3,
                                      )),
                                  child: Icon(Icons.call, color: callIconColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        );
        markers[_data[i].center_name] = xMarker;
      }
    });
  }

  callAction(String number) async {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("KTM Map"),
      ),
      body: ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: size.height, maxWidth: size.width),
        child: Container(
          height: size.height,
          child: _data.isEmpty == null
              ? CircularProgressIndicator()
              : GoogleMap(
                  onTap: (_) {},
                  onMapCreated: _onMapCreated,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: false,
                  markers: markers.values.toSet(),
                  initialCameraPosition: CameraPosition(
                    target: currentPosition != null
                        ? LatLng(
                            currentPosition.latitude, currentPosition.longitude)
                        : LatLng(11.636758716737303, 75.64956039090863),
                    zoom: 8.5,
                  ),
                ),
        ),
      ),
    );
  }
}

// Map style code
class Utils {
  static String mapStyle = '''
    [
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ebe3cd"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#523735"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#f5f1e6"
      }
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#c9b2a6"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#dcd2be"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#ae9e90"
      }
    ]
  },
  {
    "featureType": "landscape.natural",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dfd2ae"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dfd2ae"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#93817c"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#a5b076"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#447530"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f5f1e6"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#fdfcf8"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f8c967"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#e9bc62"
      }
    ]
  },
  {
    "featureType": "road.highway.controlled_access",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e98d58"
      }
    ]
  },
  {
    "featureType": "road.highway.controlled_access",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#db8555"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#806b63"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dfd2ae"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#8f7d77"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#ebe3cd"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dfd2ae"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#b9d3c2"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#92998d"
      }
    ]
  }
]
  ''';
}
