# openapi.api.QuestionResourceApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://34.68.14.183:8081*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createQuestionUsingPOST**](QuestionResourceApi.md#createQuestionUsingPOST) | **post** /api/questions | createQuestion
[**deleteQuestionUsingDELETE**](QuestionResourceApi.md#deleteQuestionUsingDELETE) | **delete** /api/questions/{id} | deleteQuestion
[**getAllQuestionsUsingGET**](QuestionResourceApi.md#getAllQuestionsUsingGET) | **get** /api/questions | getAllQuestions
[**getQuestionUsingGET**](QuestionResourceApi.md#getQuestionUsingGET) | **get** /api/questions/{id} | getQuestion
[**updateQuestionUsingPUT**](QuestionResourceApi.md#updateQuestionUsingPUT) | **put** /api/questions | updateQuestion


# **createQuestionUsingPOST**
> QuestionDTO createQuestionUsingPOST(questionDTO)

createQuestion

### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new QuestionResourceApi();
var questionDTO = new QuestionDTO(); // QuestionDTO | questionDTO

try { 
    var result = api_instance.createQuestionUsingPOST(questionDTO);
    print(result);
} catch (e) {
    print("Exception when calling QuestionResourceApi->createQuestionUsingPOST: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **questionDTO** | [**QuestionDTO**](QuestionDTO.md)| questionDTO | 

### Return type

[**QuestionDTO**](QuestionDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteQuestionUsingDELETE**
> deleteQuestionUsingDELETE(id)

deleteQuestion

### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new QuestionResourceApi();
var id = 789; // int | id

try { 
    api_instance.deleteQuestionUsingDELETE(id);
} catch (e) {
    print("Exception when calling QuestionResourceApi->deleteQuestionUsingDELETE: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| id | [default to null]

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllQuestionsUsingGET**
> List<QuestionDTO> getAllQuestionsUsingGET(page, size, sort)

getAllQuestions

### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new QuestionResourceApi();
var page = 56; // int | Page number of the requested page
var size = 56; // int | Size of a page
var sort = []; // List<String> | Sorting criteria in the format: property(,asc|desc). Default sort order is ascending. Multiple sort criteria are supported.

try { 
    var result = api_instance.getAllQuestionsUsingGET(page, size, sort);
    print(result);
} catch (e) {
    print("Exception when calling QuestionResourceApi->getAllQuestionsUsingGET: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number of the requested page | [optional] [default to null]
 **size** | **int**| Size of a page | [optional] [default to null]
 **sort** | [**List&lt;String&gt;**](String.md)| Sorting criteria in the format: property(,asc|desc). Default sort order is ascending. Multiple sort criteria are supported. | [optional] [default to const []]

### Return type

[**List<QuestionDTO>**](QuestionDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getQuestionUsingGET**
> QuestionDTO getQuestionUsingGET(id)

getQuestion

### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new QuestionResourceApi();
var id = 789; // int | id

try { 
    var result = api_instance.getQuestionUsingGET(id);
    print(result);
} catch (e) {
    print("Exception when calling QuestionResourceApi->getQuestionUsingGET: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| id | [default to null]

### Return type

[**QuestionDTO**](QuestionDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateQuestionUsingPUT**
> QuestionDTO updateQuestionUsingPUT(questionDTO)

updateQuestion

### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new QuestionResourceApi();
var questionDTO = new QuestionDTO(); // QuestionDTO | questionDTO

try { 
    var result = api_instance.updateQuestionUsingPUT(questionDTO);
    print(result);
} catch (e) {
    print("Exception when calling QuestionResourceApi->updateQuestionUsingPUT: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **questionDTO** | [**QuestionDTO**](QuestionDTO.md)| questionDTO | 

### Return type

[**QuestionDTO**](QuestionDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

