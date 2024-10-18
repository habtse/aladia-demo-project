import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Stack(children: [
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 1.5,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black, Colors.white, Colors.black],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
              )),
          const TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Search courses...',
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
            ),
            style: TextStyle(color: Colors.white),
          ),
        ]),
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              // Join Us button action
            },
            icon: const Icon(Icons.person_add, color: Colors.white),
            label: const Text('Join Us', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(
                      color: Colors.white,
                    ))),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 1), // Space at the top
            const Text(
              'E-learning Revolution 2',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'We have worked to digitize our school, and give the whole '
              'world the opportunity to do it with a new study platform '
              'designed for teachers',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Go to Marketplace action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                side: const BorderSide(color: Colors.white), // White border
              ),
              child: const Text(
                'Go to Marketplace',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const Spacer(flex: 2), // More space below the content
          ],
        ),
      ),
    );
  }
}
