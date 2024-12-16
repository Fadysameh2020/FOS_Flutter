import 'package:flutter/material.dart';

import '../app_router/routes.dart';

void notificationOnTap(
    {required String? type, required String? info, BuildContext? ctx}) async {
  BuildContext? context =
      ctx ?? AppRouter.router.routerDelegate.navigatorKey.currentContext!;
  if (type == null || type.isEmpty) {
    return;
  }
  switch (type) {
    case 'test':
      break;
    default:
      print('unhandled type: $type');
  }
}
