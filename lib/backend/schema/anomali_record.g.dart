// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anomali_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AnomaliRecord> _$anomaliRecordSerializer =
    new _$AnomaliRecordSerializer();

class _$AnomaliRecordSerializer implements StructuredSerializer<AnomaliRecord> {
  @override
  final Iterable<Type> types = const [AnomaliRecord, _$AnomaliRecord];
  @override
  final String wireName = 'AnomaliRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, AnomaliRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.namaAnomali;
    if (value != null) {
      result
        ..add('nama_anomali')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userPostAnomali;
    if (value != null) {
      result
        ..add('user_post_anomali')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.fotoAnomali;
    if (value != null) {
      result
        ..add('foto_anomali')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tagAnomali;
    if (value != null) {
      result
        ..add('tag_anomali')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.statusAnomali;
    if (value != null) {
      result
        ..add('status_anomali')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.tanggalCreateAnomali;
    if (value != null) {
      result
        ..add('tanggal_create_anomali')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.vendorAnomali;
    if (value != null) {
      result
        ..add('vendor_anomali')
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
  AnomaliRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AnomaliRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'nama_anomali':
          result.namaAnomali = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user_post_anomali':
          result.userPostAnomali = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'foto_anomali':
          result.fotoAnomali = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tag_anomali':
          result.tagAnomali = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status_anomali':
          result.statusAnomali = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'tanggal_create_anomali':
          result.tanggalCreateAnomali = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'vendor_anomali':
          result.vendorAnomali = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

class _$AnomaliRecord extends AnomaliRecord {
  @override
  final String namaAnomali;
  @override
  final DocumentReference<Object> userPostAnomali;
  @override
  final String fotoAnomali;
  @override
  final String tagAnomali;
  @override
  final int statusAnomali;
  @override
  final DateTime tanggalCreateAnomali;
  @override
  final int vendorAnomali;
  @override
  final DocumentReference<Object> reference;

  factory _$AnomaliRecord([void Function(AnomaliRecordBuilder) updates]) =>
      (new AnomaliRecordBuilder()..update(updates)).build();

  _$AnomaliRecord._(
      {this.namaAnomali,
      this.userPostAnomali,
      this.fotoAnomali,
      this.tagAnomali,
      this.statusAnomali,
      this.tanggalCreateAnomali,
      this.vendorAnomali,
      this.reference})
      : super._();

  @override
  AnomaliRecord rebuild(void Function(AnomaliRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnomaliRecordBuilder toBuilder() => new AnomaliRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnomaliRecord &&
        namaAnomali == other.namaAnomali &&
        userPostAnomali == other.userPostAnomali &&
        fotoAnomali == other.fotoAnomali &&
        tagAnomali == other.tagAnomali &&
        statusAnomali == other.statusAnomali &&
        tanggalCreateAnomali == other.tanggalCreateAnomali &&
        vendorAnomali == other.vendorAnomali &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc(0, namaAnomali.hashCode),
                                userPostAnomali.hashCode),
                            fotoAnomali.hashCode),
                        tagAnomali.hashCode),
                    statusAnomali.hashCode),
                tanggalCreateAnomali.hashCode),
            vendorAnomali.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AnomaliRecord')
          ..add('namaAnomali', namaAnomali)
          ..add('userPostAnomali', userPostAnomali)
          ..add('fotoAnomali', fotoAnomali)
          ..add('tagAnomali', tagAnomali)
          ..add('statusAnomali', statusAnomali)
          ..add('tanggalCreateAnomali', tanggalCreateAnomali)
          ..add('vendorAnomali', vendorAnomali)
          ..add('reference', reference))
        .toString();
  }
}

class AnomaliRecordBuilder
    implements Builder<AnomaliRecord, AnomaliRecordBuilder> {
  _$AnomaliRecord _$v;

  String _namaAnomali;
  String get namaAnomali => _$this._namaAnomali;
  set namaAnomali(String namaAnomali) => _$this._namaAnomali = namaAnomali;

  DocumentReference<Object> _userPostAnomali;
  DocumentReference<Object> get userPostAnomali => _$this._userPostAnomali;
  set userPostAnomali(DocumentReference<Object> userPostAnomali) =>
      _$this._userPostAnomali = userPostAnomali;

  String _fotoAnomali;
  String get fotoAnomali => _$this._fotoAnomali;
  set fotoAnomali(String fotoAnomali) => _$this._fotoAnomali = fotoAnomali;

  String _tagAnomali;
  String get tagAnomali => _$this._tagAnomali;
  set tagAnomali(String tagAnomali) => _$this._tagAnomali = tagAnomali;

  int _statusAnomali;
  int get statusAnomali => _$this._statusAnomali;
  set statusAnomali(int statusAnomali) => _$this._statusAnomali = statusAnomali;

  DateTime _tanggalCreateAnomali;
  DateTime get tanggalCreateAnomali => _$this._tanggalCreateAnomali;
  set tanggalCreateAnomali(DateTime tanggalCreateAnomali) =>
      _$this._tanggalCreateAnomali = tanggalCreateAnomali;

  int _vendorAnomali;
  int get vendorAnomali => _$this._vendorAnomali;
  set vendorAnomali(int vendorAnomali) => _$this._vendorAnomali = vendorAnomali;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  AnomaliRecordBuilder() {
    AnomaliRecord._initializeBuilder(this);
  }

  AnomaliRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _namaAnomali = $v.namaAnomali;
      _userPostAnomali = $v.userPostAnomali;
      _fotoAnomali = $v.fotoAnomali;
      _tagAnomali = $v.tagAnomali;
      _statusAnomali = $v.statusAnomali;
      _tanggalCreateAnomali = $v.tanggalCreateAnomali;
      _vendorAnomali = $v.vendorAnomali;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnomaliRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AnomaliRecord;
  }

  @override
  void update(void Function(AnomaliRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AnomaliRecord build() {
    final _$result = _$v ??
        new _$AnomaliRecord._(
            namaAnomali: namaAnomali,
            userPostAnomali: userPostAnomali,
            fotoAnomali: fotoAnomali,
            tagAnomali: tagAnomali,
            statusAnomali: statusAnomali,
            tanggalCreateAnomali: tanggalCreateAnomali,
            vendorAnomali: vendorAnomali,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
