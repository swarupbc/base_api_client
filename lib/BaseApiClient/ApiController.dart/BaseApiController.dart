import 'package:base_api_client/BaseApiClient/APiClientServices/ApiExceptions.dart';
import 'package:base_api_client/BaseApiClient/Helper/DialogHelper.dart';

class BaseAPiController {
  void handleError(error) {
    hideLoading();
    var message = error.message;
    if (error is BadRequestException) {
      DialogHelper.showErrorDialog(desc: message);
    } else if (error is FetchDataException) {
      DialogHelper.showErrorDialog(desc: message);
    } else if (error is ApiNotRespondingException) {
      DialogHelper.showErrorDialog(desc: 'Oops! It took longer to respond');
    } else if (error is UnauthorizedException) {
      DialogHelper.showErrorDialog(desc: message);
    } else if (error is NotFoundException) {
      DialogHelper.showErrorDialog(desc: 'Oops! you are not authorized');
    }
  }

  showLoading([String? message]) {
    DialogHelper.showLoading();
  }

  hideLoading() {
    DialogHelper.hideLoading();
  }
}
