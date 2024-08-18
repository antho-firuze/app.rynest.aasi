import 'package:flutter/material.dart';

import '../../../shared/ui_helper.dart';
import '../../../shared/widgets/button_mee.dart';

class RemoveAccount extends StatelessWidget {
  const RemoveAccount({
    super.key,
    this.onPressedRemove,
  });

  final Function()? onPressedRemove;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                // vSpaceSmall,
                // const LogoAASI(),
                // vSpaceXSmall,
                // Text(
                //   kAppName,
                //   style: captionStyle(context),
                //   textAlign: TextAlign.center,
                // ),
                vSpaceMedium,
                Text(
                  'PERINGATAN !!',
                  textAlign: TextAlign.center,
                  style: heading2Style(context),
                ),
                vSpaceSmall,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ketika anda ingin melakukan menghapus akun, berikut hal-hal yang harus anda ketahui :',
                        style: bodyStyle(context),
                      ),
                      vSpaceSmall,
                      Text(
                        '• Data-data anda (profil, photo, data ujian dan sertifikat lisensi) akan dihapus pada server.',
                        style: bodyStyle(context),
                      ),
                      vSpace(5),
                      Text(
                        '• Anda masih dapat login kembali sebelum masa tenggang berakhir, dan ini otomatis membatalkan proses penghapusan akun.',
                        style: bodyStyle(context),
                      ),
                      vSpace(5),
                      Text(
                        '• Apabila masa tenggang berakhir, anda dapat menghubungi Customer Service untuk meng-aktifkan akun anda kembali. (Selama akun anda belum sepenuhnya terhapus).',
                        style: bodyStyle(context),
                      ),
                      vSpaceSmall,
                      Text(
                        'Note :',
                        style: bodyStyle(context),
                      ),
                      vSpace(5),
                      Text(
                        '- Adapun masa tenggang yaitu 30 Hari terhitung saat anda melakukan penghapusan akun.',
                        style: bodyStyle(context),
                      ),
                      vSpaceSmall,
                      Text(
                        'Jika anda sudah memahami penjelasan diatas, silahkan klik tombol di bawah untuk melanjutkan proses penghapusan akun.',
                        style: bodyStyle(context),
                      ),
                    ],
                  ),
                ),
                vSpaceMedium,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ButtonMee(
                    title: 'Hapus Akun',
                    onPressed: onPressedRemove,
                    color: Colors.red,
                  ),
                ),
                vSpaceMedium,
                Text(
                  '\u00a9 2023 Rynest Technology Indomedia',
                  textAlign: TextAlign.center,
                  style: bodyStyle(context),
                ),
                Text(
                  'Kota Depok - Jawa Barat, Indonesia',
                  style: bodyStyle(context),
                ),
                vSpaceMedium,
              ],
            ),
          ),
        ),
        Center(child: Image.asset('assets/images/artwork.png')),
      ],
    );
  }
}
