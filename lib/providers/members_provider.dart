import 'package:flutter/foundation.dart';
import 'package:vibe_ai/models/member.dart';

class MembersProvider with ChangeNotifier {
  List<Member> _members = [];

  List<Member> get members => _members;

  void loadMock() {
    _members = [
      Member(
        id: "1",
        name: "Sarah Johnson",
        role: "Owner",
        online: true,
        lastActive: DateTime.now(),
      ),
      Member(
        id: "2",
        name: "Mike Johnson",
        role: "Admin",
        online: false,
        lastActive: DateTime.now().subtract(Duration(hours: 2)),
      ),
      Member(
        id: "3",
        name: "Emma Johnson",
        role: "Member",
        online: true,
        lastActive: DateTime.now().subtract(Duration(minutes: 5)),
      ),
      Member(
        id: "4",
        name: "Alex Johnson",
        role: "Member",
        online: false,
        lastActive: DateTime.now().subtract(Duration(days: 1)),
      ),
    ];

    notifyListeners(); // Important! updates UI
  }
}
