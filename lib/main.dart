import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'map with markers',
      home: Scaffold(
        appBar: new AppBar(
          title: new Text("map with markers"),
        ),
        body: Stack(
          children: <Widget>[
            new FlutterMap(
              options: new MapOptions(
                minZoom: 10.0,
                center: new LatLng(40.71, -74.0),
                onLongPress: (point) => detecte(point),
              ),
              layers: [
                new TileLayerOptions(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c']),
                new MarkerLayerOptions(markers: [
                  new Marker(
                    width: 45.0,
                    height: 45.0,
                    point: new LatLng(40.71, -74.0),
                    builder: (context) => new Container(
                      child: IconButton(
                        icon: Icon(Icons.home),
                      ),
                    ),
                  )
                ])
              ],
            )
          ],
        ),
      ),
    ));
detecte(point) {
  print("la position est: " +
      point.latitude.toString() +
      " " +
      point.longitude.toString());
}