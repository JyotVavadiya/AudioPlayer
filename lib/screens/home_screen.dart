import 'package:flutter/material.dart';

import 'audio_screen.dart';
import 'model_class.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "RAINBOW MUSIC",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: song.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => audio_page(i)));
                },
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: song[i].mycolor,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 8,
                          child: Row(
                            children: [
                              SizedBox(width: 20,),
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage('${song[i].image}'),
                              ),
                              SizedBox(width: 25,),
                              Container(
                                //padding: EdgeInsets.only(top: 25),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${song[i].title}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                                    Text("${song[i].subtitle}", style: TextStyle(color: Colors.white,  fontSize: 14),),
                                  ],
                                ),
                              ),
                            ],
                          )
                      ),
                      Expanded(
                        flex: 2,
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}