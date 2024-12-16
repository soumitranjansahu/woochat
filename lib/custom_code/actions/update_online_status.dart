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
import 'package:connectivity_plus/connectivity_plus.dart';

// Define the custom action function
Future<void> updateOnlineStatus(String uid) async {
  final firestore = FirebaseFirestore.instance;
  final connectivity = Connectivity();

  // Check the current connectivity status
  var connectivityResult = await connectivity.checkConnectivity();

  // If the user is online
  if (connectivityResult != ConnectivityResult.none) {
    // Update Firestore to set online status to true
    await firestore.collection('users').doc(uid).update({'online': true});
  } else {
    // If the user is offline, set the online status to false
    await firestore.collection('users').doc(uid).update({'online': false});
  }

  // Check if the user has been offline for 30 seconds
  if (connectivityResult == ConnectivityResult.none) {
    Future.delayed(Duration(seconds: 30), () async {
      await firestore.collection('users').doc(uid).update({'online': false});
    });
  }
}
