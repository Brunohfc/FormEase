import 'package:hive/hive.dart';
import 'package:relatorio/model/entities/corrective.dart';

const Map<String, List<String>> corretiveSeedMap = {
  'GP': [
    'CM4025','CM4026','CM4029','CM4031','CM4047','CM4050','CM4052','CM4054','CM4057','CM4058',
    'CM4059','CM4117','CM4119','CM4120','CM4121','CM4122','CM4123','CM4124','CM4125','CP4201',
    'CP4202','CP4205'
  ],
  'PP / Utilitarios': [
    'CM4416','CM4419','CV54','CV55','CV56','CV58','EE01','GD50','GD51','GD52','VE50','VE52',
    'VE53','VE54','SI58','SM100','SR01','SR02','SR03','C259_02'
  ],
  'infra': [
    'ES2903','ES2907','RE2401','RE2503','RE2504','PT6010','PT6011','PT6012','PM3601','PM3904',
    'TE5011','TE5013','TE5015','TE5016','TE5106','TE5107','TE6208','TP5604','TP5605'
  ],
  'Perfuração': ['PF1602','PF1806','PF1201','PF1202','PF1204'],
  'Escavação': ['ES3202','ES3203','ES3101','ES3301','ES2906','EE01'],
};

Future<void> seedCorretive(Box<Corretive> box) async {
  if (box.isNotEmpty) return;
  await box.addAll(
    corretiveSeedMap.entries
        .expand((entry) => entry.value
            .map((codigo) => Corretive(setor: entry.key, codigo: codigo)))
        .toList(),
  );
}