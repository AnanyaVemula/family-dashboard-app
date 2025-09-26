class Member {
  final String id;
  final String name;
  final String role; // Owner, Admin, Member
  final bool online;
  final DateTime lastActive;

  Member({
    required this.id,
    required this.name,
    required this.role,
    required this.online,
    required this.lastActive,
  });
}
