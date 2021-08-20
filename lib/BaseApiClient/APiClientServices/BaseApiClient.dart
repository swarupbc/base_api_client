part of base_api_client;

class BaseApiClient {
  static const int TIME_OUT_DURATION = 20;

  //GET API Call
  Future<dynamic> get(
      String baseUrl, String api, Map<String, String>? headers) async {
    var uri = Uri.parse(baseUrl + api);

    try {
      var response = await http
          .get(uri, headers: headers)
          .timeout(Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'Api taking too long to response', uri.toString());
    }
  }

  Future<dynamic> post(String baseUrl, String api, Map<String, String> headers,
      dynamic payloadObj) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObj);

    try {
      var response = await http
          .post(uri, headers: headers, body: payload)
          .timeout(Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'Api taking too long to response', uri.toString());
    }
  }

  Future<dynamic> put(String baseUrl, String api, Map<String, String> headers,
      dynamic payloadObj) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObj);

    try {
      var response = await http
          .put(uri, headers: headers, body: payload)
          .timeout(Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'Api taking too long to response', uri.toString());
    }
  }

  Future<dynamic> delete(String baseUrl, String api,
      Map<String, String> headers, dynamic payloadObj) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObj);

    try {
      var response = await http
          .delete(uri, headers: headers, body: payload)
          .timeout(Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'Api taking too long to response', uri.toString());
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 403:
        throw UnauthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 404:
        throw NotFoundException(
            'Page not found with status code : ${response.statusCode}',
            response.request!.url.toString());
      case 500:
        throw FetchDataException(
            'Error occured with status code : ${response.statusCode}',
            response.request!.url.toString());
      default:
    }
  }
}
