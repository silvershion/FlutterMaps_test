import 'package:flutter/widgets.dart' show ChangeNotifier ;
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'utils/map_style.dart';

/*Consumer is a widget provided by the provider package that allows you 
to listen to changes in a ChangeNotifier or a similar class 
and rebuild a part of your widget tree when the state of that object changes.
*/
class MainController extends ChangeNotifier {

final Map<MarkerId, Marker> _markers = {};

static const LatLng _center = LatLng(45.521563, -122.677433);

//vuelve map<marker> a set< marker>
Set<Marker> get markers => _markers.values.toSet();

final initialCameraPosition = const CameraPosition(target: _center,
        zoom: 11.0,);


void onMapCreated(GoogleMapController controller)
{
controller.setMapStyle(mapStyle);


}

void onTap(LatLng position) {
  final markerId = MarkerId(_markers.length.toString());
  final marker = Marker(
    markerId: markerId,
    position: position,
  );

  _markers[markerId] = marker; 
  notifyListeners(); 
}

  onMapCreatedCallback(GoogleMapController controller) {}
}
