import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'one_of_four_record.g.dart';

abstract class OneOfFourRecord
    implements Built<OneOfFourRecord, OneOfFourRecordBuilder> {
  static Serializer<OneOfFourRecord> get serializer =>
      _$oneOfFourRecordSerializer;

  @nullable
  String get type;

  @nullable
  @BuiltValueField(wireName: 'teaching_cards')
  BuiltList<DocumentReference> get teachingCards;

  @nullable
  int get day;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(OneOfFourRecordBuilder builder) => builder
    ..type = ''
    ..teachingCards = ListBuilder()
    ..day = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('one_of_four');

  static Stream<OneOfFourRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<OneOfFourRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  OneOfFourRecord._();
  factory OneOfFourRecord([void Function(OneOfFourRecordBuilder) updates]) =
      _$OneOfFourRecord;

  static OneOfFourRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createOneOfFourRecordData({
  String type,
  int day,
}) =>
    serializers.toFirestore(
        OneOfFourRecord.serializer,
        OneOfFourRecord((o) => o
          ..type = type
          ..teachingCards = null
          ..day = day));
