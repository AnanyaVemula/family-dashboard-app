import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  final upcomingTasks = [
    {
      "title": "Doctor appointment",
      "assignedTo": "Emma Johnson",
      "time": "Today 3:00 PM",
      "priority": "high"
    },
    {
      "title": "Pay utility bill",
      "assignedTo": "Mike Johnson",
      "time": "Tomorrow",
      "priority": "medium"
    },
    {
      "title": "Weekly grocery shopping",
      "assignedTo": "Sarah Johnson",
      "time": "Saturday",
      "priority": "low"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upcoming Tasks & Quick Actions")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Upcoming Tasks
            Text("Upcoming Tasks",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            ...upcomingTasks.map((task) => Card(
                  margin: EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    title: Text(task["title"]!),
                    subtitle: Text("Assigned to: ${task['assignedTo']!}"),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(task["time"]!, style: TextStyle(fontSize: 12)),
                        SizedBox(height: 4),
                        Text(
                          task["priority"]!,
                          style: TextStyle(
                            fontSize: 12,
                            color: task["priority"] == "high"
                                ? Colors.red
                                : task["priority"] == "medium"
                                    ? Colors.orange
                                    : Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),

            SizedBox(height: 20),

            // Quick Actions Container
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading
                  Text(
                    "Quick Actions",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),

                  // Subheading
                  Text(
                    "Common family coordination tasks",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 12),

                  // 4 rectangular action boxes stacked vertically
                  _buildActionBox(Icons.alarm, "Create Alarm"),
                  SizedBox(height: 8),
                  _buildActionBox(Icons.attach_money, "Add Expense"),
                  SizedBox(height: 8),
                  _buildActionBox(Icons.upload_file, "Upload Media"),
                  SizedBox(height: 8),
                  _buildActionBox(Icons.message, "Ask AI"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build rectangular action boxes
  Widget _buildActionBox(IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        // Add your action here
      },
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 30, color: Colors.white),
            SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
