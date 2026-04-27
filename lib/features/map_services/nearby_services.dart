import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class NearbyServices extends StatefulWidget {
  const NearbyServices({super.key});

  @override
  State<NearbyServices> createState() => _NearbyServicesState();
}

class _NearbyServicesState extends State<NearbyServices> {
  GoogleMapController? _mapController;
  LatLng _currentPosition = const LatLng(25.0, 67.0); // default
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _loadMarkers();
  }

  Future<void> _getCurrentLocation() async {
    final pos = await Geolocator.getCurrentPosition();
    setState(() => _currentPosition = LatLng(pos.latitude, pos.longitude));
    _mapController?.animateCamera(CameraUpdate.newLatLng(_currentPosition));
  }

  void _loadMarkers() {
    _markers.addAll([
      // ❌ 'const' hata diya neeche se
      Marker(
        markerId: const MarkerId('hosp1'),
        position: const LatLng(24.8607, 67.0011),
        infoWindow: const InfoWindow(title: 'Civil Hospital'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
      Marker(
        markerId: const MarkerId('police1'),
        position: const LatLng(24.8918, 67.0241),
        infoWindow: const InfoWindow(title: 'Police Station'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
      Marker(
        markerId: const MarkerId('shelter1'),
        position: const LatLng(24.9056, 67.0822),
        infoWindow: const InfoWindow(title: 'Shelter'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Services'),
        backgroundColor: Colors.green,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: _currentPosition, zoom: 12),
        markers: _markers,
        onMapCreated: (controller) => _mapController = controller,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}