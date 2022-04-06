import 'dart:convert';
import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:webpush_encryption/webpush.dart';
import '../example/main.dart' show bytes;

//TODO: test doesn't seem to work https://github.com/google/webcrypto.dart/issues/20

void main() {
  test('Basic integration test', () async {
    var keyz = WebPushKeys(
      pubKeyBytes: base64.decode(
          "BGviCUiE9bL6HqxXZRLKb3pmHYGq24acYDoE-Hy2aZM9h2gIx0jrQTWh2ksIaFegv6yUQLkpbV7984w0IpvlT-Y="),
      authKeyBytes: Uint8List(16),
      privKeyBytes: base64Decode(
          "MIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQga-gpVIxZJHJ_uUx9ON45Lm5Owp5qbM3o7u0p0qrmoZqhRANCAARr4glIhPWy-h6sV2USym96Zh2BqtuGnGA6BPh8tmmTPYdoCMdI60E1odpLCGhXoL-slEC5KW1e_fOMNCKb5U_m"),
    );
    // this is equivalent to the above key
    assert(keyz ==
        await WebPushKeys.fromBase64(
            "BGviCUiE9bL6HqxXZRLKb3pmHYGq24acYDoE-Hy2aZM9h2gIx0jrQTWh2ksIaFegv6yUQLkpbV7984w0IpvlT-Y=+AAAAAAAAAAAAAAAAAAAAAA==+MIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQga-gpVIxZJHJ_uUx9ON45Lm5Owp5qbM3o7u0p0qrmoZqhRANCAARr4glIhPWy-h6sV2USym96Zh2BqtuGnGA6BPh8tmmTPYdoCMdI60E1odpLCGhXoL-slEC5KW1e_fOMNCKb5U_m")); // importing based on storage format

    var decrypted = String.fromCharCodes(
        (await WebPush.decrypt(keyz, Uint8List.fromList(myPresetMessage1))));

    expect(decrypted, equals("HI"));
  });
}

// let's pretend the server received this request body
Uint8List myPresetMessage1 = Uint8List.fromList([
  27,
  100,
  138,
  108,
  205,
  174,
  43,
  77,
  156,
  207,
  31,
  166,
  34,
  94,
  196,
  48,
  0,
  0,
  16,
  0,
  65,
  4,
  212,
  131,
  148,
  232,
  78,
  42,
  128,
  199,
  141,
  210,
  117,
  62,
  163,
  104,
  1,
  82,
  175,
  199,
  199,
  62,
  174,
  165,
  237,
  129,
  19,
  67,
  135,
  170,
  33,
  37,
  58,
  240,
  209,
  32,
  140,
  195,
  249,
  226,
  138,
  20,
  113,
  23,
  0,
  24,
  104,
  194,
  252,
  142,
  252,
  92,
  91,
  175,
  51,
  65,
  39,
  65,
  117,
  138,
  83,
  17,
  97,
  240,
  69,
  97,
  183,
  180,
  169,
  135,
  138,
  31,
  121,
  23,
  221,
  244,
  254,
  125,
  253,
  236,
  41,
  79,
  36,
  233,
  227
]);
