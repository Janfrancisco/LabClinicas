import 'package:fe_lab_clinicas_self_service_cb/src/modules/self_service/self_sevice_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class LabClinicasSelfServiceAppbar extends LabClinicasAppBar {
  LabClinicasSelfServiceAppbar({super.key})
      : super(
          actions: [
            PopupMenuButton(
                child: const IconPopupMenuWidget(),
                itemBuilder: (_) {
                  return [
                    const PopupMenuItem(
                      value: 1,
                      child: Text('Reiniciar processo'),
                    ),
                  ];
                },
                onSelected: (value) async {
                  Injector.get<SelfSeviceController>().restartProcess();
                })
          ],
        );
}
