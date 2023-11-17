import 'package:flutter/material.dart';

class Comic {
  String judul;
  String poster;
  String tipe;
  double rate;

  String status;
  String sinopsis;
  int yearReleased;
  String author;
  List<String> genres;

  Comic(
      {required this.judul,
      required this.poster,
      required this.tipe,
      required this.rate,
      required this.status,
      required this.sinopsis,
      required this.yearReleased,
      required this.author,
      required this.genres});
}

var comicList = [
  Comic(
      judul: 'Yondome wa Iyana Shi Zokusei Majutsushi Bahasa Indonesia',
      poster:
          'https://mangatale.co/wp-content/uploads/2021/12/28544v4-768x1092-1.webp',
      tipe: 'Manga',
      rate: 7.4,
      status: 'Ongoing',
      sinopsis: 'Kehidupan pertama Hiroto Amamiya dengan cepat dan tragis berakhir bersama teman-teman sekelasnya. Yang kedua, karena kecelakaan di pihak Tuhan, dia terlahir kembali dengan sihir yang luar biasa tetapi juga memiliki tingkat nasib buruk yang sama. Setelah mengalami penyiksaan selama bertahun-tahun, kehidupannya pun berakhir karena ia ditembak mati oleh mantan teman sekelasnya. \nSementara Hiroto dikuasai oleh nafsu untuk balas dendam, Tuhan berharap dia bisa melepaskan dan memaafkan, jadi dia berjanji kepada bocah itu bahwa setelah menggunakan kehidupan ketiganya untuk tenang, kehidupan keempatnya akan damai. Dorong ke dunia Lamda, Hiroto terlahir kembali sebagai ras setengah vampir dark elf. Namun, sementara dia mempertahankan sihirnya yang luar biasa, Tuhan telah mengutuk kekuatan ini sehingga tetap disegel. \nHiroto, sekarang bernama Vandalieu,  dihujani cinta oleh ibunya, Darcia, tetapi tragedi merobek kehidupan yang damai ini. Memutuskan bahwa dia tidak membutuhkan nyawa keempat, penyihir kematian bayi Vandalieu memulai perjalanan bersama rekan-rekan mayat hidup, hantu, dan teror malam lainnya.',
      yearReleased: 2018,
      author: 'Densuke (II), KOJIMA Takehiro',
      genres: ['Action', 'Adventure', 'Comedy', 'Drama', 'Fantasy', 'Shounen']),
  Comic(
      judul:
          'I’ll Resign and Have a Fresh Start in This World Bahasa Indonesia',
      poster:
          'https://i3.wp.com/mangatale.co/wp-content/uploads/2022/10/ill_resign.jpg',
      tipe: 'Manhwa',
      rate: 7,
      status: 'Ongoing',
      sinopsis: 'Karakter utama, Cho Isu, menjalani kehidupan biasa tapi bahagia. Lima tahun yang lalu, dia tiba-tiba kehilangan orang tuanya, dan menjadi pria yang hancur, saat dia berjuang setiap hari. Ketika dia kelelahan dari kehidupan sehari-hari yang menyesakkan, sebuah portal terbuka di ruangan itu. Tempat yang belum pernah dia kunjungi, tempat yang mungkin dia tidak tahu. Kehidupan penyembuhan untuk dinikmati di dunia yang berbeda dimulai sebagai orang biasa dan berubah menjadi tuan feodal.',
      yearReleased: 2022,
      author: 'Deep Black [Add, ]Dumbo',
      genres: ['Adventure', 'Drama', 'Fantasy', 'Shounen', 'Slice Of Life']),
  Comic(
      judul: 'World’s Greatest Senior Disciple Bahasa Indonesia',
      poster:
          'https://mangatale.co/wp-content/uploads/2022/11/unpar-senior-bro.webp',
      tipe: 'Manhwa',
      rate: 7,
      status: 'Ongoing',
      sinopsis: 'Seorang murid senior dari akademi bela diri pedesaan kembali sebagai yang terbaik di dunia! Terseret ke dalam perang politik yang brutal, murid senior ‘Hyeok Musang’ tidak kembali setelah perang berdarah berakhir. Tidak ada yang tahu apakah dia masih hidup selama 5 tahun. \nSaat baru saja kembali ke kampung halamannya, dia menemukan Akademi Bela Diri Dragon Tiger dianiaya dan dihancurkan oleh geng kelas tiga. \nDia pikir dia bisa hidup damai dengan sesama anggota setelah memenangkan perang tetapi melihat keadaan menyedihkan dari tuannya dan sesama murid, dia dipenuhi dengan kemarahan dan rasa bersalah. \nDengan kembalinya murid senior, semua orang berpikir segalanya akan menjadi lebih baik tetapi hanya untuk sesaat. Hal-hal masih terjadi di kampung halamannya di Kabupaten Yangzhou. Apakah perang benar-benar berakhir? Murid kepala mengangkat pedangnya melawan bahaya yang mengancam Akademi Bela Diri Dragon Tiger miliknya.',
      yearReleased: 2022,
      author: 'Bug Mihon [Add, ]',
      genres: ['Action', 'Drama', 'Fantasy', 'Martial Arts', 'Shounen']),
  Comic(
      judul: 'The Greatest Estate Developer Bahasa Indonesia',
      poster:
          'https://i1.wp.com/mangatale.co/wp-content/uploads/2021/11/kang_Kuli-1.jpg',
      tipe: 'Manhwa',
      rate: 10,
      status: 'Ongoing',
      sinopsis: 'Kim Soo-Ho, seorang insinyur sipil, menjadi bangsawan dari sebuah novel. Tapi apa ini? Harta saya akan segera dihancurkan? Kemudian saya harus mendesain, membangun, dan menjual.',
      yearReleased: 2022,
      author: '-',
      genres: ['Action', 'Fantasy', 'Reincarnation']),
  Comic(
      judul: 'Solo Leveling Bahasa Indonesia',
      poster:
          'https://i0.wp.com/mangatale.co/wp-content/uploads/2021/10/Solo-Leveling-1.jpg',
      tipe: 'Manhwa',
      rate: 8.8,
      status: 'Completed',
      sinopsis: '???',
      yearReleased: 2018,
      author: '추공 (Chugong) [Add, ]',
      genres: ['Action', 'Adventure', 'Fantasy', 'Shounen']),
  Comic(
      judul: 'I’m a Healer but Useless Bahasa Indonesia',
      poster:
          'https://itachi.my.id/image/i/im-a-healer-but-useless/thumbnail.jpg',
      tipe: 'Manhwa',
      rate: 7,
      status: 'Ongoing',
      sinopsis:
          'Dalam dunia ini, Sido hidup sebagai seorang penyembuh yang tidak berharga setelah dipanggil. Secara kebetulan, dia mulai mendengar suara para dewa yang ternyata sedang bermain game menggunakan manusia sebagai bidak catur?! Tanpa meragukan hal itu, saat menjelajahi ruang bawah tanah bersama-sama, timnya menghadapi krisis… Para anggota tim dengan tanpa ragu meninggalkan Sido dengan kejam demi kelangsungan hidup mereka. Pada akhirnya, Sido yang selamat tidak akan lagi menjadi korban. Dengan segala cara, dia akan membalas dendam kepada mereka yang telah mengkhianatinya dan mengacaukan papan permainan para dewa! Sebagai seorang penyembuh yang kembali hidup dari ambang kematian, Sido mulai memasuki masa pertumbuhan yang akan menjadikannya Healer yang lebih tangguh, kisahnya dimulai sekarang~',
      yearReleased: 2023,
      author: '-',
      genres: ['Action', 'Adventure', 'Fantasy', 'Isekai']),
  Comic(
      judul:
          'Yuusha ni Zenbu Ubawareta Ore wa Yuusha no Hahaoya to Party wo Kumimashita! Bahasa Indonesia',
      poster:
          'https://itachi.my.id/image/y/yuusha-ni-zenbu-ubawareta-ore-wa-yuusha-no-hahaoya-to-party-wo-kumimashita/thumbnail.jpg',
      tipe: 'Manga',
      rate: 7,
      status: 'Ongoing',
      sinopsis:
          'Yang ingin dinikahi oleh pemuda ini adalah… para ibu dari party pahlawan!Sebagai anggota party pahlawan, Ceres sedang dalam petualangan untuk mengalahkan raja iblis.Namun, suatu hari, dia tiba-tiba dikeluarkan oleh pahlawan Zekt untuk meninggalkan partynya.\nCeres yang ditinggal sendirian mencari budak pekerja rumah tangga sebagai budak pribadi. \nDan budak yang dilihatnya adalah sosok Shizuko, ibu sang pahlawan yang dijual sebagai budak! \nCerita tentang pemuda yang dikeluarkan dari party secara tidak adil dan isekai mama-harem telah dimulai!',
      yearReleased: 2022,
      author: 'Ishino Yassan, Kuon Makoto',
      genres: [
        'Action',
        'Adventure',
        'Ecchi',
        'Fantasy',
        'Harem',
        'Isekai',
        'Romance',
        'Slice Of Life'
      ]),
  Comic(
      judul: 'Nano Machine Bahasa Indonesia',
      poster:
          'https://i0.wp.com/mangatale.co/wp-content/uploads/2021/11/image_2021-11-02_222133.png',
      tipe: 'Manhwa',
      rate: 8,
      status: 'Ongoing',
      sinopsis: 'Setelah direndahkan dan menghabiskan hidupnya dalam bahaya, seorang yatim piatu dari pemuja iblis, Yeo-Woon, mendapatkan kunjungan tak terduga dari keturunannya dari masa depan yang memasukkan sebuah mesin nano ke dalam tubuh Cheon-Woon, yang mengubah hidup Cheon Yeo Woon setelah aktivasi. Ikuti Cerita tentang perjalanan Cheon Yeo-Woon di komikcast.com, melewati pemujaan setan dan naik menjadi yang ahli beladiri terbaik baru saja dimulai.',
      yearReleased: 2020,
      author: 'Han-Joong-Wueol-Ya [Add, ]',
      genres: ['Action', 'Adventure', 'Fantasy', 'Martial']),
  Comic(
      judul: '100-nin no Eiyuu o Sodateta Saikyou Yogensha wa Bahasa Indonesia',
      poster:
          'https://itachi.my.id/images/1/100-nin-no-eiyuu-o-sodateta-saikyou-yogensha-wa/thumbnail.jpg',
      tipe: 'Manga',
      rate: 7.23,
      status: 'Completed',
      sinopsis: 'Mengangkat seratus pahlawan dan mengakhiri perang dengan dewa jahat, Eisen menyelamatkan dunia. Setelah menerima cedera hebat karena melindungi para pahlawan, ia pergi ke Dunia Lain untuk pulih. Pada waktu itu, para pahlawan memanfaatkan kemampuan mereka untuk berkontribusi besar bagi perkembangan dunia. Karena ingin bertemu lagi dengan tuan yang mereka kagumi, mereka melaporkan kepadanya tentang pencapaian mereka secara terperinci. Membaca surat-surat mereka, Eisen membuat keputusan untuk berangkat dan mengunjungi mereka masing-masing saat ia bepergian ke negara itu untuk melihat-lihat.',
      yearReleased: 2019,
      author: '???',
      genres: ['Action', 'Adventure', 'Comedy', 'Fantasy']),
  Comic(
      judul: 'Taming Master Bahasa Indonesia',
      poster:
          'https://i0.wp.com/mangatale.co/wp-content/uploads/2022/01/image_2022-01-06_094828.png',
      tipe: 'Manhwa',
      rate: 8,
      status: 'Ongoing',
      sinopsis: 'Game VR paling terkenal di dunia, ‘Kailan’. Seorang pecandu game bersertifikat tahu di dunia maya, Ian. Meskipun memiliki karakter Pemanah Level 93 di papan peringkat teratas Kaillan, Ian memutuskan untuk menghapusnya meskipun semua orang di sekitarnya melarangnya. Semua untuk dikonversi ke kelas tersembunyi yang diperolehnya secara kebetulan. Kelas yang dia pilih adalah kelas yang paling tidak berharga di Kaillan, kelas Summoner. Jika dia ingin menghindari mendapatkan F di perguruan tinggi, dia perlu naik level ke level sebelumnya dalam waktu dua bulan… Kailan terkenal dengan sistem levelingnya yang sangat kejam, di mana dikatakan membutuhkan waktu lebih dari satu tahun untuk mencapai level 100. Perjuangannya untuk mencapai level 93 hanya dalam dua bulan terungkap… Level dengan cepat, menyeluruh, dan gigih. Legenda ‘Tuan Penjinak’ dimulai!',
      yearReleased: 2020,
      author: 'ARC Studio, Park Taesuk',
      genres: ['Action', 'Adventure', 'Fantasy', 'Shounen']),
  Comic(
      judul: 'Kyoukai Meikyuu to Ikai no Majutsushi Bahasa Indonesia',
      poster:
          'https://i3.wp.com/mangatale.co/wp-content/uploads/2021/10/Kyoukai-Meikyuu-to-Ikai-no-Majutsushi.jpg',
      tipe: 'Manga',
      rate: 6.4,
      status: 'Ongoing',
      sinopsis: 'Ketika Theodore dijatuhkan ke perairan oleh saudara tirinya, dia tiba-tiba teringat akan ingatan kehidupan masa lalunya. Dia adalah warga negara Jepang yang dikenal sebagai Kirishima Kagehisa, namun di dalam karakter VRMMO yang ia buat di Break Force Online “BFO”. ‘Theodore’ adalah Combat Mage yang dimainkan Kagehisa dalam BFO, dan dia menyadari kemampuannya berkembang dengan baik bahkan di dunia lain itu, apa gak ngiri nes dia juga di temani harem neesan yang mantabs djiwaaa…',
      yearReleased: 2018,
      author: 'ONOSAKI Eiji',
      genres: ['Action', 'Adventure', 'Fantasy', 'Harem', 'Romance', 'Shounen'])
];
