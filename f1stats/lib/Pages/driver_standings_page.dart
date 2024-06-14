import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import '../Models/drivers.dart';

class DriversStandingsPage extends StatefulWidget {
  @override
  _DriversStandingsPageState createState() => _DriversStandingsPageState();
}

class _DriversStandingsPageState extends State<DriversStandingsPage> {
  final String apiUrl = 'https://ergast.com/api/f1/current/driverStandings';

  List<DriverStanding> driverStandings = [];

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

        // Extract driver standings
        final standings = document.findAllElements('DriverStanding').map((element) {
          return DriverStanding.fromXml(element);
        }).toList();

        setState(() {
          driverStandings = standings;
        });

        print('Driver Standings: $driverStandings');
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
      appBar: AppBar(
        title: Text('Driver Standings'),
      ),
      body: ListView.builder(
        itemCount: driverStandings.length,
        itemBuilder: (context, index) {
          final standing = driverStandings[index];
          return ListTile(
            title: Text(
              '${standing.driver.givenName} ${standing.driver.familyName}',
              style: TextStyle(
                fontFamily: 'Formula1', // Apply F1 font family here
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Position: ${standing.position} | Points: ${standing.points} | Wins: ${standing.wins}',
              style: TextStyle(
                fontFamily: 'Formula1', // Apply F1 font family here
                fontSize: 16,
              ),
            ),
          );
        },
      ),
    );
  }
}
