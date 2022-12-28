
import 'package:flutter/material.dart';

import 'package:netflix_app/widgets/description.dart';

class trendingMovies extends StatelessWidget {
  const trendingMovies({super.key, required this.trending});

  final List trending;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 12),
            child: Text(
              'Trending Movies',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 11,
          ),
          Container(
            height: 250,
            child: ListView.builder(
              itemCount: trending.length,
            
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    
                  
                       Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>
                    Description(
                      name: trending[index]['title']?? trending[index]['name'],
                     description: trending[index]['overview'],
                      bannerurl:'https://image.tmdb.org/t/p/w500' + trending[index]['backdrop_path'] , 
                       posterurl: 'https://image.tmdb.org/t/p/w500' + trending[index]['poster_path'] , 
                       vote: trending[index]['vote_average'].toString(), 
                       launch_on: trending[index]['release_date']??trending[index]['first_air_date'])));
                   
                  }, 
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          trending[index]['poster_path']))),
                        ),
                        const SizedBox(
                          height: 11,
                        ),
                     
                        
                         Padding(
                          
                          padding: const EdgeInsets.all(4.0),
                          child:
                          
                          Text(
                            trending[index]['title'] ??  trending[index]['name'],  
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
