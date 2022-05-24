// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DayRecord> _$dayRecordSerializer = new _$DayRecordSerializer();

class _$DayRecordSerializer implements StructuredSerializer<DayRecord> {
  @override
  final Iterable<Type> types = const [DayRecord, _$DayRecord];
  @override
  final String wireName = 'DayRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, DayRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.progressDay;
    if (value != null) {
      result
        ..add('progress_day')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.types;
    if (value != null) {
      result
        ..add('types')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
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
  DayRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DayRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String?;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'progress_day':
          result.progressDay = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'types':
          result.types.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
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

class _$DayRecord extends DayRecord {
  @override
  final int? progressDay;
  @override
  final BuiltList<DocumentReference<Object>>? types;
  @override
  final DocumentReference<Object>? reference;

  factory _$DayRecord([void Function(DayRecordBuilder)? updates]) =>
      (new DayRecordBuilder()..update(updates)).build();

  _$DayRecord._({this.progressDay, this.types, this.reference}) : super._();

  @override
  DayRecord rebuild(void Function(DayRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DayRecordBuilder toBuilder() => new DayRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DayRecord &&
        progressDay == other.progressDay &&
        types == other.types &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, progressDay.hashCode), types.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DayRecord')
          ..add('progressDay', progressDay)
          ..add('types', types)
          ..add('reference', reference))
        .toString();
  }
}

class DayRecordBuilder implements Builder<DayRecord, DayRecordBuilder> {
  _$DayRecord? _$v;

  int? _progressDay;
  int? get progressDay => _$this._progressDay;
  set progressDay(int? progressDay) => _$this._progressDay = progressDay;

  ListBuilder<DocumentReference<Object>>? _types;
  ListBuilder<DocumentReference<Object>> get types =>
      _$this._types ??= new ListBuilder<DocumentReference<Object>>();
  set types(ListBuilder<DocumentReference<Object>>? types) =>
      _$this._types = types;

  DocumentReference<Object>? _reference;
  DocumentReference<Object>? get reference => _$this._reference;
  set reference(DocumentReference<Object>? reference) =>
      _$this._reference = reference;

  DayRecordBuilder() {
    DayRecord._initializeBuilder(this);
  }

  DayRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _progressDay = $v.progressDay;
      _types = $v.types?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DayRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DayRecord;
  }

  @override
  void update(void Function(DayRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DayRecord build() {
    _$DayRecord _$result;
    try {
      _$result = _$v ??
          new _$DayRecord._(
              progressDay: progressDay,
              types: _types?.build(),
              reference: reference);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'types';
        _types?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DayRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
