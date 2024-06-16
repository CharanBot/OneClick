import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    final bool darkMode = brightnessValue == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Store',
            style: TextStyle(color: darkMode ? Colors.white : Colors.black)),
        backgroundColor: darkMode ? Colors.grey[900] : Colors.white,
        iconTheme: IconThemeData(color: darkMode ? Colors.white : Colors.black),
      ),
      body: Center(
        child: Text(
          'This is the Store Screen',
          style: TextStyle(
            fontSize: 20,
            color: darkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

  // List<Service> services = [
  //   Service('Cleaning',
  //       'https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/2x/external-cleaning-labour-day-vitaliy-gorbachev-flat-vitaly-gorbachev.png'),
  //   Service('Plumber',
  //       'https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/2x/external-plumber-labour-day-vitaliy-gorbachev-flat-vitaly-gorbachev.png'),
  //   Service('Electrician',
  //       'https://img.icons8.com/external-wanicon-flat-wanicon/2x/external-multimeter-car-service-wanicon-flat-wanicon.png'),
  //   Service('Painter',
  //       'https://img.icons8.com/external-itim2101-flat-itim2101/2x/external-painter-male-occupation-avatar-itim2101-flat-itim2101.png'),
  //   Service('Carpenter', 'https://img.icons8.com/fluency/2x/drill.png'),
  //   Service('Gardener',
  //       'https://img.icons8.com/external-itim2101-flat-itim2101/2x/external-gardener-male-occupation-avatar-itim2101-flat-itim2101.png'),
  //   Service('Tailor', 'https://img.icons8.com/fluency/2x/sewing-machine.png'),
  //   Service('Maid', 'https://img.icons8.com/color/2x/housekeeper-female.png'),
  //   Service('Driver',
  //       'https://img.icons8.com/external-sbts2018-lineal-color-sbts2018/2x/external-driver-women-profession-sbts2018-lineal-color-sbts2018.png'),
  // ];
