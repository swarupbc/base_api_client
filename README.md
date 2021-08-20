# base_api_client

## Features 

1. Easy http REST API Calling (GET, POST, PUT, DELETE)
2. ERROR handling with alert dialog
3. Loading Screen while calling any API


## Use this package
 
add this line to pubspec.yaml

```yaml

   dependencies:

    base_api_client: ^0.0.2


```

import package

```dart

    import 'package:base_api_client/base_api_client.dart';

```

## Example

```dart

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

```

# Contri



## LICENSE


```

MIT License

Copyright (c) 2021 Swarup Bhanja Chowdhury

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
