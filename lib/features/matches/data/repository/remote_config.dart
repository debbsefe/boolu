import 'package:firebase_remote_config/firebase_remote_config.dart';

class Config {
  ///fetch football token from remote config
  Future<String> fetchToken(String value) async {
    final RemoteConfig remoteConfig = await RemoteConfig.instance;
    await remoteConfig.fetch(expiration: const Duration(seconds: 0));
    await remoteConfig.activateFetched();
    return remoteConfig.getString(value);
  }
}
