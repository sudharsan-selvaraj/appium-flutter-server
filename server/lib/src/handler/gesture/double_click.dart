import 'package:appium_flutter_server/src/handler/request/request_handler.dart';
import 'package:appium_flutter_server/src/models/api/appium_response.dart';
import 'package:appium_flutter_server/src/models/api/gesture.dart';
import 'package:appium_flutter_server/src/utils/element_helper.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:shelf_plus/shelf_plus.dart';

class DoubleClickHandler extends RequestHandler {
  DoubleClickHandler(super.route);

  @override
  Future<AppiumResponse> handle(Request request) async {
    var sessionId = getSessionId(request);
    GestureModel doubleClick =
        GestureModel.fromJson(await request.body.asJson);

    await ElementHelper.gestureDoubleClick(doubleClick);
    return AppiumResponse(sessionId, null);
  }
}
