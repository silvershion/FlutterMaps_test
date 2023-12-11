import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Tabs/tab1.dart';
import 'Tabs/tab2.dart';
import 'Tabs/tab3.dart';
import 'Tabs/tab4.dart';
 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 58, 91, 183)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Pagina Principal'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GoogleMapController mapController;





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps Sample App'),
        backgroundColor: const Color.fromARGB(255, 0, 209, 209),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(      
            child: Mapa() ),
        ]
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
              onMapCreated: onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            );
  }
}


class Enlace extends StatelessWidget {

    final Widget tabPage;
        final Text titulo;

  const Enlace({Key? key, required this.tabPage, required this.titulo}) : super(key: key);

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
