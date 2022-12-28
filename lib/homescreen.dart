import 'package:flutter/material.dart';

import 'package:netflix_app/widgets/description.dart';
import 'package:netflix_app/widgets/toprated.dart';
import 'package:netflix_app/widgets/trendingMovies.dart';
import 'package:netflix_app/widgets/tv.dart';
import 'package:netflix_app/widgets/upcoming.dart';
import 'package:tmdb_api/tmdb_api.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  List upcoming =[];
 

  final String apikey = '22dcd0e2091dd9ed2a4194872a4e7c89';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMmRjZDBlMjA5MWRkOWVkMmE0MTk0ODcyYTRlN2M4OSIsInN1YiI6IjYzYTdlZGUyYTU3NDNkMDBkZjNiN2RlYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.nTOMglUBEUXIc4dvI5S2H4Wkige8-u7avJ_EDWFIrRk';

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();
    Map upcomingresult = await  tmdbWithCustomLogs.v3.movies.getUpcoming();
    
    print(tvresult); 

    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
      upcoming = upcomingresult['results'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    loadmovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   leading: SafeArea(child: Image.asset('assets/images/logo.png')),
      // ),
      body: SafeArea(
        child: ListView(children: [
          Container(
            height: 68,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, 
              children: [
                Container(
                  height: 64,
                  width: 63,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'))),
                ),
                
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 11, right: 11),
            child: SizedBox(
              height: 330,
              child: Image(
                  fit: BoxFit.fill, 
                  // ignore: prefer_interpolation_to_compose_strings
                  image: NetworkImage('https://bingeddata.s3.amazonaws.com/uploads/2022/11/Wednesday-Series-Review.jpg')),  
              
            ), 
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
            child: Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 155,
                    height: 40,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(70)),
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 223, 58, 46)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.play_arrow),
                            SizedBox(
                              width: 12,
                            ),
                            Text('Play now')
                          ],
                        )),
                  ),
                  Container(
                    width: 155,
                    height: 40,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(70)),
                    child: ElevatedButton(
                        onPressed: () {
                           Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>
                    Description(name: tv[0]['name'],   
                     description: tv[0]['overview'],
                      bannerurl:'https://image.tmdb.org/t/p/w500' + tv[0]['backdrop_path'] , 
                       posterurl: 'https://image.tmdb.org/t/p/w500'+tv[0]['poster_path'] , 
                       vote: tv[0]['vote_average'].toString(), 
                       launch_on: '' 
                       )));
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: const BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.info_outline),
                            SizedBox(
                              width: 12,
                            ),
                            Text('More info')
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
          UpComing(upcoming: upcoming,),
          trendingMovies(trending: trendingmovies),
          TopRated(
            toprated: topratedmovies,
          ),
          TvPopular(
            tvpopular: tv,
          )
        ]),
      ),
    );
  }
}
