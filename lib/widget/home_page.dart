import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Available Seminar Halls",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // Seminar Hall 1
              SeminarHallCard(
                hallName: "Seminar Hall 1",
                capacity: 50,
                description:
                    "A medium-sized seminar hall perfect for workshops and small gatherings.",
                image: "assets/images/venue.jpeg",
                onBookPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/booking',
                    arguments: {
                      'hallName': "Seminar Hall 1",
                      'capacity': 50,
                      'description':
                          "A medium-sized seminar hall perfect for workshops and small gatherings.",
                    },
                  );
                },
              ),
              SizedBox(height: 20),

              // Seminar Hall 1
              SeminarHallCard(
                hallName: "Seminar Hall 1",
                capacity: 50,
                description:
                    "A medium-sized seminar hall perfect for workshops and small gatherings.",
                image: "assets/images/venue.jpeg",
                onBookPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/booking',
                    arguments: {
                      'hallName': "Seminar Hall 1",
                      'capacity': 50,
                      'description':
                          "A medium-sized seminar hall perfect for workshops and small gatherings.",
                    },
                  );
                },
              ),
              SizedBox(height: 20),

              // Seminar Hall 2
              SeminarHallCard(
                hallName: "Seminar Hall 2",
                capacity: 100,
                description:
                    "A spacious seminar hall equipped with modern facilities for conferences.",
                image: "assets/images/venue.jpeg",
                onBookPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/booking',
                    arguments: {
                      'hallName': "Seminar Hall 2",
                      'capacity': 100,
                      'description':
                          "A spacious seminar hall equipped with modern facilities for conferences.",
                    },
                  );
                },
              ),
              SizedBox(height: 20),

              // Seminar Hall 1
              SeminarHallCard(
                hallName: "Seminar Hall 1",
                capacity: 50,
                description:
                    "A medium-sized seminar hall perfect for workshops and small gatherings.",
                image: "assets/images/venue.jpeg",
                onBookPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/booking',
                    arguments: {
                      'hallName': "Seminar Hall 1",
                      'capacity': 50,
                      'description':
                          "A medium-sized seminar hall perfect for workshops and small gatherings.",
                    },
                  );
                },
              ),
              SizedBox(height: 20),

              // Seminar Hall 1
              SeminarHallCard(
                hallName: "Seminar Hall 1",
                capacity: 50,
                description:
                    "A medium-sized seminar hall perfect for workshops and small gatherings.",
                image: "assets/images/venue.jpeg",
                onBookPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/booking',
                    arguments: {
                      'hallName': "Seminar Hall 1",
                      'capacity': 50,
                      'description':
                          "A medium-sized seminar hall perfect for workshops and small gatherings.",
                    },
                  );
                },
              ),
              SizedBox(height: 20),

              // Seminar Hall 1
              SeminarHallCard(
                hallName: "Seminar Hall 1",
                capacity: 50,
                description:
                    "A medium-sized seminar hall perfect for workshops and small gatherings.",
                image: "assets/images/venue.jpeg",
                onBookPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/booking',
                    arguments: {
                      'hallName': "Seminar Hall 1",
                      'capacity': 50,
                      'description':
                          "A medium-sized seminar hall perfect for workshops and small gatherings.",
                    },
                  );
                },
              ),
              SizedBox(height: 20),

              // Seminar Hall 1
              SeminarHallCard(
                hallName: "Seminar Hall 1",
                capacity: 50,
                description:
                    "A medium-sized seminar hall perfect for workshops and small gatherings.",
                image: "assets/images/venue.jpeg",
                onBookPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/booking',
                    arguments: {
                      'hallName': "Seminar Hall 1",
                      'capacity': 50,
                      'description':
                          "A medium-sized seminar hall perfect for workshops and small gatherings.",
                    },
                  );
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// class SeminarHallCard extends StatelessWidget {
//   final String hallName;
//   final int capacity;
//   final String description;
//   final String image; // New property for the image
//   final VoidCallback onBookPressed;

//   const SeminarHallCard({
//     required this.hallName,
//     required this.capacity,
//     required this.description,
//     required this.image, // Pass the image here
//     required this.onBookPressed,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(8.0),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image.asset(
//             image,
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: 150,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   hallName,
//                   style: const TextStyle(
//                       fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 4),
//                 Text("Capacity: $capacity"),
//                 const SizedBox(height: 4),
//                 Text(description),
//                 const SizedBox(height: 8),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color.fromARGB(255, 35, 34, 34),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   onPressed: () {
//                     Navigator.pushNamed(
//                       context,
//                       '/booking_page',
//                       arguments: {
//                         'hallName': hallName,
//                         'capacity': capacity,
//                         'description': description,
//                       },
//                     );
//                   },
//                   child: Text(
//                     "Book",
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class SeminarHallCard extends StatelessWidget {
  final String hallName;
  final int capacity;
  final String description;
  final String image;
  final VoidCallback onBookPressed;

  const SeminarHallCard({
    required this.hallName,
    required this.capacity,
    required this.description,
    required this.image,
    required this.onBookPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0, // Adds shadow to the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Curved edges
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(15.0), // Curved edges for the image
            ),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 150.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hallName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "Capacity: $capacity",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 35, 34, 34),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/booking_page',
                      arguments: {
                        'hallName': hallName,
                        'capacity': capacity,
                        'description': description,
                      },
                    );
                  },
                  child: Text(
                    "Book",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
