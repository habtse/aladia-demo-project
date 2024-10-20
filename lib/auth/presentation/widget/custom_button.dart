import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width; // Width of the button
  final String text; // Text displayed on the button
  final VoidCallback onTap; // Function called on tap
  final bool isLoading; // Flag to show loading indicator

  const CustomButton({
    Key? key,
    required this.width,
    required this.text,
    required this.onTap,
    this.isLoading = false, // Default to false if not specified
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: ElevatedButton(
        onPressed: isLoading ? null : onTap, // Disable button if loading
        style: ElevatedButton.styleFrom(
          // Background color (purple)
          padding: EdgeInsets.symmetric(vertical: 16.0), // Padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
          ),
        ),
        child: isLoading
            ? CircularProgressIndicator(
                color: Colors.white, // Color of the loading indicator
              )
            : Text(
                text,
                style: TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 16.0, // Text size
                ),
              ),
      ),
    );
  }
}
