import 'package:breakingbad/flavors/flavor_type.dart';
import 'package:breakingbad/flavors/flavors.dart';
import 'package:breakingbad/main.dart' as runner;

Future<void> main() async {
  Flavor.appFlavor = FlavorType.live;
  await runner.main();
}
