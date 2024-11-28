import 'package:flutter/material.dart';

class AdminDashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Dashboard"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              BookingCard(
                bookingTitle: "Booking 1",
                bookingDetails: "Seminar Hall 1 - Date: Oct 20, 2024",
              ),
              SizedBox(height: 20),
              BookingCard(
                bookingTitle: "Booking 2",
                bookingDetails: "Seminar Hall 2 - Date: Oct 21, 2024",
              ),
              SizedBox(height: 20),
              BookingCard(
                bookingTitle: "Booking 2",
                bookingDetails: "Seminar Hall 2 - Date: Oct 21, 2024",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  final String bookingTitle;
  final String bookingDetails;

  BookingCard({
    required this.bookingTitle,
    required this.bookingDetails,
  });

  // Show confirmation dialog dynamically
  void _showConfirmationDialog(BuildContext context, String action) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text('$action Booking',
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text('Are you sure you want to $action this booking?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showSuccessDialog(context, action);
              },
              child: Text('Yes', style: TextStyle(color: Colors.green)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  // Show success dialog after action
  void _showSuccessDialog(BuildContext context, String action) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text('$action Confirmed',
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text('The booking has been $action successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK',
                  style: TextStyle(color: Theme.of(context).primaryColor)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Booking Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookingTitle,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    bookingDetails,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),

            // Action Buttons
            Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    _showConfirmationDialog(context, 'Approve');
                  },
                  icon: Icon(Icons.check, color: Colors.white),
                  label: Text("Approve"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    _showConfirmationDialog(context, 'Reject');
                  },
                  icon: Icon(Icons.cancel, color: Colors.white),
                  label: Text("Reject"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
