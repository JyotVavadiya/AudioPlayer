import 'package:flutter/material.dart';

class Audiomodel {
  String image;
  String title;
  String subtitle;
  Color mycolor;
  String song;

  Audiomodel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.mycolor,
    required this.song,
  });
}

List<Audiomodel> song = <Audiomodel>[
  Audiomodel(
    image:
    "https://www.pinkvilla.com/imageresize/mehabooba_song_.jpg?width=752&format=webp&t=pvorg",
    title: "Mehabooba",
    subtitle: "Ananya bhat",
    mycolor: Color(0xff0047bd),
    song: 'assets/audios/1.mp3',
  ),
  Audiomodel(
    image:
    "https://2.bp.blogspot.com/-582sEGHwfYs/VaysV_6jLUI/AAAAAAAAS0Y/8JJRyBs5eIM/s1600/kaun%2Bhai%2Bwoh%2Bbahubali.jpg",
    title: "Kaun Hain Voh",
    subtitle: "MM Kreem , Manoj M",
    mycolor: Color(0xff4faad7),
    song: 'assets/audios/2.mp3',
  ),
  Audiomodel(
    image:
    "https://www.prokerala.com/images/1200/new-poster-of-the-film-rrr-featuring-ram-charan-and-jr-ntr.jpg",
    title: "Dosti",
    subtitle: "Amit Trivedi, MM Kreem",
    mycolor: Color(0xff07b8fc),
    song: 'assets/audios/3.mp3',
  ),
  Audiomodel(
    image:
    'https://st1.bollywoodlife.com/wp-content/uploads/2021/01/FotoJet-61.jpg?impolicy=Medium_Widthonly&w=600',
    title: 'Sulthan',
    subtitle: 'Ravi Basrur',
    mycolor: Color(0xff009543),
    song: 'assets/audios/4.mp3',
  ),
  Audiomodel(
    image:
    'https://www.ilyrically.com/wp-content/uploads/2022/01/Kangana-Tera-Ni-Sanu-Kare-Ishare-e1641565030798.jpg',
    title: 'Kangana Tera Ni',
    subtitle: 'Abeer Arora',
    mycolor: Color(0xff0ad841),
    song: 'assets/audios/5.mp3',
  ),
  Audiomodel(
    image: 'https://static.sacnilk.com/articles/internet/youtube/6950.jpg',
    title: 'Srivalli',
    subtitle: 'Javed Ali',
    mycolor: Color(0xff78d811),
    song: 'assets/audios/6.mp3',
  ),
  Audiomodel(

    image: "https://1.bp.blogspot.com/-BIXzrQBX6XQ/X3CAkr7mR7I/AAAAAAAACas/Jmh0c-gTRQolf0sN0EQDfaEzqaYqC65owCLcBGAsYHQ/s640/Bolo%2BHar%2BHar%2BHar%2BLyrics%2B-%2BSHIVAAY%2B-%2BMohit%2BChauhan.jpg",
    title: "Bolo Har Har Har",
    subtitle: "Mithoon, Badshah",
    mycolor: Colors.amber,
    song: 'assets/audios/7.mp3',
  ),
];