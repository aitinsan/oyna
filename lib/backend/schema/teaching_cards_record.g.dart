// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teaching_cards_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TeachingCardsRecord> _$teachingCardsRecordSerializer =
    new _$TeachingCardsRecordSerializer();

class _$TeachingCardsRecordSerializer
    implements StructuredSerializer<TeachingCardsRecord> {
  @override
  final Iterable<Type> types = const [
    TeachingCardsRecord,
    _$TeachingCardsRecord
  ];
  @override
  final String wireName = 'TeachingCardsRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, TeachingCardsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.topic;
    if (value != null) {
      result
        ..add('topic')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.text;
    if (value != null) {
      result
        ..add('text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  TeachingCardsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TeachingCardsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'topic':
          result.topic = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$TeachingCardsRecord extends TeachingCardsRecord {
  @override
  final String type;
  @override
  final String topic;
  @override
  final String title;
  @override
  final String text;
  @override
  final DocumentReference<Object> reference;

  factory _$TeachingCardsRecord(
          [void Function(TeachingCardsRecordBuilder) updates]) =>
      (new TeachingCardsRecordBuilder()..update(updates)).build();

  _$TeachingCardsRecord._(
      {this.type, this.topic, this.title, this.text, this.reference})
      : super._();

  @override
  TeachingCardsRecord rebuild(
          void Function(TeachingCardsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TeachingCardsRecordBuilder toBuilder() =>
      new TeachingCardsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TeachingCardsRecord &&
        type == other.type &&
        topic == other.topic &&
        title == other.title &&
        text == other.text &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, type.hashCode), topic.hashCode), title.hashCode),
            text.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TeachingCardsRecord')
          ..add('type', type)
          ..add('topic', topic)
          ..add('title', title)
          ..add('text', text)
          ..add('reference', reference))
        .toString();
  }
}

class TeachingCardsRecordBuilder
    implements Builder<TeachingCardsRecord, TeachingCardsRecordBuilder> {
  _$TeachingCardsRecord _$v;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _topic;
  String get topic => _$this._topic;
  set topic(String topic) => _$this._topic = topic;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  TeachingCardsRecordBuilder() {
    TeachingCardsRecord._initializeBuilder(this);
  }

  TeachingCardsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _topic = $v.topic;
      _title = $v.title;
      _text = $v.text;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TeachingCardsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TeachingCardsRecord;
  }

  @override
  void update(void Function(TeachingCardsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TeachingCardsRecord build() {
    final _$result = _$v ??
        new _$TeachingCardsRecord._(
            type: type,
            topic: topic,
            title: title,
            text: text,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
