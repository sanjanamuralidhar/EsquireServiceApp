// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_enum_form_property.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RestEnumFormProperty> _$restEnumFormPropertySerializer =
    new _$RestEnumFormPropertySerializer();

class _$RestEnumFormPropertySerializer
    implements StructuredSerializer<RestEnumFormProperty> {
  @override
  final Iterable<Type> types = const [
    RestEnumFormProperty,
    _$RestEnumFormProperty
  ];
  @override
  final String wireName = 'RestEnumFormProperty';

  @override
  Iterable<Object> serialize(
      Serializers serializers, RestEnumFormProperty object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  RestEnumFormProperty deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RestEnumFormPropertyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$RestEnumFormProperty extends RestEnumFormProperty {
  @override
  final String id;
  @override
  final String name;

  factory _$RestEnumFormProperty(
          [void Function(RestEnumFormPropertyBuilder) updates]) =>
      (new RestEnumFormPropertyBuilder()..update(updates)).build();

  _$RestEnumFormProperty._({this.id, this.name}) : super._();

  @override
  RestEnumFormProperty rebuild(
          void Function(RestEnumFormPropertyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RestEnumFormPropertyBuilder toBuilder() =>
      new RestEnumFormPropertyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RestEnumFormProperty &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RestEnumFormProperty')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class RestEnumFormPropertyBuilder
    implements Builder<RestEnumFormProperty, RestEnumFormPropertyBuilder> {
  _$RestEnumFormProperty _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  RestEnumFormPropertyBuilder();

  RestEnumFormPropertyBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RestEnumFormProperty other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RestEnumFormProperty;
  }

  @override
  void update(void Function(RestEnumFormPropertyBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RestEnumFormProperty build() {
    final _$result = _$v ?? new _$RestEnumFormProperty._(id: id, name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
