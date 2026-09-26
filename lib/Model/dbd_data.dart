import 'package:flutter/material.dart';

class DbdSlide {
  final String title;
  final String content;
  final String? imageUrl;
  final String? illustrationType;
  final String? detail;

  DbdSlide({
    required this.title,
    required this.content,
    this.imageUrl,
    this.illustrationType,
    this.detail,
  });
}

class DbdTopic {
  final String id;
  final String title;
  final String description;
  final List<DbdSlide> slides;
  final String summary;

  DbdTopic({
    required this.id,
    required this.title,
    required this.description,
    required this.slides,
    required this.summary,
  });
}

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final String explanation;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    required this.explanation,
  });
}

class SymptomCard {
  final String name;
  final IconData icon;
  final String detail;
  final Color color;
  final String? imageUrl;

  const SymptomCard({
    required this.name,
    required this.icon,
    required this.detail,
    required this.color,
    this.imageUrl,
  });
}

class WarningSign {
  final String title;
  final IconData icon;
  final String description;
  final String risk;
  final String category; // 'severe', 'warning', 'mild'
  final String? imageUrl;

  const WarningSign({
    required this.title,
    required this.icon,
    required this.description,
    required this.risk,
    this.category = 'warning',
    this.imageUrl,
  });
}

class PreventionItem {
  final String title;
  final String description;
  final IconData icon;

  const PreventionItem({
    required this.title,
    required this.description,
    required this.icon,
  });
}

class DbdData {
  static final List<DbdTopic> topics = [
    // =========================================
    // 1. PENGERTIAN DBD
    // =========================================
    DbdTopic(
      id: 'pengertian',
      title: 'Pengertian DBD',
      description: 'Pelajari apa itu DBD, penyebab, dan cara penularannya.',
      summary:
          'DBD adalah penyakit menular akibat virus dengue yang ditularkan nyamuk Aedes aegypti. Ditandai demam mendadak 2–7 hari, lemah, gelisah, nyeri ulu hati, dan tanda perdarahan kulit. Pada kondisi berat dapat terjadi Dengue Shock Syndrome (DSS) akibat kebocoran plasma.',
      slides: [
        DbdSlide(
          title: 'Definisi DBD',
          content:
              'Demam Berdarah Dengue (DBD) adalah penyakit menular yang disebabkan oleh virus dengue dan ditularkan oleh nyamuk Aedes aegypti, yang ditandai dengan demam mendadak selama 2–7 hari tanpa penyebab yang jelas.',
          illustrationType: 'virus',
          imageUrl: 'assets/pengertian/definisi_dbd.jpg',
          detail:
              'DBD disertai dengan lemah/lesu, gelisah, nyeri ulu hati, dan tanda perdarahan di kulit berupa bintik merah, lebam (ecchymosis), atau ruam. Kadang-kadang disertai mimisan, berak darah, muntah darah, kesadaran menurun, atau renjatan (syok).',
        ),
        DbdSlide(
          title: 'Demam Dengue vs DBD',
          content:
              'Demam Dengue adalah demam virus akut yang disertai sakit kepala, nyeri otot, nyeri tulang, penurunan sel darah putih, dan ruam-ruam. DBD adalah demam dengue yang disertai pembesaran hati dan manifestasi perdarahan.',
          illustrationType: 'blood',
          imageUrl: 'assets/pengertian/demam_dengue_vs_dbd.jpg',
          detail:
              'Perbedaan utama: Demam Dengue tidak disertai pembesaran hati (hepatomegali). Demam Berdarah Dengue (DBD) disertai pembesaran hati dan manifestasi perdarahan yang khas seperti uji tourniquet positif, petekie, atau perdarahan mukosa.',
        ),
        DbdSlide(
          title: 'Dengue Shock Syndrome (DSS)',
          content:
              'Pada keadaan yang parah, dapat terjadi kegagalan sirkulasi darah dan pasien jatuh dalam syok hipovolemik akibat kebocoran plasma. Keadaan ini disebut Dengue Shock Syndrome (DSS).',
          illustrationType: 'critical',
          imageUrl: 'assets/pengertian/dss.jpg',
          detail:
              'DSS adalah komplikasi paling berat dari DBD. Kebocoran plasma menyebabkan penurunan volume darah secara drastis sehingga tekanan darah turun dan organ-organ tubuh tidak mendapat suplai darah yang cukup. DSS memerlukan penanganan medis darurat segera.',
        ),
        DbdSlide(
          title: 'Nyamuk Penular DBD',
          content:
              'DBD ditularkan melalui gigitan nyamuk Aedes aegypti betina yang telah terinfeksi virus dengue. Nyamuk ini aktif menggigit pada pagi dan sore hari, serta berkembang biak di genangan air bersih.',
          illustrationType: 'mosquito',
          imageUrl: 'assets/pengertian/nyamuk_penular.jpg',
          detail:
              'Ciri nyamuk Aedes aegypti: tubuh berwarna hitam dengan bercak putih, ukuran kecil, menggigit pada siang hari (pukul 08.00–10.00 dan 15.00–17.00). Tempat berkembang biak favorit: bak mandi, pot bunga, wadah air minum burung, dan barang bekas yang menampung air.',
        ),
        DbdSlide(
          title: 'Cara Penularan DBD',
          content:
              'DBD tidak menular langsung dari satu orang ke orang lain. Penularan hanya terjadi melalui perantara nyamuk Aedes aegypti yang telah menggigit penderita DBD dan membawa virus dengue.',
          illustrationType: 'community',
          imageUrl: 'assets/pengertian/cara_penularan.jpg',
          detail:
              'Alur penularan:\n1. Nyamuk menggigit penderita DBD\n2. Virus dengue masuk ke tubuh nyamuk\n3. Virus berkembang dalam tubuh nyamuk selama 8–12 hari\n4. Nyamuk menggigit orang sehat\n5. Virus dengue masuk ke tubuh orang sehat\n6. Gejala muncul 4–10 hari setelah gigitan.',
        ),
      ],
    ),

    // =========================================
    // 2. GEJALA DBD
    // =========================================
    DbdTopic(
      id: 'gejala',
      title: 'Gejala DBD',
      description: 'Kenali gejala umum yang sering muncul pada penderita DBD.',
      summary:
          'Gejala DBD meliputi demam mendadak 2–7 hari, nyeri kepala, nyeri otot dan sendi, mual/muntah, ruam merah, dan uji tourniquet positif. Waspadai bila disertai tanda perdarahan atau penurunan trombosit.',
      slides: [],
    ),

    // =========================================
    // 3. TANDA BAHAYA DBD
    // =========================================
    DbdTopic(
      id: 'tanda_bahaya',
      title: 'Tanda Bahaya DBD',
      description: 'Waspadai kondisi yang membutuhkan penanganan segera.',
      summary:
          'Tanda bahaya DBD (Warning Signs) meliputi: nyeri perut hebat, muntah terus-menerus, perdarahan mukosa, letargi/gelisah, pembesaran hepar >2 cm, dan peningkatan hematokrit disertai penurunan trombosit cepat. Jika muncul, SEGERA rujuk ke fasilitas kesehatan.',
      slides: [],
    ),

    // =========================================
    // 4. TINDAKAN AWAL
    // =========================================
    DbdTopic(
      id: 'tindakan',
      title: 'Tindakan Awal',
      description:
          'Ketahui langkah yang harus dilakukan saat tanda bahaya muncul.',
      summary:
          'Jika tanda bahaya DBD muncul, segera bawa pasien ke fasilitas kesehatan. Berikan parasetamol untuk demam ≥38°C. JANGAN berikan golongan salisilat, natrium diklofenak, ibuprofen, atau NSAID lain. Pantau kondisi dan jangan tunda penanganan.',
      slides: [],
    ),

    // =========================================
    // 5. PENCEGAHAN DBD
    // =========================================
    DbdTopic(
      id: 'pencegahan',
      title: 'Pencegahan DBD',
      description: 'Pelajari 3M Plus dan cara mencegah gigitan nyamuk.',
      summary:
          'Pencegahan DBD dilakukan dengan metode 3M Plus: Menguras, Menutup, dan Mendaur ulang barang bekas, ditambah langkah plus seperti memakai obat nyamuk, kelambu, serta memantau jentik nyamuk secara rutin.',
      slides: [
        DbdSlide(
          title: '3M Plus',
          content:
              '3M Plus adalah program nasional pencegahan DBD yang terdiri dari tiga gerakan utama:\n\n• Menguras tempat penampungan air secara rutin\n• Menutup rapat semua wadah air\n• Mendaur ulang / membuang barang bekas yang dapat menampung air',
          imageUrl: 'assets/pencegahan/tiga_m_plus.jpg',
          illustrationType: 'prevention',
          detail:
              '"Plus" dalam 3M Plus mengacu pada langkah tambahan:\n\n• Gunakan lotion atau obat anti-nyamuk\n• Pasang kelambu saat tidur\n• Pasang kawat kasa pada jendela dan ventilasi\n• Pelihara ikan pemakan jentik (cupang/nila/kepala timah)\n• Tanam tanaman pengusir nyamuk (lavender, sereh wangi, zodia)\n• Jangan menggantung pakaian kotor di dalam rumah',
        ),
        DbdSlide(
          title: 'Menguras Tempat Air',
          content:
              'Kuras dan sikat tempat penampungan air minimal 1x seminggu untuk membasmi telur dan jentik nyamuk. Lakukan pada:\n\n• Bak mandi dan ember\n• Vas bunga dan pot berair\n• Tempat minum hewan peliharaan\n• Wadah penampungan lainnya',
          imageUrl: 'assets/pencegahan/menguras_tempat.jpg',
          illustrationType: 'drain',
          detail:
              'Menguras saja tidak cukup — sikat juga dinding bagian dalam bak mandi karena telur nyamuk menempel di permukaan.\n\nTelur nyamuk Aedes aegypti tahan kering hingga berbulan-bulan dan akan menetas kembali saat terkena air. Oleh karena itu, menguras harus dilakukan secara rutin setiap minggu.',
        ),
        DbdSlide(
          title: 'Menutup Tempat Air',
          content:
              'Tutup rapat semua wadah penampungan air agar nyamuk tidak bisa masuk dan bertelur. Pastikan:\n\n• Gunakan penutup yang rapat dan pas\n• Pastikan tidak ada celah di tepi penutup\n• Tutup kembali setelah selesai digunakan\n• Periksa kondisi wadah setiap hari',
          imageUrl: 'assets/pencegahan/menutup_tempat.jpg',
          illustrationType: 'cover',
          detail:
              'Nyamuk Aedes aegypti hanya butuh sedikit air yang tergenang untuk bertelur. Wadah terbuka seperti tandon air, drum, kendi, dan ember yang tidak ditutup rapat adalah tempat favorit nyamuk untuk bertelur.\n\nWadah terbuka bisa menjadi sarang jentik dalam waktu 1–2 hari saja.',
        ),
        DbdSlide(
          title: 'Mendaur Ulang Barang Bekas',
          content:
              'Barang bekas yang menampung air hujan bisa menjadi sarang nyamuk. Lakukan langkah berikut:\n\n• Pilah dan daur ulang botol plastik & kaleng\n• Buang air yang tergenang di wadah bekas\n• Simpan barang bekas di tempat kering & tertutup\n• Kubur atau singkirkan ban bekas di sekitar rumah',
          imageUrl: 'assets/pencegahan/daur_ulang.jpg',
          illustrationType: 'recycle',
          detail:
              'Barang-barang bekas seperti ban, botol plastik, kaleng, dan wadah lainnya yang dibiarkan di luar rumah sangat mudah menampung air hujan.\n\nJangan biarkan sampah menampung air — daur ulang secara rutin dan pastikan lingkungan sekitar rumah selalu bersih dari genangan.',
        ),
        DbdSlide(
          title: 'Langkah Plus Tambahan',
          content:
              'Selain 3M, terapkan langkah PLUS untuk perlindungan lebih maksimal:\n\n• Gunakan losion / obat anti-nyamuk saat beraktivitas\n• Pasang kawat kasa di ventilasi dan jendela\n• Pelihara ikan pemakan jentik di kolam\n• Jangan menggantung pakaian kotor di dalam kamar',
          imageUrl: 'assets/pencegahan/langkah_plus.jpg',
          illustrationType: 'protection',
          detail:
              'Ikan cupang, ikan nila, atau ikan kepala timah sangat efektif memakan jentik nyamuk di kolam atau bak yang tidak bisa dikuras secara rutin.\n\nTanaman alami pengusir nyamuk yang terbukti efektif:\n• Lavender\n• Sereh wangi\n• Zodia\n\nTanam di sekitar rumah untuk perlindungan alami yang ramah lingkungan.',
        ),
        DbdSlide(
          title: 'Pantau Jentik Nyamuk',
          content:
              'Lakukan PSN (Pemberantasan Sarang Nyamuk) secara berkala. Periksa jentik di:\n\n• Bak mandi dan ember\n• Vas bunga atau pot air\n• Tempat minum hewan peliharaan\n• Gunakan senter bila perlu\n• Bersihkan segera jika ditemukan jentik',
          illustrationType: 'check',
          imageUrl: 'assets/pencegahan/pantau_jentik.jpg',
          detail:
              'Jentik nyamuk Aedes aegypti berwarna hitam kecil dan bergerak aktif di permukaan air — mudah terlihat jika diterangi senter.\n\nPemeriksaan jentik sebaiknya dilakukan 1x seminggu, bersamaan dengan kegiatan menguras.\n\nProgram Jumantik (Juru Pemantau Jentik) dari puskesmas juga membantu memantau jentik di lingkungan sekitar Anda.',
        ),
      ],
    ),
  ];

  // =========================================
  // DATA GEJALA (7 Kartu Interaktif)
  // =========================================
  static const List<SymptomCard> symptoms = [
    SymptomCard(
      name: 'Demam Mendadak',
      icon: Icons.thermostat_outlined,
      color: Color(0xFFE53935),
      imageUrl: 'assets/gejala/demam_mendadak.jpg',
      detail:
          'Demam pada DBD muncul secara mendadak tanpa penyebab yang jelas, berlangsung 2–7 hari. Suhu tubuh dapat mencapai 39°C–40°C. Demam bersifat tinggi dan terus-menerus. Fase ini disebut "fase demam" — waspadai saat demam mulai turun karena merupakan fase kritis.',
    ),
    SymptomCard(
      name: 'Nyeri Kepala & Mata',
      icon: Icons.sick_outlined,
      color: Color(0xFFFF7043),
      imageUrl: 'assets/gejala/nyeri_kepala_mata.jpg',
      detail:
          'Sakit kepala pada DBD terasa berat, terutama di bagian depan kepala dan di belakang bola mata (retro-orbital). Nyeri mata terasa seperti ditusuk-tusuk, terutama saat menggerakkan bola mata. Ini merupakan ciri khas demam dengue yang membedakannya dari demam biasa.',
    ),
    SymptomCard(
      name: 'Nyeri Otot & Sendi',
      icon: Icons.accessibility_new_outlined,
      color: Color(0xFFFF8F00),
      imageUrl: 'assets/gejala/nyeri_otot_sendi.jpg',
      detail:
          'DBD sering disebut "breakbone fever" karena nyeri tulang dan sendi yang dirasakan sangat hebat. Nyeri pegal menyebar ke seluruh tubuh: kepala, mata, otot, tulang, dan sendi. Nyeri ini dapat sangat mengganggu dan membuat penderita tidak bisa beraktivitas normal.',
    ),
    SymptomCard(
      name: 'Mual & Muntah',
      icon: Icons.sick,
      color: Color(0xFF8D6E63),
      imageUrl: 'assets/gejala/mual_muntah.jpg',
      detail:
          'Mual dan muntah merupakan gejala umum DBD akibat efek virus pada saluran pencernaan. Jika muntah terjadi terus-menerus (lebih dari 3 kali dalam 24 jam), ini sudah termasuk WARNING SIGN yang memerlukan penanganan segera di fasilitas kesehatan.',
    ),
    SymptomCard(
      name: 'Ruam & Bintik Merah',
      icon: Icons.grid_view_rounded,
      color: Color(0xFFD81B60),
      imageUrl: 'assets/rash.png',
      detail:
          'Tanda perdarahan di kulit berupa bintik merah (petekie), lebam (ecchymosis), atau ruam yang tidak hilang saat ditekan dengan jari (blanching test negatif). Ruam biasanya muncul pada hari ke 3–5 sejak demam. Uji Tourniquet positif juga menandakan perdarahan kapiler.',
    ),
    SymptomCard(
      name: 'Nyeri Ulu Hati',
      icon: Icons.personal_injury_outlined,
      color: Color(0xFF5C6BC0),
      imageUrl: 'assets/gejala/nyeri_ulu_hati.jpg',
      detail:
          'Nyeri ulu hati (epigastric pain) dan nyeri tekan perut kanan atas (area hati) adalah gejala yang khas pada DBD. Nyeri perut hebat yang terus-menerus merupakan WARNING SIGN yang menandakan perburukan kondisi. Segera bawa ke fasilitas kesehatan jika nyeri perut memberat.',
    ),
    SymptomCard(
      name: 'Lemas & Gelisah',
      icon: Icons.hotel_outlined,
      color: Color(0xFF26A69A),
      imageUrl: 'assets/gejala/lemas_gelisah.jpg',
      detail:
          'Rasa lemah/lesu (malaise) dan gelisah adalah gejala umum DBD sejak awal. Lemah berat di mana pasien tidak mampu duduk/berdiri sendiri, atau gelisah mendadak, termasuk dalam WARNING SIGN yang menandakan kondisi memburuk. Pada anak, gelisah dan rewel mendadak perlu diwaspadai.',
    ),
  ];

  // =========================================
  // DATA TANDA BAHAYA (berdasarkan klasifikasi klinis)
  // =========================================
  static const List<WarningSign> warningSigns = [
    // --- DENGUE BERAT (Severe Dengue) ---
    WarningSign(
      title: 'Syok / Kaki-Tangan Pucat & Dingin',
      icon: Icons.thermostat_outlined,
      category: 'severe',
      imageUrl: 'assets/tanda_bahaya/syok_new.jpg',
      description:
          'Tanda syok (Dengue Shock Syndrome): kaki/tangan tampak pucat, waktu pengisian kapiler >2 detik, kaki/tangan teraba dingin, nadi lemah atau tidak teraba, nadi cepat. Ini adalah tanda DENGUE BERAT yang darurat.',
      risk:
          'Syok terjadi akibat perembesan plasma hebat yang menyebabkan volume darah turun drastis. Tanpa penanganan segera, dapat berakibat fatal. RUJUK SEGERA ke rumah sakit.',
    ),
    WarningSign(
      title: 'Sesak Napas / Napas Cepat',
      icon: Icons.air_outlined,
      category: 'severe',
      imageUrl: 'assets/tanda_bahaya/sesak_napas_new.jpg',
      description:
          'Sesak napas dan napas cepat pada DBD berat menandakan penumpukan cairan di rongga paru (efusi pleura) akibat kebocoran plasma yang masif.',
      risk:
          'Efusi pleura mengganggu fungsi pernapasan. Merupakan tanda DENGUE BERAT yang memerlukan rawat inap dan pemantauan intensif.',
    ),
    WarningSign(
      title: 'Muntah Darah / BAB Hitam',
      icon: Icons.water_drop_outlined,
      category: 'severe',
      imageUrl: 'assets/tanda_bahaya/muntah_darah.jpg',
      description:
          'Muntah darah atau cairan berwarna coklat seperti kopi, serta BAB berdarah atau berwarna hitam (melena), menandakan perdarahan saluran cerna yang berat.',
      risk:
          'Perdarahan saluran cerna adalah tanda DENGUE BERAT. Memerlukan penanganan medis darurat segera. JANGAN tunda membawa pasien ke rumah sakit.',
    ),
    WarningSign(
      title: 'Penurunan Kesadaran',
      icon: Icons.sentiment_very_dissatisfied_outlined,
      category: 'severe',
      imageUrl: 'assets/tanda_bahaya/penurunan_kesadaran_new.jpg',
      description:
          'Penurunan kesadaran, penurunan frekuensi denyut nadi, ikterik (kulit/mata kuning), nyeri perut hebat, dan tidak BAK selama ≥6 jam adalah tanda gangguan fungsi organ berat.',
      risk:
          'Gangguan fungsi organ (otak, jantung, hati, ginjal) merupakan tanda DENGUE BERAT yang paling mengancam jiwa. RUJUK SEGERA.',
    ),

    // --- DENGUE DENGAN WARNING SIGNS ---
    WarningSign(
      title: 'Nyeri Perut Hebat',
      icon: Icons.personal_injury_outlined,
      category: 'warning',
      imageUrl: 'assets/tanda_bahaya/nyeri_perut_new.jpg',
      description:
          'Nyeri perut dan nyeri tekan pada perut kanan atas (area hati) yang terus-menerus. Ini termasuk warning sign dengue yang memerlukan evaluasi segera.',
      risk:
          'Nyeri perut hebat menandakan kemungkinan perdarahan intraabdominal atau pembesaran hati. Pasien perlu dirujuk ke rumah sakit untuk pemantauan.',
    ),
    WarningSign(
      title: 'Muntah Terus-menerus',
      icon: Icons.sick,
      category: 'warning',
      imageUrl: 'assets/tanda_bahaya/muntah_terus_menerus.jpg',
      description:
          'Muntah yang terjadi terus-menerus menyebabkan pasien tidak dapat minum cairan dengan cukup, sehingga risiko dehidrasi meningkat. Termasuk warning sign dengue.',
      risk:
          'Muntah persisten menyebabkan dehidrasi berat. Anak yang tidak dapat minum perlu diberikan cairan kristaloid intravena. RUJUK untuk rawat inap di rumah sakit.',
    ),
    WarningSign(
      title: 'Perdarahan Mukosa',
      icon: Icons.bloodtype_outlined,
      category: 'warning',
      imageUrl: 'assets/tanda_bahaya/perdarahan_mukosa_rev.jpg',
      description:
          'Perdarahan dari selaput lendir (mukosa): mimisan (epistaksis) atau gusi berdarah. Ini menandakan trombosit sudah sangat rendah dan kemampuan pembekuan darah terganggu.',
      risk:
          'Perdarahan mukosa menunjukkan kadar trombosit kritis. Termasuk warning sign yang memerlukan pemantauan laboratorium ketat dan kemungkinan rawat inap.',
    ),
    WarningSign(
      title: 'Letargi / Gelisah Mendadak',
      icon: Icons.psychology_outlined,
      category: 'warning',
      imageUrl: 'assets/tanda_bahaya/letargi.jpg',
      description:
          'Letargi (sangat mengantuk, tidak aktif, sulit diajak komunikasi) atau sebaliknya gelisah mendadak. Terutama pada anak, ini adalah tanda warning sign yang serius.',
      risk:
          'Perubahan perilaku mendadak mengindikasikan gangguan aliran darah ke otak. Merupakan warning sign yang memerlukan evaluasi segera di fasilitas kesehatan.',
    ),
    WarningSign(
      title: 'Pembesaran Hati (Hepar) > 2 cm',
      icon: Icons.monitor_heart_outlined,
      category: 'warning',
      imageUrl: 'assets/tanda_bahaya/pembesaran_hati.jpg',
      description:
          'Pembesaran hati melebihi 2 cm dari bawah tulang iga kanan. Dapat terdeteksi saat dokter memeriksa perut pasien. Disertai nyeri tekan di perut kanan atas.',
      risk:
          'Hepatomegali (pembesaran hati) adalah warning sign dengue yang menandakan keterlibatan hati. Memerlukan pemantauan laboratorium (SGOT/SGPT) dan rawat inap.',
    ),
    WarningSign(
      title: 'Peningkatan Hematokrit & Trombosit Turun Cepat',
      icon: Icons.analytics_outlined,
      category: 'warning',
      imageUrl: 'assets/tanda_bahaya/hematokrit_trombosit.png',
      description:
          'Dari hasil laboratorium: peningkatan kadar hematokrit (hemokonsentrasi) yang disertai penurunan trombosit yang cepat dalam waktu singkat. Ini menandakan kebocoran plasma aktif.',
      risk:
          'Peningkatan hematokrit ≥20% dari nilai awal dengan trombosit <100.000/mcl adalah warning sign laboratorium. Pasien memerlukan rawat inap dan pemantauan ketat.',
    ),
  ];

  // =========================================
  // CHECKLIST PENCEGAHAN
  // =========================================
  static const List<PreventionItem> preventionChecklist = [
    PreventionItem(
      title: 'Menguras bak mandi',
      description: 'Kuras dan sikat bak mandi minimal 1x seminggu',
      icon: Icons.bathtub_outlined,
    ),
    PreventionItem(
      title: 'Menutup tempat air',
      description: 'Tutup rapat semua tempat penampungan air',
      icon: Icons.inventory_2_outlined,
    ),
    PreventionItem(
      title: 'Membersihkan genangan air',
      description: 'Periksa dan buang genangan air di sekitar rumah',
      icon: Icons.water_damage_outlined,
    ),
    PreventionItem(
      title: 'Membuang/daur ulang barang bekas',
      description: 'Singkirkan barang bekas yang bisa menampung air hujan',
      icon: Icons.delete_outline_rounded,
    ),
    PreventionItem(
      title: 'Menggunakan pelindung nyamuk',
      description: 'Pakai lotion anti-nyamuk atau pasang kelambu saat tidur',
      icon: Icons.dry_cleaning_outlined,
    ),
  ];

  // =========================================
  // KUIS (10 Soal)
  // =========================================
  static final List<QuizQuestion> quizQuestions = [
    QuizQuestion(
      question:
          'Demam Berdarah Dengue (DBD) disebabkan oleh virus dengue yang ditularkan melalui...',
      options: [
        'Kontak langsung dengan penderita',
        'Gigitan nyamuk Aedes aegypti',
        'Udara dan percikan bersin',
        'Makanan atau minuman yang terkontaminasi',
      ],
      correctAnswerIndex: 1,
      explanation:
          'DBD ditularkan melalui gigitan nyamuk Aedes aegypti betina yang telah terinfeksi virus dengue. DBD tidak menular langsung antar manusia.',
    ),
    QuizQuestion(
      question:
          'Berikut ini yang termasuk TANDA BAHAYA (warning sign) DBD adalah...',
      options: [
        'Nafsu makan meningkat',
        'Nyeri perut hebat dan muntah terus-menerus',
        'Batuk ringan tanpa demam',
        'Gatal-gatal pada kulit',
      ],
      correctAnswerIndex: 1,
      explanation:
          'Nyeri perut hebat dan muntah terus-menerus adalah warning sign DBD yang menandakan kemungkinan kebocoran plasma dan memerlukan penanganan medis segera.',
    ),
    QuizQuestion(
      question:
          'Apa yang harus dilakukan PERTAMA jika anak mengalami tanda bahaya DBD seperti muntah terus-menerus?',
      options: [
        'Menunggu sampai besok dan pantau di rumah',
        'Memberikan ibuprofen untuk meredakan gejala',
        'Segera membawa ke fasilitas kesehatan / rumah sakit',
        'Membiarkan pasien tidur dan istirahat saja',
      ],
      correctAnswerIndex: 2,
      explanation:
          'Jika tanda bahaya DBD muncul, segera bawa pasien ke fasilitas kesehatan. Jangan menunda — kondisi dapat memburuk dengan cepat. Anak yang tidak dapat minum memerlukan cairan infus.',
    ),
    QuizQuestion(
      question:
          'Obat penurun demam manakah yang AMAN diberikan kepada pasien terduga DBD?',
      options: [
        'Aspirin (asetosal)',
        'Ibuprofen',
        'Parasetamol',
        'Natrium diklofenak',
      ],
      correctAnswerIndex: 2,
      explanation:
          'Parasetamol adalah satu-satunya obat penurun demam yang aman untuk DBD. Aspirin, ibuprofen, natrium diklofenak, dan golongan NSAID lain dilarang karena dapat memperparah perdarahan.',
    ),
    QuizQuestion(
      question: 'Kepanjangan dari gerakan pencegahan 3M yang benar adalah...',
      options: [
        'Memasak, Memakan, Membersihkan',
        'Menguras, Menutup, Mendaur ulang/mengubur barang bekas',
        'Menyiram, Memupuk, Memanen',
        'Menjemur, Melipat, Menyimpan',
      ],
      correctAnswerIndex: 1,
      explanation:
          '3M adalah Menguras tempat penampungan air, Menutup rapat wadah air, dan Mendaur ulang/mengubur barang bekas agar tidak menjadi tempat perkembangbiakan nyamuk.',
    ),
    QuizQuestion(
      question:
          'Kondisi paling berat dari DBD yang terjadi akibat kebocoran plasma disebut...',
      options: [
        'Demam Dengue Klasik',
        'Dengue Shock Syndrome (DSS)',
        'Demam Berdarah Ringan',
        'Dengue Tanpa Warning Signs',
      ],
      correctAnswerIndex: 1,
      explanation:
          'Dengue Shock Syndrome (DSS) adalah komplikasi paling berat DBD. Kebocoran plasma menyebabkan syok hipovolemik (tekanan darah turun drastis) yang mengancam jiwa.',
    ),
    QuizQuestion(
      question:
          'Dari hasil laboratorium, yang termasuk warning sign DBD adalah...',
      options: [
        'Trombosit normal dengan hematokrit turun',
        'Peningkatan hematokrit dengan penurunan trombosit yang cepat',
        'Leukosit sangat tinggi (>10.000/mcl)',
        'Hemoglobin meningkat signifikan',
      ],
      correctAnswerIndex: 1,
      explanation:
          'Peningkatan hematokrit (hemokonsentrasi) yang disertai penurunan trombosit cepat merupakan warning sign laboratorium yang menandakan kebocoran plasma aktif.',
    ),
    QuizQuestion(
      question:
          'Seberapa sering sebaiknya menguras tempat penampungan air untuk mencegah DBD?',
      options: [
        'Sebulan sekali cukup',
        'Hanya saat terlihat kotor atau berlumut',
        'Minimal satu kali dalam seminggu',
        'Setiap hari tanpa perlu disikat',
      ],
      correctAnswerIndex: 2,
      explanation:
          'Menguras dan menyikat tempat penampungan air minimal 1 kali seminggu adalah langkah wajib 3M. Telur nyamuk Aedes aegypti menempel di dinding wadah dan dapat menetas dalam 2–3 hari.',
    ),
    QuizQuestion(
      question:
          'Tanda bahaya DBD yang menunjukkan syok pada kaki dan tangan adalah...',
      options: [
        'Kaki dan tangan terasa hangat dan kemerahan',
        'Kaki/tangan pucat, dingin, nadi lemah, pengisian kapiler >2 detik',
        'Kaki dan tangan bengkak disertai gatal',
        'Kaki dan tangan berkeringat namun tetap hangat',
      ],
      correctAnswerIndex: 1,
      explanation:
          'Kaki/tangan pucat, dingin, nadi lemah atau tidak teraba, dan waktu pengisian kapiler >2 detik adalah tanda-tanda syok (Dengue Shock Syndrome). Ini adalah kondisi darurat medis.',
    ),
    QuizQuestion(
      question:
          'Berikut ini adalah tanda DEMAM BERDARAH DENGUE (bukan sekadar Demam Dengue), yaitu...',
      options: [
        'Hanya demam tinggi tanpa gejala lain',
        'Demam disertai batuk dan pilek',
        'Demam disertai pembesaran hati dan manifestasi perdarahan',
        'Demam ringan dengan nafsu makan normal',
      ],
      correctAnswerIndex: 2,
      explanation:
          'DBD (Demam Berdarah Dengue) dibedakan dari Demam Dengue dengan adanya pembesaran hati (hepatomegali) dan manifestasi perdarahan (petekie, mimisan, gusi berdarah, dll).',
    ),
  ];
}
