import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _hodNameController = TextEditingController();
  final TextEditingController _purposeController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _showConfirmationDialog(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text('Booking Confirmed',
                style: TextStyle(fontWeight: FontWeight.bold)),
            content: Text('Your booking has been confirmed successfully!'),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Seminar Hall"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Icon(Icons.event, size: 80, color: Colors.deepPurple),
                      SizedBox(height: 10),
                      Text(
                        "Book Your Slot",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),

                // Name Field
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? "Enter your name" : null,
                ),
                SizedBox(height: 20),

                // Department Field
                TextFormField(
                  controller: _departmentController,
                  decoration: InputDecoration(
                    labelText: "Department",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? "Enter your department"
                      : null,
                ),
                SizedBox(height: 20),

                // Branch Field
                TextFormField(
                  controller: _branchController,
                  decoration: InputDecoration(
                    labelText: "Branch",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? "Enter your branch"
                      : null,
                ),
                SizedBox(height: 20),

                // HOD Name Field
                TextFormField(
                  controller: _hodNameController,
                  decoration: InputDecoration(
                    labelText: "HOD Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? "Enter HOD's name"
                      : null,
                ),
                SizedBox(height: 20),

                // Purpose Field
                TextFormField(
                  controller: _purposeController,
                  decoration: InputDecoration(
                    labelText: "Purpose of Booking",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? "Enter the purpose of booking"
                      : null,
                  maxLines: 3,
                ),
                SizedBox(height: 30),

                // Select Date Card
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    title: Text(
                      "Select Date",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text(
                      selectedDate != null
                          ? DateFormat.yMMMd().format(selectedDate!)
                          : "No date selected",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                      ),
                      onPressed: () => _selectDate(context),
                      child: Text("Choose"),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Select Time Card
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    title: Text(
                      "Select Time",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text(
                      selectedTime != null
                          ? selectedTime!.format(context)
                          : "No time selected",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                      ),
                      onPressed: () => _selectTime(context),
                      child: Text("Choose"),
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // Confirm Booking Button
                Center(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: (selectedDate != null &&
                            selectedTime != null &&
                            _formKey.currentState?.validate() == true)
                        ? () {
                            _showConfirmationDialog(context);
                          }
                        : null,
                    icon: Icon(Icons.check_circle, color: Colors.white),
                    label: Text(
                      "Confirm Booking",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}











































// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class BookingPage extends StatefulWidget {
//   final Function(String, String) onBookingConfirmed; // Callback function

//   BookingPage({required this.onBookingConfirmed});

//   @override
//   _BookingPageState createState() => _BookingPageState();
// }

// class _BookingPageState extends State<BookingPage> {
//   DateTime? selectedDate;
//   TimeOfDay? selectedTime;

//   _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2030),
//     );
//     if (picked != null) {
//       setState(() {
//         selectedDate = picked;
//       });
//     }
//   }

//   _selectTime(BuildContext context) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     if (picked != null) {
//       setState(() {
//         selectedTime = picked;
//       });
//     }
//   }

//   void _showConfirmationDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           title: Text('Booking Confirmed',
//               style: TextStyle(fontWeight: FontWeight.bold)),
//           content: Text('Your booking has been confirmed successfully!'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//                 // Pass booking data to the admin dashboard
//                 widget.onBookingConfirmed(
//                   "Seminar Hall 1", 
//                   "${selectedDate?.toLocal()} at ${selectedTime?.format(context)}"
//                 );
//                 Navigator.pop(context); // Go back to the dashboard
//               },
//               child: Text('OK', style: TextStyle(color: Theme.of(context).primaryColor)),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Book Seminar Hall"),
//         centerTitle: true,
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Column(
//                 children: [
//                   Icon(Icons.event, size: 80, color: Colors.deepPurple),
//                   SizedBox(height: 10),
//                   Text(
//                     "Book Your Slot",
//                     style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 30),

//             // Select Date Card
//             Card(
//               elevation: 5,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10)),
//               child: ListTile(
//                 contentPadding: EdgeInsets.all(16),
//                 title: Text(
//                   "Select Date",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 subtitle: Text(
//                   selectedDate != null
//                       ? DateFormat.yMMMd().format(selectedDate!)
//                       : "No date selected",
//                   style: TextStyle(color: Colors.grey[700]),
//                 ),
//                 trailing: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromARGB(255, 6, 6, 6),
//                   ),
//                   onPressed: () => _selectDate(context),
//                   child: Text("Choose"),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),

//             // Select Time Card
//             Card(
//               elevation: 5,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10)),
//               child: ListTile(
//                 contentPadding: EdgeInsets.all(16),
//                 title: Text(
//                   "Select Time",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 subtitle: Text(
//                   selectedTime != null
//                       ? selectedTime!.format(context)
//                       : "No time selected",
//                   style: TextStyle(color: Colors.grey[700]),
//                 ),
//                 trailing: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromARGB(255, 15, 15, 15),
//                   ),
//                   onPressed: () => _selectTime(context),
//                   child: Text("Choose"),
//                 ),
//               ),
//             ),
//             SizedBox(height: 30),

//             // Confirm Booking Button
//             Center(
//               child: ElevatedButton.icon(
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                   backgroundColor: Colors.deepPurple,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                 ),
//                 onPressed: (selectedDate != null && selectedTime != null)
//                     ? () {
//                         _showConfirmationDialog(context);
//                       }
//                     : null,
//                 icon: Icon(Icons.check_circle, color: Colors.white),
//                 label: Text(
//                   "Confirm Booking",
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//               ),
//             ),

//             SizedBox(height: 20),

//             // Back to Home Button
//             Center(
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 20, 20, 20),
//                   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                 ),
//                 onPressed: () {
//                   Navigator.pop(context); // Go back to the Home Page
//                 },
//                 child: Text(
//                   "Back to Home",
//                   style: TextStyle(color: Colors.white, fontSize: 16),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
