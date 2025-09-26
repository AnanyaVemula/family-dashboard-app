import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibe_ai/models/member.dart';
import 'package:vibe_ai/providers/members_provider.dart';

class FamilyDetailScreen extends StatelessWidget {
  final Member tappedMember;

  const FamilyDetailScreen({super.key, required this.tappedMember});

  @override
  Widget build(BuildContext context) {
    final members = Provider.of<MembersProvider>(context).members;

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
      appBar: AppBar(title: Text("${tappedMember.name}'s Family")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Manage your family circle",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
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
            ...recentActivity.map((activity) => Card(
                  margin: EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    title: Text(activity['name']!),
                    subtitle: Text(activity['action']!),
                    trailing: Text(activity['time']!,
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ),
                )),
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
