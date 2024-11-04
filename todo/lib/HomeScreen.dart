import 'package:flutter/material.dart';
import 'AddScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text('Welcome to Notes'),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/profile_image.png'),
          ),
        ],
        backgroundColor: Colors.blue.shade300,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Have a great Day\nMy Priority Task',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Add your TaskCard widgets here if needed...
            Expanded(
              child: ListView(
                children: [
                  TaskItem(
                      title: 'Complete Assignment #2',
                      date: '13 September 2022',
                      status: 'To Do'),
                  TaskItem(
                      title: 'Submit Fee Challan',
                      date: '18 September 2022',
                      status: 'Done'),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  final String title;
  final String date;
  final String status;

  TaskItem({required this.title, required this.date, required this.status});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(date),
      trailing: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: status == 'Done' ? Colors.green : Colors.orange,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          status,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
