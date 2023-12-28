import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Marcador extends ChangeNotifier {
  final LatLng position;
  final String title;  

  Marcador({required this.position, required this.title});


  
}
