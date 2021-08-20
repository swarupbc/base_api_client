import 'package:base_api_client/BaseApiClient/ApiController.dart/BaseApiController.dart';
import 'package:base_api_client/base_api_client.dart';

class TestApi with BaseAPiController {
  void getData() async {
    showLoading();
    var response = await BaseApiClient()
        .get('https://jsonplaceholder.typicode.com', '/todos/1', Map())
        .catchError(handleError);

    if (response == null) return;
    hideLoading();
    print(response);
  }

  void postData() async {
    showLoading();
    var data = {"message": "Testing post"};
    var response = await BaseApiClient()
        .post('https://jsonplaceholder.typicode.com', '/posts', Map(), data)
        .catchError(handleError);

    if (response == null) return;
    hideLoading();
    print(response);
  }
}
