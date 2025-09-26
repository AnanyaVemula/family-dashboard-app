import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibe_ai/models/member.dart';
import 'package:vibe_ai/providers/members_provider.dart';
import 'package:vibe_ai/screens/tasks_screen.dart'; // import the TasksScreen

class FamilyMembersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final membersProvider = Provider.of<MembersProvider>(context);
    final members = membersProvider.members;

    final recentActivity = [
      {
        "name": "Mike Johnson",
        "action": "created alarm 'Family Dinner'",
        "time": "10 minutes ago"
      },
      {
        "name": "Emma Johnson",
        "action": "uploaded 3 photos to 'Summer Vacation'",
        "time": "1 hour ago"
      },
      {
        "name": "Alex Johnson",
        "action": "completed task 'Take out trash'",
        "time": "2 hours ago"
      },
      {
        "name": "Sarah Johnson",
        "action": "added expense '\$45.50 - Groceries'",
        "time": "3 hours ago"
      },
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Family Members")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text("Manage your family circle",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),

            // Family members list
            ...members.map((member) => Card(
                  margin: EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    leading: CircleAvatar(
                        child: Text(member.name.substring(0, 2).toUpperCase())),
                    title: Text(member.name),
                    subtitle: Text(member.role),
                    trailing: Text(_formatLastActive(member.lastActive),
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ),
                )),

            SizedBox(height: 20),
            Text("Recent Activity",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),

            // Recent activity list
            ...recentActivity.map((activity) => Card(
                  margin: EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    title: Text(activity['name']!),
                    subtitle: Text(activity['action']!),
                    trailing: Text(activity['time']!,
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ),
                )),

            SizedBox(height: 20),
            // Button to navigate to TasksScreen
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => TasksScreen()),
                  );
                },
                child: Text("View Upcoming Tasks"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatLastActive(DateTime dt) {
    final now = DateTime.now();
    final diff = now.difference(dt);
    if (diff.inMinutes < 60) return "${diff.inMinutes} minutes ago";
    if (diff.inHours < 24) return "${diff.inHours} hours ago";
    return "${diff.inDays} days ago";
  }
}
