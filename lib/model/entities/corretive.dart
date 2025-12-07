import 'package:hive/hive.dart';

part 'corretive.g.dart';
final String corretiveKey = 'corretives';

@HiveType(typeId: 1)
class Corretive extends HiveObject {
  @HiveField(0)
  final String setor;

  @HiveField(1)
  final String codigo;

  Corretive({required this.setor, required this.codigo});
}