import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessegesRecord extends FirestoreRecord {
  MessegesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "test" field.
  String? _test;
  String get test => _test ?? '';
  bool hasTest() => _test != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "seen" field.
  bool? _seen;
  bool get seen => _seen ?? false;
  bool hasSeen() => _seen != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _test = snapshotData['test'] as String?;
    _image = snapshotData['image'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _seen = snapshotData['seen'] as bool?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('messeges')
          : FirebaseFirestore.instance.collectionGroup('messeges');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('messeges').doc(id);

  static Stream<MessegesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessegesRecord.fromSnapshot(s));

  static Future<MessegesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessegesRecord.fromSnapshot(s));

  static MessegesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessegesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessegesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessegesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessegesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessegesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessegesRecordData({
  String? test,
  String? image,
  DateTime? timestamp,
  bool? seen,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'test': test,
      'image': image,
      'timestamp': timestamp,
      'seen': seen,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessegesRecordDocumentEquality implements Equality<MessegesRecord> {
  const MessegesRecordDocumentEquality();

  @override
  bool equals(MessegesRecord? e1, MessegesRecord? e2) {
    return e1?.test == e2?.test &&
        e1?.image == e2?.image &&
        e1?.timestamp == e2?.timestamp &&
        e1?.seen == e2?.seen &&
        e1?.user == e2?.user;
  }

  @override
  int hash(MessegesRecord? e) => const ListEquality()
      .hash([e?.test, e?.image, e?.timestamp, e?.seen, e?.user]);

  @override
  bool isValidKey(Object? o) => o is MessegesRecord;
}
