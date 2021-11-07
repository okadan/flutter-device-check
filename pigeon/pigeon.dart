import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/pigeon_host_api.g.dart',
  objcHeaderOut: 'ios/Classes/PigeonHostApi.h',
  objcSourceOut: 'ios/Classes/PigeonHostApi.m',
))

@HostApi()
abstract class PigeonHostApi {
  bool deviceCheckIsSupported();
  @async Uint8List deviceCheckGenerateToken();
  bool appAttestServiceIsSupported();
  @async String appAttestServiceGenerateKey();
  @async Uint8List appAttestServiceAttestKey(String keyId, Uint8List clientDataHash);
  @async Uint8List appAttestServiceGenerateAssertion(String keyId, Uint8List clientDataHash);
}
