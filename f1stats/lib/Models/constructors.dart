import 'package:xml/xml.dart' as xml;

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
      constructor: Constructor.fromXml(element.findElements('Constructor').first),
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
