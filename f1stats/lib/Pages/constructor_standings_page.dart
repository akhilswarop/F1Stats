import 'dart:ui';
import 'team_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

final Map<String, Color> teamColors = {
  'Mercedes': Color(0xFF6CD3BF),
  'Ferrari': Color(0xFFF91536),
  'Red Bull': Color(0xFF3671C6),
  'Alpine F1 Team': Color(0xFF2293D1),
  'Haas F1 Team': Color(0x77E6002B),
  'Aston Martin': Color(0xFF358C75),
  'RB F1 Team': Color(0xFF5E8FAA),
  'McLaren': Color(0xFFF58020),
  'Sauber': Color(0xFF900000),
  'Williams': Color(0xFF37BEDD),
};

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


class ConstructorStanding {
  final int position;
  final int points;
  final Constructor constructor;

  ConstructorStanding({
    required this.position,
    required this.points,
    required this.constructor,
  });

  factory ConstructorStanding.fromXml(xml.XmlElement element) {
    return ConstructorStanding(
      position: int.parse(element.getAttribute('position') ?? '0'),
      points: int.parse(element.getAttribute('points') ?? '0'),
      constructor:
          Constructor.fromXml(element.findElements('Constructor').first),
    );
  }
}

class Constructor {
  final String constructorId;
  final String name;
  final String nationality;

  Constructor({
    required this.constructorId,
    required this.name,
    required this.nationality,
  });

  factory Constructor.fromXml(xml.XmlElement element) {
    return Constructor(
      constructorId: element.getAttribute('constructorId') ?? '',
      name: element.findElements('Name').first.text,
      nationality: element.findElements('Nationality').first.text,
    );
  }
}

class ConstructorStandingsPage extends StatefulWidget {
  @override
  _ConstructorStandingsPageState createState() =>
      _ConstructorStandingsPageState();
}

class _ConstructorStandingsPageState extends State<ConstructorStandingsPage> {
  final String apiUrl =
      'https://ergast.com/api/f1/current/constructorStandings';

  List<ConstructorStanding> constructorStandings = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final document = xml.XmlDocument.parse(response.body);

        // Extract constructor standings
        final standings =
            document.findAllElements('ConstructorStanding').map((element) {
          return ConstructorStanding.fromXml(element);
        }).toList();

        setState(() {
          constructorStandings = standings;
        });

        print('Constructor Standings: $constructorStandings');
      } else {
        throw Exception('Failed to load XML data');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        itemCount: constructorStandings.length,
        itemBuilder: (context, index) {
          final standing = constructorStandings[index];
          final constructorName = standing.constructor.name;
          final teamColor = teamColors[constructorName] ?? Colors.grey;
          final teamLogo = teamLogos[constructorName];
          return Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: teamColor,
              child: ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => TeamPage(teamName:constructorName)
                  ));
                },
                trailing: SizedBox( width: 40, height:40,child: Image.asset(teamLogo!)),
                title: Text(
                  '${standing.constructor.name}',
                  style: TextStyle(
                    fontFamily: 'Formula1', // Apply F1 font family here
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Position: ${standing.position} | Points: ${standing.points}',
                  style: TextStyle(
                      fontFamily: 'Formula1', // Apply F1 font family here
                      color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
