// ignore_for_file: constant_identifier_names

enum Route {
  HOME,
  PUSH_HISTORY,
  DEVICE_REGISTER,
}

extension RouteExtension on Route {
  String get name {
    switch (this) {
      case Route.HOME:
        return '/';
      case Route.PUSH_HISTORY:
        return '/push/history';
      case Route.DEVICE_REGISTER:
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
