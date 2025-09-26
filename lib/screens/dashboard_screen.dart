import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibe_ai/providers/members_provider.dart';
import 'package:vibe_ai/models/member.dart';
import 'family_detail_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final membersProvider = Provider.of<MembersProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Family Members')),
      body: ListView.builder(
        itemCount: membersProvider.members.length,
        itemBuilder: (context, index) {
          final member = membersProvider.members[index];
          return ListTile(
            title: Text(member.name),
            subtitle: Text(member.role),
            trailing: Icon(
              member.online ? Icons.circle : Icons.circle_outlined,
              color: member.online ? Colors.green : Colors.grey,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FamilyDetailScreen(tappedMember: member),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          membersProvider.loadMock();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
