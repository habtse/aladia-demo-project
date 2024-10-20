import "package:flutter/material.dart";

Widget BuildSocialButton(
    {required IconData icon, required String text, required Color color}) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      shadowColor: Colors.white,
      overlayColor: Colors.white,
      surfaceTintColor: Colors.white,
      backgroundColor: Color.fromARGB(84, 7, 7, 7),
      minimumSize: Size(500, 50),
      maximumSize: Size(500, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    icon: Icon(icon, color: color),
    label: Text(text, style: TextStyle(color: Colors.white)),
    onPressed: () {
      // Handle social login action
    },
  );
}
