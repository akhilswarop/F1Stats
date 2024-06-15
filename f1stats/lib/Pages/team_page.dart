import 'package:flutter/material.dart';

class TeamPage extends StatelessWidget {
  TeamPage({required this.teamName});

  final String teamName;

  // Map of team names to their respective logos
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
  final Map<String, List<Map<String, String>>> driverHeadshots = {
    'Mercedes': [
      {
        "driverName": "Lewis Hamilton",
        "driverHeadShot":
        "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/L/LEWHAM01_Lewis_Hamilton/lewham01.png"
      },
      {
        "driverName": "George Russell",
        "driverHeadShot":
        "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/G/GEORUS01_George_Russell/georus01.png"
      }
    ],
    'Ferrari': [
      {
        "driverName": "Charles Leclerc",
        "driverHeadShot":
        "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/C/CHALEC01_Charles_Leclerc/chalec01.png"
      },
      {
        "driverName": "Carlos Sainz",
        "driverHeadShot":
        "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/C/CARSAI01_Carlos_Sainz/carsai01.png"
      }
    ],
    'Red Bull': [
      {
        "driverName": "Max Verstappen",
        "driverHeadShot":
        "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/M/MAXVER01_Max_Verstappen/maxver01.png"
      },
      {
        "driverName": "Sergio Perez",
        "driverHeadShot":
        "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/S/SERPER01_Sergio_Perez/serper01.png"
      }
    ],
    'Alpine F1 Team': [
      {
        "driverName": "Pierre Gasly",
        "driverHeadShot":
        "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/P/PIEGAS01_Pierre_Gasly/piegas01.png"
      },
      {
        "driverName": "Esteban Ocon",
        "driverHeadShot":
        "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/E/ESTOCO01_Esteban_Ocon/estoco01.png"
      }
    ],
    'Haas F1 Team': [
      {
        "driverName": "Nico Hulkenberg",
        "driverHeadShot":
        "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/N/NICHUL01_Nico_Hulkenberg/nichul01.png"
      },
      {
        "driverName": "Kevin Magnussen",
        "driverHeadShot":
        "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/K/KEVMAG01_Kevin_Magnussen/kevmag01.png"
      }
    ],
    'Aston Martin': [
      {
        "driverName": "Fernando Alonso",
        "driverHeadShot":
        "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/F/FERALO01_Fernando_Alonso/feralo01.png"
      },
      {
        "driverName": "Lance Stroll",
        "driverHeadShot":
        "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/L/LANSTR01_Lance_Stroll/lanstr01.png"
      }
    ],
    'RB F1 Team': [
      {
        "driverName": "Yuki Tsunoda",
        "driverHeadShot":
        "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/Y/YUKTSU01_Yuki_Tsunoda/yuktsu01.png"
      },
      {
        "driverName": "Daniel Ricciardo",
        "driverHeadShot":
        "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/D/DANRIC01_Daniel_Ricciardo/danric01.png"
      }
    ],
    'McLaren': [
      {
        "driverName": "Lando Norris",
        "driverHeadShot":
        "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/L/LANNOR01_Lando_Norris/lannor01.png"
      },
      {
        "driverName": "Oscar Piastri",
        "driverHeadShot":
        "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/O/OSCPIA01_Oscar_Piastri/oscpia01.png"
      }
    ],
    'Sauber': [
      {
        "driverName": "Guanyu Zhou",
        "driverHeadShot":
        "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/G/GUAZHO01_Guanyu_Zhou/guazho01.png"
      },
      {
        "driverName": "Valtteri Bottas",
        "driverHeadShot":
        "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/V/VALBOT01_Valtteri_Bottas/valbot01.png"
      }
    ],
    'Williams': [
      {
        "driverName": "Alexander Albon",
        "driverHeadShot":
        "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/A/ALEALB01_Alexander_Albon/alealb01.png"
      },
      {
        "driverName": "Logan Sargeant",
        "driverHeadShot":
        "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/L/LOGSAR01_Logan_Sargeant/logsar01.png"
      }
    ],
  };

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> teamDrivers = driverHeadshots[teamName] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(teamName,
        style: TextStyle(fontFamily: "Formula1"),), // Display team name in the app bar
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Center(
            child: Image.asset(
              teamLogos[teamName]!, // Retrieve the logo path based on teamName
              width: 150,
              height: 150,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(), // Disable GridView's scrolling
                  shrinkWrap: true, // Allow GridView to occupy only as much space as needed
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 0.9, // Adjust this ratio as per your needs
                  ),
                  itemCount: teamDrivers.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            teamDrivers[index]['driverHeadShot']!, // Retrieve driver headshot URL
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 8),
                          Text(
                            teamDrivers[index]['driverName']!, // Retrieve driver name
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Formula1', // Use Formula1 font
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
