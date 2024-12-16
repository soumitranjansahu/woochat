// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:contacts_service/contacts_service.dart'; // Importing contacts_service package

Future<List<ContactStruct>?> fetchDeviceContacts() async {
  try {
    // Retrieve contacts from the device
    Iterable<Contact> deviceContacts = await ContactsService.getContacts();
    List<ContactStruct> contactList = [];

    // Process each device contact and map it to ContactStruct
    for (var deviceContact in deviceContacts) {
      String name = deviceContact.displayName ?? ''; // Null check for name
      String phonenumber = ''; // Use 'phonenumber' to match your field name

      // Safely check if phone numbers are available and retrieve the first phone number
      if (deviceContact.phones?.isNotEmpty ?? false) {
        phonenumber = deviceContact.phones!.first.value ??
            ''; // Null check for phone number
      }

      // Create a ContactStruct object and add it to the list
      contactList.add(ContactStruct(
        name: name,
        phonenumber: phonenumber, // Ensure this field is 'phonenumber'
      ));
    }

    return contactList; // Return the list of ContactStruct
  } catch (e) {
    print("Error fetching contacts: $e");
    return null; // Return null in case of an error
  }
}
