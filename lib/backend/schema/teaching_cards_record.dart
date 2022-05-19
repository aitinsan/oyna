import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'teaching_cards_record.g.dart';

abstract class TeachingCardsRecord
    implements Built<TeachingCardsRecord, TeachingCardsRecordBuilder> {
  static Serializer<TeachingCardsRecord> get serializer =>
      _$teachingCardsRecordSerializer;

  @nullable
  String get type;

  @nullable
  String get topic;

  @nullable
  String get title;

  @nullable
  String get text;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TeachingCardsRecordBuilder builder) => builder
    ..type = ''
    ..topic = ''
    ..title = ''
    ..text = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('teaching_cards');

  static Stream<TeachingCardsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TeachingCardsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  TeachingCardsRecord._();
  factory TeachingCardsRecord(
          [void Function(TeachingCardsRecordBuilder) updates]) =
      _$TeachingCardsRecord;

  static TeachingCardsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTeachingCardsRecordData({
  String type,
  String topic,
  String title,
  String text,
}) =>
    serializers.toFirestore(
        TeachingCardsRecord.serializer,
        TeachingCardsRecord((t) => t
          ..type = type
          ..topic = topic
          ..title = title
          ..text = text));
