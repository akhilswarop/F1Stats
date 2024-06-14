import 'package:xml/xml.dart' as xml;

class DriverStanding {
  final int position;
  final int points;
  final int wins;
  final Driver driver;

  DriverStanding({
    required this.position,
    required this.points,
    required this.wins,
    required this.driver,
  });

  factory DriverStanding.fromXml(xml.XmlElement element) {
    return DriverStanding(
      position: int.parse(element.getAttribute('position') ?? '0'),
      points: int.parse(element.getAttribute('points') ?? '0'),
      wins: int.parse(element.getAttribute('wins') ?? '0'),
      driver: Driver.fromXml(element.findElements('Driver').first),
    );
  }
}

class Driver {
  final String driverId;
  final String givenName;
  final String familyName;
  final String nationality;

  Driver({
    required this.driverId,
    required this.givenName,
    required this.familyName,
    required this.nationality,
  });

  factory Driver.fromXml(xml.XmlElement element) {
    return Driver(
      driverId: element.getAttribute('driverId') ?? '',
      givenName: element.findElements('GivenName').first.text,
      familyName: element.findElements('FamilyName').first.text,
      nationality: element.findElements('Nationality').first.text,
    );
  }
}
