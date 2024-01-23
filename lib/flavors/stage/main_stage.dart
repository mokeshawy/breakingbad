import 'package:breakingbad/main.dart' as runner;

import '../flavor_type.dart';
import '../flavors.dart';

Future<void> main() async {
  Flavor.appFlavor = FlavorType.stage;
  await runner.main();
}
