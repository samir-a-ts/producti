import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: 'initDependecies',
)
void configureDependecies() => initDependecies(sl);
