import 'package:hive/hive.dart';

part 'preventive.g.dart';

final String preventiveKey = 'preventives';

@HiveType(typeId: 0)
class Preventive extends HiveObject {
  @HiveField(0)
  final String setor;

  @HiveField(1)
  final String codigo;

  Preventive({required this.setor, required this.codigo});
}