import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn/features/home/ui/controllers/vpn_controller.dart';
import 'package:vpn/features/home/ui/widgets/byte_widget.dart';

class ByteRow extends StatelessWidget {
  const ByteRow({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VPNController>();
    final byteIn = ((double.tryParse(controller.status.value?.byteIn ?? '0') ?? 0) / (1024 * 1024)).toStringAsFixed(2);
    final byteOut = ((double.tryParse(controller.status.value?.byteOut ?? '0') ?? 0) / (1024 * 1024)).toStringAsFixed(2);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ByteWidget(status: byteIn, text: 'Download'),
        ByteWidget(status: byteOut, text: 'Upload'),
      ],
    );
  }
}
