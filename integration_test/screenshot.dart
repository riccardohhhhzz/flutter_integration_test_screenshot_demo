import 'dart:convert';
import 'dart:html';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void takeScreenshot(String saveName, GlobalKey rootWidgetKey) async {
  try {
    RenderRepaintBoundary boundary = rootWidgetKey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;
    var image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    final _base64 = base64Encode(pngBytes);
    final anchor =
        AnchorElement(href: 'data:application/octet-stream;base64,$_base64')
          ..download = saveName
          ..target = 'blank';
    document.body!.append(anchor);
    anchor.click();

    //clean
    anchor.remove();
  } catch (e) {
    print(e);
  }
}
