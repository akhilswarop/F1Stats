import 'package:flutter/material.dart';

class TeamPage extends StatelessWidget {
  TeamPage({required this.teamName});
  final String teamName;
  final Map<String, String> teamLogos = {
    'Mercedes': "assets/logos/Mercedes.png",
    'Ferrari': "assets/logos/Ferrari.png",
    'Red Bull': "assets/logos/RedBull.png",
    'Alpine F1 Team': "assets/logos/AlpineF1.png",
    'Haas F1 Team': "assets/logos/Haas.png",
    'Aston Martin': "assets/logos/Aston Martin.png",
    'RB F1 Team': "assets/logos/VCarb.png",
    'McLaren': "assets/logos/McLaren.png",
    'Sauber': "assets/logos/Sauber.png",
    'Williams': "assets/logos/Williams.png",
  };

  // Map of team names to driver headshot URLs
  final Map<String, List<String>> driverHeadshots = {
    'Mercedes': [
      "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/L/LEWHAM01_Lewis_Hamilton/lewham01.png",
      "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/G/GEORUS01_George_Russell/georus01.png",
    ],
    'Ferrari': [
      "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/C/CHALEC01_Charles_Leclerc/chalec01.png",
      "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/C/CARSAI01_Carlos_Sainz/carsai01.png",
    ],
    'Red Bull': [
      "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/M/MAXVER01_Max_Verstappen/maxver01.png",
      "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/S/SERPER01_Sergio_Perez/serper01.png",
    ],
    'Alpine F1 Team': [
      "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/P/PIEGAS01_Pierre_Gasly/piegas01.png",
      "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/E/ESTOCO01_Esteban_Ocon/estoco01.png",
    ],
    'Haas F1 Team': [
      "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/N/NICHUL01_Nico_Hulkenberg/nichul01.png",
      "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/K/KEVMAG01_Kevin_Magnussen/kevmag01.png",
    ],
    'Aston Martin': [
      'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/F/FERALO01_Fernando_Alonso/feralo01.png',
      'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/L/LANSTR01_Lance_Stroll/lanstr01.png',
    ],
    'RB F1 Team': [
      "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/Y/YUKTSU01_Yuki_Tsunoda/yuktsu01.png",
      "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/D/DANRIC01_Daniel_Ricciardo/danric01.png", // Replace with actual URL if available
    ],
    'McLaren': [
      'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/L/LANNOR01_Lando_Norris/lannor01.png',
      'https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/O/OSCPIA01_Oscar_Piastri/oscpia01.png',
    ],
    'Sauber': [
      "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/G/GUAZHO01_Guanyu_Zhou/guazho01.png",
      "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/V/VALBOT01_Valtteri_Bottas/valbot01.png",
    ],
    'Williams': [
      "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/A/ALEALB01_Alexander_Albon/alealb01.png",
      "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/L/LOGSAR01_Logan_Sargeant/logsar01.png",
    ],
  };



  @override
  Widget build(BuildContext context) {
    List<String> teamDriverHeadshots = driverHeadshots[teamName] ?? [];

    return Center(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),  // Add padding to the top
            Center(
              child: Text(
                teamName,
                style: TextStyle(
                  fontFamily: 'Formula1', // Make sure this font is defined in your pubspec.yaml
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              teamLogos[teamName]!, // Replace with actual team logo path
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Team Drivers',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Formula1"
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                        childAspectRatio: 1.0, // You can adjust this aspect ratio as needed
                      ),
                      itemCount: teamDriverHeadshots.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(8.0), // Adjust padding as needed
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Image.network(
                                  teamDriverHeadshots[index],
                                  width: 150, // Adjust width as needed
                                  height: 150, // Adjust height as needed
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 8), // Adjust spacing between image and text
                              // Text(
                              //   'Lewis Hamilton', // Replace with actual driver name
                              //   textAlign: TextAlign.center,
                              //   style: TextStyle(
                              //     fontFamily: "Formula1",
                              //     fontSize: 16,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
