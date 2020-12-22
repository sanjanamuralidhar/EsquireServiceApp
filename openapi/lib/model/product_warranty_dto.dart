        import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'product_warranty_dto.g.dart';

abstract class ProductWarrantyDTO implements Built<ProductWarrantyDTO, ProductWarrantyDTOBuilder> {

    
        @nullable
    @BuiltValueField(wireName: r'description')
    String get description;
    
        @nullable
    @BuiltValueField(wireName: r'id')
    int get id;
    
        @nullable
    @BuiltValueField(wireName: r'name')
    String get name;
    
        @nullable
    @BuiltValueField(wireName: r'periodInMonths')
    int get periodInMonths;
    
        @nullable
    @BuiltValueField(wireName: r'periodInYear')
    int get periodInYear;
    
        @nullable
    @BuiltValueField(wireName: r'productId')
    int get productId;
    
        @nullable
    @BuiltValueField(wireName: r'warrantyType')
    String get warrantyType;
        //enum warrantyTypeEnum {  NORMAL,  ASC,  };

    // Boilerplate code needed to wire-up generated code
    ProductWarrantyDTO._();

    factory ProductWarrantyDTO([updates(ProductWarrantyDTOBuilder b)]) = _$ProductWarrantyDTO;
    static Serializer<ProductWarrantyDTO> get serializer => _$productWarrantyDTOSerializer;

}

