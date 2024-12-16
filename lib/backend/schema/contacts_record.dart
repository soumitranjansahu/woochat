import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContactsRecord extends FirestoreRecord {
  ContactsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "phoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _phoneNumber = snapshotData['phoneNumber'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('contacts')
          : FirebaseFirestore.instance.collectionGroup('contacts');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('contacts').doc(id);

  static Stream<ContactsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContactsRecord.fromSnapshot(s));

  static Future<ContactsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContactsRecord.fromSnapshot(s));

  static ContactsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContactsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContactsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContactsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContactsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContactsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContactsRecordData({
  String? name,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'phoneNumber': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContactsRecordDocumentEquality implements Equality<ContactsRecord> {
  const ContactsRecordDocumentEquality();

  @override
  bool equals(ContactsRecord? e1, ContactsRecord? e2) {
    return e1?.name == e2?.name && e1?.phoneNumber == e2?.phoneNumber;
  }

  @override
  int hash(ContactsRecord? e) =>
      const ListEquality().hash([e?.name, e?.phoneNumber]);

  @override
  bool isValidKey(Object? o) => o is ContactsRecord;
}
