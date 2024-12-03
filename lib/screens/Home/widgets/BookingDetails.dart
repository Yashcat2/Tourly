import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class BookingDetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Functionality for showing Date Pickers
    Future<void> _selectDate(BuildContext context, ValueNotifier<DateTime?> dateNotifier) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
      if (picked != null) {
        dateNotifier.value = picked;
      }
    }

    // State holders for check-in, check-out, and members count
    ValueNotifier<DateTime?> checkInDate = ValueNotifier(null);
    ValueNotifier<DateTime?> checkOutDate = ValueNotifier(null);
    ValueNotifier<int> adultsCount = ValueNotifier(1);
    ValueNotifier<int> childrenCount = ValueNotifier(0);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Fill Booking Details",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20.0),

          // Check-in Date Picker
          ValueListenableBuilder<DateTime?>(
            valueListenable: checkInDate,
            builder: (context, value, child) {
              return ListTile(
                title: const Text("Check-in Date"),
                subtitle: Text(value != null ? value.toString().split(' ')[0] : "Select Date"),
                trailing: IconButton(
                  icon: const Icon(Icons.date_range),
                  onPressed: () => _selectDate(context, checkInDate),
                ),
              );
            },
          ),

          // Check-out Date Picker
          ValueListenableBuilder<DateTime?>(
            valueListenable: checkOutDate,
            builder: (context, value, child) {
              return ListTile(
                title: const Text("Check-out Date"),
                subtitle: Text(value != null ? value.toString().split(' ')[0] : "Select Date"),
                trailing: IconButton(
                  icon: const Icon(Icons.date_range),
                  onPressed: () => _selectDate(context, checkOutDate),
                ),
              );
            },
          ),

          // Adults Count
          ValueListenableBuilder<int>(
            valueListenable: adultsCount,
            builder: (context, value, child) {
              return ListTile(
                title: const Text("Adults"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        if (value > 1) adultsCount.value--;
                      },
                    ),
                    Text(value.toString()),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        adultsCount.value++;
                      },
                    ),
                  ],
                ),
              );
            },
          ),

          // Children Count
          ValueListenableBuilder<int>(
            valueListenable: childrenCount,
            builder: (context, value, child) {
              return ListTile(
                title: const Text("Children"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        if (value > 0) childrenCount.value--;
                      },
                    ),
                    Text(value.toString()),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        childrenCount.value++;
                      },
                    ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 20.0),

          // Submit Button
MaterialButton(
  onPressed: () async {
    if (checkInDate.value == null || checkOutDate.value == null) {
      // Show SnackBar if dates are not selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Please select both Check-in and Check-out dates!"),
          backgroundColor: Colors.red,
        ),
      );
      return; // Prevent further execution
    }

    // Create an object to hold booking details
    Map<String, dynamic> bookingDetails = {
      "check_in_date": checkInDate.value!.toIso8601String(),
      "check_out_date": checkOutDate.value!.toIso8601String(),
      "adults": adultsCount.value,
      "children": childrenCount.value,
    };

    // Write bookingDetails to Firebase Realtime Database
    try {
      final databaseRef = FirebaseDatabase.instance.ref();

      await databaseRef.child('bookings').push().set(bookingDetails);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Booking details submitted successfully!"),
          backgroundColor: Colors.green,
        ),
      );
      // Close both the modal and the ProceedWidget
      Navigator.pop(context); // Close the BookingDetails modal
      Navigator.pop(context); // Close the ProceedWidget modal
    } catch (error) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to submit booking: $error"),
          backgroundColor: Colors.red,
        ),
      );
    }
  },
  color: Colors.blue,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(50),
  ),
  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
  child: const Text(
    "Submit",
    style: TextStyle(
      color: Colors.white,
      fontSize: 18,
    ),
  ),
),


        ],
      ),
    );
  }
}




             