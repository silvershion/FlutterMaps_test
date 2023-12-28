import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_app/main_controller.dart';
import 'package:provider/provider.dart';
import 'Tabs/tab1.dart';
import 'Tabs/tab2.dart';
import 'Tabs/tab3.dart';
import 'Tabs/tab4.dart';

void main() {    
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 58, 91, 183)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});  


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainController>(
  create: (BuildContext context) => MainController(),
  child: Scaffold(
       appBar: AppBar(
  title: const Text('Maps Sample App'),
  backgroundColor: const Color.fromARGB(255, 0, 209, 209),
),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(      
              child: Mapa2(),  
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: const [
              Enlace(tabPage: Tab1(), titulo: Text(" Tab numero uno ")),
              Enlace(tabPage: Tab2(), titulo: Text(" Tab segundo ")),
              Enlace(tabPage: Tab3(), titulo: Text(" Tab 3 ")),
              Enlace(tabPage: Tab4(), titulo: Text(" Tab para testeo ")),
            ],
          ),
        ),
      ),
    );
  }
}



class Mapa extends StatelessWidget {
  const Mapa({super.key});
  static const LatLng _center = LatLng(45.521563, -122.677433);
  @override
  Widget build(BuildContext context) {

  void onMapCreated(GoogleMapController controller) {    
  }
    return GoogleMap(
      myLocationButtonEnabled: true,
      zoomControlsEnabled: true,
      onTap: (position){
                  if (kDebugMode) {
                    print("Coordenadas on Tap $position");
                  }
                },
      mapType: MapType.normal,
              onMapCreated: onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: _center,
                zoom: 11.0,
                
              ),//camera position fijo
            );
  }
}

class Mapa2 extends StatefulWidget {
  const Mapa2({super.key});

  @override
  State<Mapa2> createState() => _Mapa2();
}

class _Mapa2 extends State<Mapa2> {
  @override
  Widget build(BuildContext context) {
    //aqui va el consumer
    return Consumer<MainController>(
      builder: (context, controller, child) {
        return GoogleMap(
          myLocationButtonEnabled: true,
          zoomControlsEnabled: true,
          onTap: controller.onTap,
          mapType: MapType.normal,
          markers: controller.markers,
          onMapCreated: controller.onMapCreated,
          initialCameraPosition: controller.initialCameraPosition,
        );
      },
    );
  }
}

class Enlace extends StatelessWidget {

    final Widget tabPage;
        final Text titulo;

  const Enlace({super.key, required this.tabPage, required this.titulo});

  @override
  Widget build(BuildContext context) {
  return ListTile(
      title: titulo,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => tabPage),
        );
      },
      
    );
  }
}

///////////////// WIP
///
