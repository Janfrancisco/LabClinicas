import 'package:flutter/material.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class DocumentBoxWidget extends StatelessWidget {
  const DocumentBoxWidget({
    super.key,
    required this.uploaded,
    required this.icon,
    required this.label,
  });
  final bool uploaded;
  final Widget icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: LabClinicasTheme.orangeColor),
          color: uploaded ? LabClinicasTheme.lightOrangeColor : Colors.white,
        ),
        child: Column(
          children: [Expanded(child: icon), Text(label)],
        ),
      ),
    );
  }
}
