import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'constructor_standings_page.dart';
import 'driver_standings_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to F1 Stats',
              style: TextStyle(fontFamily: 'Formula1', fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to constructor standings page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConstructorStandingsPage()),
                );
              },
              child: Text('Constructor Standings'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red, // Button color
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                textStyle: TextStyle(fontFamily: 'Formula1', fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to driver standings page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DriversStandingsPage()),
                );
              },
              child: Text('Driver Standings'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red, // Button color
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                textStyle: TextStyle(fontFamily: 'Formula1', fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
