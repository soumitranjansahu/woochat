// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ContactStruct extends FFFirebaseStruct {
  ContactStruct({
    String? name,
    String? phonenumber,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _phonenumber = phonenumber,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "phonenumber" field.
  String? _phonenumber;
  String get phonenumber => _phonenumber ?? '';
  set phonenumber(String? val) => _phonenumber = val;

  bool hasPhonenumber() => _phonenumber != null;

  static ContactStruct fromMap(Map<String, dynamic> data) => ContactStruct(
        name: data['name'] as String?,
        phonenumber: data['phonenumber'] as String?,
      );

  static ContactStruct? maybeFromMap(dynamic data) =>
      data is Map ? ContactStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'phonenumber': _phonenumber,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'phonenumber': serializeParam(
          _phonenumber,
          ParamType.String,
        ),
      }.withoutNulls;

  static ContactStruct fromSerializableMap(Map<String, dynamic> data) =>
      ContactStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        phonenumber: deserializeParam(
          data['phonenumber'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ContactStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ContactStruct &&
        name == other.name &&
        phonenumber == other.phonenumber;
  }

  @override
  int get hashCode => const ListEquality().hash([name, phonenumber]);
}

ContactStruct createContactStruct({
  String? name,
  String? phonenumber,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ContactStruct(
      name: name,
      phonenumber: phonenumber,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ContactStruct? updateContactStruct(
  ContactStruct? contact, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    contact
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addContactStructData(
  Map<String, dynamic> firestoreData,
  ContactStruct? contact,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (contact == null) {
    return;
  }
  if (contact.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && contact.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final contactData = getContactFirestoreData(contact, forFieldValue);
  final nestedData = contactData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = contact.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getContactFirestoreData(
  ContactStruct? contact, [
  bool forFieldValue = false,
]) {
  if (contact == null) {
    return {};
  }
  final firestoreData = mapToFirestore(contact.toMap());

  // Add any Firestore field values
  contact.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getContactListFirestoreData(
  List<ContactStruct>? contacts,
) =>
    contacts?.map((e) => getContactFirestoreData(e, true)).toList() ?? [];
