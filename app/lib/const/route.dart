// ignore_for_file: constant_identifier_names

enum KRoute {
  HOME,
  PUSH_HISTORY,
  DEVICE_REGISTER,
}

extension RouteExtension on KRoute {
  String get name {
    switch (this) {
      case KRoute.HOME:
        return '/';
      case KRoute.PUSH_HISTORY:
        return '/push/history';
      case KRoute.DEVICE_REGISTER:
        return '/push/register';
      default:
        return '/';
    }
  }
}

////*
/*

GetPage(name: '/', page: () => MainScreen()),
GetPage(name: '/push/history', page: () => PushHistoryScreen()),
GetPage(name: '/push/register', page: () => DeviceRegisterScreen()),
],*/
