import 'package:appium_flutter_server/src/driver.dart';
import 'package:appium_flutter_server/src/handler/request/request_handler.dart';
import 'package:appium_flutter_server/src/internal/flutter_element.dart';
import 'package:appium_flutter_server/src/models/api/appium_response.dart';
import 'package:appium_flutter_server/src/utils/element_helper.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:shelf_plus/shelf_plus.dart';

class ClickHandler extends RequestHandler {
  ClickHandler(super.route);

  @override
  Future<AppiumResponse> handle(Request request) async {
    var sessionId = getSessionId(request);
    var elementId = getElementId(request);
    var session = FlutterDriver.instance.getSessionOrThrow();

    FlutterElement element = await session!.elementsCache.get(elementId);
    await ElementHelper.click(element);
    return AppiumResponse(sessionId, null);
  }
}
