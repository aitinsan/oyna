import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'day_record.g.dart';

abstract class DayRecord implements Built<DayRecord, DayRecordBuilder> {
  static Serializer<DayRecord> get serializer => _$dayRecordSerializer;

  @BuiltValueField(wireName: 'progress_day')
  int? get progressDay;

  BuiltList<DocumentReference>? get types;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get reference;

  static void _initializeBuilder(DayRecordBuilder builder) => builder
    ..progressDay = 0
    ..types = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('day');

  static Stream<DayRecord?> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DayRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DayRecord._();
  factory DayRecord([void Function(DayRecordBuilder) updates]) = _$DayRecord;

  static DayRecord? getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDayRecordData({
  int? progressDay,
}) =>
    serializers.toFirestore(
        DayRecord.serializer,
        DayRecord((d) => d
          ..progressDay = progressDay
          ..types = null));
