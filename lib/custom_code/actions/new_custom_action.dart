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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_service/contacts_service.dart';

Future<void> newCustomAction(String? uid) async {
  if (uid == null) {
    print("Invalid UID provided");
    return;
  }

  await importContactsToFirestore(uid);
}

Future<void> importContactsToFirestore(String uid) async {
  try {
    // Fetch contacts from device
    Iterable<Contact> contacts = await ContactsService.getContacts();

    // Get a reference to the user's contacts subcollection
    final userContactsRef = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('contacts');

    // Iterate over each contact and add it to Firestore
    for (Contact contact in contacts) {
      String? displayName = contact.displayName;
      String? phoneNumber = contact.phones?.isNotEmpty == true
          ? contact.phones!.first.value
          : null;

      // Only store contacts with both a name and a phone number
      if (displayName != null && phoneNumber != null) {
        await userContactsRef.add({
          'name': displayName,
          'phoneNumber': phoneNumber,
        });
      }
    }
    print("Contacts imported successfully.");
  } catch (e) {
    print("Error importing contacts: $e");
  }
}
