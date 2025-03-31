import 'package:flutter/material.dart';
import 'package:relatorio/screens/texts/formatted_text.dart';

class ButtonNav extends StatelessWidget {
  const ButtonNav({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FormattedTextWidget()),
        );
      },
      child: const Text("Gerar Relatório"),
    );
  }
}
