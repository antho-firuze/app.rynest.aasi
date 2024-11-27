import 'package:app.rynest.aasi/common/widgets/logo/logo.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/common/widgets/one_ui/one_ui_nested_scroll_view.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/localization/string_hardcoded.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  static const routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return MyUI(
      enabledSafeArea: false,
      child: Scaffold(
        body: OneUINestedScrollView(
          foregroundColor: oWhite,
          expandedWidget: Text(''.hardcoded).tsHeadlineL().center().clr(oWhite),
          collapsedWidget: Text('Tentang Kami'.hardcoded).tsTitleL().ellipsis().clr(oWhite).maxLn(1),
          background: Center(
            child: LogoArtWork(
              color: oWhite,
              child: Logo(width: context.screenWidthRatio(.6, .5), src: 'assets/images/logo_aasi_2.png'),
            ),
          ),
          // actions: [
          //   IconButton(
          //     onPressed: () {},
          //     icon: const Icon(Icons.more_vert),
          //   ),
          //   // IconButton(
          //   //   onPressed: () {},
          //   //   icon: const Icon(Icons.search),
          //   // ),
          // ],
          sliverList: SliverList.list(
            children: [
              20.height,
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text('Profil AASI'.hardcoded).tsHeadlineL().bold(),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text(
                    'AASI atau bisa disebut Asosiasi Asuransi Syariah Indonesia adalah perkumpulan perusahaan - perusahaan asuransi syariah dan reasuransi syariah Indonesia.'),
              ),

              // TUJUAN
              30.height,
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text('Tujuan'.hardcoded).tsHeadlineL().bold(),
              ),
              20.height,
              Center(child: SizedBox(height: 70, child: Image.asset('assets/icons/ic-vision.png'))),
              10.height,
              const Padding(
                padding: EdgeInsets.only(right: 16),
                child: HtmlWidget('''
                  <ol type="1" align="justify">
              
                    <li>Menampung aspirasi para Anggota AASI dan mewujudkan peran serta industri asuransi syariah dan reasuransi syariah dalam upaya meningkatkan kesejahteraan masyarakat.</li>

                    <li>Menciptakan dan memelihara kerjasama yang saling memberikan maslahat untuk mengembangkan industri asuransi syariah dan reasuransi syariah di Indonesia.</li>

                    <li>Mengatur, mengawasi, dan memberikan konsultasi kepada perusahaan asuransi syariah dan reasuransi syariah dalam melaksanakan usahanya, termasuk tetapi tidak terbatas pada membuat kode etik perusahaan asuransi dan reasuransi syariah serta kode etik tenaga pemasar asuransi syariah.</li>

                    <li>Melakukan mediasi dan/atau adjudikasi atas permasalahan yang timbul di antara Anggota AASI.</li>

                    <li>Meningkatkan profesionalisme karyawan dan tenaga pemasar dari Anggota AASI.</li>

                    <li>Meningkatkan literasi dan inklusi keuangan khususnya mengenai literasi dan inklusi asuransi syariah dan reasuransi syariah di Indonesia dengan cara melakukan sosialisasi dan Pendidikan kepada masyarakat.</li>

                    <li>Sebagai asosiasi yang mewakili kepentingan Anggota AASI baik ditingkat nasional maupun internasional.</li>

                    <li>Sebagai mitra pemerintah Republik Indonesia dalam pembinaan dan pengawasan kegiatan usaha asuransi syariah dan reasuransi syariah guna meningkatkan peran serta Anggota AASI di dalam perekonomian nasional.</li>

                    <li>Sebagai wahana komunikasi, pusat data dan informasi mengenai hal-hal yang terkait dengan kegiatan usaha asuransi syariah dan reasuransi syariah di Indonesia.</li>

                    <li>Sebagai sarana mendorong terciptanya kondisi regulasi industri asuransi syariah dan reasuransi syariah yang mendukung kepentingan berimbang antara kepentingan Anggota AASI, Pemerintah dan kepentingan masyarakat, khususnya peserta, tertanggung dan penerima maslahat.</li>

                  </ol>'''),
              ),

              // KEGIATAN
              30.height,
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text('Kegiatan'.hardcoded).tsHeadlineL().bold(),
              ),
              20.height,
              Center(child: SizedBox(height: 70, child: Image.asset('assets/icons/ic-mission.png'))),
              10.height,
              const Padding(
                padding: EdgeInsets.only(right: 16),
                child: HtmlWidget('''
                  <ol type="1" align="justify" class="mb-0">

                    <li>Melaksanakan tugas dan kegiatan sebagaimana diatur dalam peraturan perasuransian dan ketentuan peraturan perundang-undangan lainnya yang berlaku, termasuk tetapi tidak terbatas pada:</li>

                    <ol type="a" align="justify">

                        <li>

                            Menyusun, mengubah dan mengawasi pelaksanaan kode etik perusahaan asuransi syariah dan reasuransi Syariah, dan kode etik tenaga pemasar asuransi syariah serta peraturan lainnya yang terkait dalam rangka memelihara terciptanya persaingan pasar yang sehat.

                        </li>

                        <li>

                            Mengkoordinir pelaksanaan pembentukan profil risiko, tabel mortalita, dan lainnya (jika diperlukan).

                        </li>

                        <li>

                            Mengkoordinir upaya untuk mengoptimalkan kapasitas retensi asuransi nasional.

                        </li>

                        <li>

                            Mengkoordinir upaya bersama atau pembentukan konsorsium diantara Anggota AASI untuk menutup asuransi mikro syariah dan/atau risiko khusus.

                        </li>

                        <li>

                            Melaksanakan, menetapkan dan menerbitkan sertifikasi tenaga pemasar asuransi syariah.

                        </li>

                        <li>

                            Melaksanakan pendaftaran tenaga pemasar asuransi syariah dan melaporkan pelaksanaannya kepada instansi perasuransian yang berwenang.

                        </li>

                        <li>

                            Mengkoordinir kerjasama antar lembaga, baik nasional maupun internasional guna mendorong terciptanya industri asuransi syariah dan reasuransi syariah yang sehat dan baik.

                        </li>

                        <li>

                            Mendukung program-program pemerintah yang terkait dengan literasi dan inklusi keuangan khususnya mengenai literasi dan inklusi asuransi syariah dan reasuransi syariah di Indonesia.

                        </li>

                    </ol>

                    <li>Melakukan konsultasi berkala atas pelaksanaan tugas dan kegiatan AASI kepada Otoritas Jasa Keuangan (OJK) dan instansi pemerintah Republik Indonesia yang berwenang di bidang perasuransian.</li>

                    <li>Mengumpulkan dan menyediakan data perkembangan dan tingkat pertumbuhan industri asuransi Syariah dan reasuransi syariah.</li>

                    <li>Menjalin dan membina hubungan baik dengan pemerintah Republik Indonesia dan lembaga/badan non pemerintah sehubungan dengan regulasi dan kegiatan usaha Anggota AASI.</li>

                    <li>Membantu upaya penyelesaian perselisihan antar Anggota AASI.</li>

                    <li>Berdasarkan pertimbangan AASI, melakukan tindakan yang diperlukan bilamana terdapat indikasi-indikasi awal pelanggaran yang dilakukan oleh Anggota AASI terhadap arahan, kode etik atau panduan-panduan lainnya yang diterbitkan oleh AASI. </li>

                    <li>Membuat standar polis asuransi syariah sebagaimana diamanatkan oleh peraturan perasuransian.</li>

                    <li>Melaksanakan kegiatan lain sehubungan dengan maksud dan tujuan AASI bagi kepentingan Anggota AASI sesuai dengan peraturan yang berlaku.</li>                                        

                </ol>
'''),
              ),
              30.height,
            ],
          ),
        ),
      ),
    );
  }
}
