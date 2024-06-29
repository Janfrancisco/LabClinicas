import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/modules/self_service/documents/widgets/document_box_widget.dart';
import 'package:fe_lab_clinicas_self_service_cb/src/modules/self_service/widget/lab_clinicas_self_service_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class DocumentsScanConfirmPage extends StatelessWidget {
  const DocumentsScanConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    final foto = ModalRoute.of(context)!.settings.arguments as XFile;

    return Scaffold(
      appBar: LabClinicasSelfServiceAppbar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Container(
            width: sizeOf.width * .85,
            margin: const EdgeInsets.only(top: 18),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: LabClinicasTheme.orangeColor)),
            child: Column(
              children: [
                Image.asset('assets/images/foto_confirm_icon.png'),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'CONFIRA A SUA FOTO',
                  style: LabClinicasTheme.titleSmallStyle,
                ),
                const SizedBox(
                  height: 32,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    width: sizeOf.width * .5,
                    child: DottedBorder(
                        dashPattern: const [1, 10, 1, 3],
                        radius: const Radius.circular(16),
                        borderType: BorderType.RRect,
                        strokeWidth: 4,
                        strokeCap: StrokeCap.square,
                        color: LabClinicasTheme.orangeColor,
                        child: Image.file(File(foto.path))),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: sizeOf.width * .8,
                        height: 48,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('TIRAR OUTRA FOTO'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('SALVAR'),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
