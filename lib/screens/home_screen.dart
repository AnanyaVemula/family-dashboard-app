import 'package:flutter/material.dart';
import 'package:vibe_ai/screens/family_members_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome back, Sarah Johnson")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Here's what's happening with The Johnson Family",
                style: TextStyle(fontSize: 16)),

            SizedBox(height: 20),
            // Family Members Card
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => FamilyMembersScreen()),
                );
              },
              child: Card(
                child: ListTile(
                  title: Text("Family Members"),
                  subtitle: Text("4 | 2 online now"),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
            ),

            SizedBox(height: 10),
            // Active Alarms Card
            Card(
              child: ListTile(
                title: Text("Active Alarms"),
                subtitle: Text("8 | 3 scheduled today"),
              ),
            ),

            SizedBox(height: 10),
            // Shared Items Card
            Card(
              child: ListTile(
                title: Text("Shared Items"),
                subtitle: Text("0 | 24 passwords & docs"),
              ),
            ),

            SizedBox(height: 10),
            // Monthly Expenses Card
            Card(
              child: ListTile(
                title: Text("Monthly Expenses"),
                subtitle: Text("\$2,340 | +8% from last month"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
