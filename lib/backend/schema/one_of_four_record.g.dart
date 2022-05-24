// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_of_four_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OneOfFourRecord> _$oneOfFourRecordSerializer =
    new _$OneOfFourRecordSerializer();

class _$OneOfFourRecordSerializer
    implements StructuredSerializer<OneOfFourRecord> {
  @override
  final Iterable<Type> types = const [OneOfFourRecord, _$OneOfFourRecord];
  @override
  final String wireName = 'OneOfFourRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, OneOfFourRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.teachingCards;
    if (value != null) {
      result
        ..add('teaching_cards')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.day;
    if (value != null) {
      result
        ..add('day')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  OneOfFourRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OneOfFourRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String?;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'teaching_cards':
          result.teachingCards.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'day':
          result.day = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>?;
          break;
      }
    }

    return result.build();
  }
}

class _$OneOfFourRecord extends OneOfFourRecord {
  @override
  final String? type;
  @override
  final BuiltList<DocumentReference<Object>>? teachingCards;
  @override
  final int? day;
  @override
  final DocumentReference<Object>? reference;

  factory _$OneOfFourRecord([void Function(OneOfFourRecordBuilder)? updates]) =>
      (new OneOfFourRecordBuilder()..update(updates)).build();

  _$OneOfFourRecord._({this.type, this.teachingCards, this.day, this.reference})
      : super._();

  @override
  OneOfFourRecord rebuild(void Function(OneOfFourRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OneOfFourRecordBuilder toBuilder() =>
      new OneOfFourRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OneOfFourRecord &&
        type == other.type &&
        teachingCards == other.teachingCards &&
        day == other.day &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, type.hashCode), teachingCards.hashCode), day.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OneOfFourRecord')
          ..add('type', type)
          ..add('teachingCards', teachingCards)
          ..add('day', day)
          ..add('reference', reference))
        .toString();
  }
}

class OneOfFourRecordBuilder
    implements Builder<OneOfFourRecord, OneOfFourRecordBuilder> {
  _$OneOfFourRecord? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  ListBuilder<DocumentReference<Object>>? _teachingCards;
  ListBuilder<DocumentReference<Object>> get teachingCards =>
      _$this._teachingCards ??= new ListBuilder<DocumentReference<Object>>();
  set teachingCards(ListBuilder<DocumentReference<Object>>? teachingCards) =>
      _$this._teachingCards = teachingCards;

  int? _day;
  int? get day => _$this._day;
  set day(int? day) => _$this._day = day;

  DocumentReference<Object>? _reference;
  DocumentReference<Object>? get reference => _$this._reference;
  set reference(DocumentReference<Object>? reference) =>
      _$this._reference = reference;

  OneOfFourRecordBuilder() {
    OneOfFourRecord._initializeBuilder(this);
  }

  OneOfFourRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _teachingCards = $v.teachingCards?.toBuilder();
      _day = $v.day;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OneOfFourRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OneOfFourRecord;
  }

  @override
  void update(void Function(OneOfFourRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OneOfFourRecord build() {
    _$OneOfFourRecord _$result;
    try {
      _$result = _$v ??
          new _$OneOfFourRecord._(
              type: type,
              teachingCards: _teachingCards?.build(),
              day: day,
              reference: reference);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'teachingCards';
        _teachingCards?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'OneOfFourRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
