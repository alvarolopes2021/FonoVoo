import 'package:fonovoo/core/app_version/iapp_version_service.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionServiceImpl implements IappVersionService {
  static late PackageInfo packageInfo;

  @override
  void initialize() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  @override
  String getAppName() {
    return packageInfo.appName;
  }

  @override
  String getBuildNumber() {
    return packageInfo.buildNumber;
  }

  @override
  String getPackageName() {
    return packageInfo.packageName;
  }

  @override
  String getVersion() {
    return packageInfo.version;
  }
}
