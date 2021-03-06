// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_account_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CustomerAccountDTO> _$customerAccountDTOSerializer =
    new _$CustomerAccountDTOSerializer();

class _$CustomerAccountDTOSerializer
    implements StructuredSerializer<CustomerAccountDTO> {
  @override
  final Iterable<Type> types = const [CustomerAccountDTO, _$CustomerAccountDTO];
  @override
  final String wireName = 'CustomerAccountDTO';

  @override
  Iterable<Object> serialize(Serializers serializers, CustomerAccountDTO object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.officeAddressId != null) {
      result
        ..add('officeAddressId')
        ..add(serializers.serialize(object.officeAddressId,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  CustomerAccountDTO deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CustomerAccountDTOBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'officeAddressId':
          result.officeAddressId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$CustomerAccountDTO extends CustomerAccountDTO {
  @override
  final int id;
  @override
  final String name;
  @override
  final int officeAddressId;

  factory _$CustomerAccountDTO(
          [void Function(CustomerAccountDTOBuilder) updates]) =>
      (new CustomerAccountDTOBuilder()..update(updates)).build();

  _$CustomerAccountDTO._({this.id, this.name, this.officeAddressId})
      : super._();

  @override
  CustomerAccountDTO rebuild(
          void Function(CustomerAccountDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CustomerAccountDTOBuilder toBuilder() =>
      new CustomerAccountDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CustomerAccountDTO &&
        id == other.id &&
        name == other.name &&
        officeAddressId == other.officeAddressId;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, id.hashCode), name.hashCode), officeAddressId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CustomerAccountDTO')
          ..add('id', id)
          ..add('name', name)
          ..add('officeAddressId', officeAddressId))
        .toString();
  }
}

class CustomerAccountDTOBuilder
    implements Builder<CustomerAccountDTO, CustomerAccountDTOBuilder> {
  _$CustomerAccountDTO _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _officeAddressId;
  int get officeAddressId => _$this._officeAddressId;
  set officeAddressId(int officeAddressId) =>
      _$this._officeAddressId = officeAddressId;

  CustomerAccountDTOBuilder();

  CustomerAccountDTOBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _officeAddressId = _$v.officeAddressId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CustomerAccountDTO other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CustomerAccountDTO;
  }

  @override
  void update(void Function(CustomerAccountDTOBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CustomerAccountDTO build() {
    final _$result = _$v ??
        new _$CustomerAccountDTO._(
            id: id, name: name, officeAddressId: officeAddressId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
