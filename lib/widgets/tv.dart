import 'package:flutter/material.dart';
import 'package:netflix_app/widgets/description.dart';

class TvPopular extends StatelessWidget {
  const TvPopular({super.key, required this.tvpopular});

 final List tvpopular;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
     const  Padding(
        padding: EdgeInsets.only(top:10,left: 12),
         child:    Text('Tv Series',
            style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold),
            ),
       ),
       const SizedBox(height: 11,),
          Container(
            height: 250,
            child: ListView.builder(itemCount: tvpopular.length,
          
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>
                    Description(name: tvpopular[index]['name'], 
                     description: tvpopular[index]['overview'],
                      bannerurl:'https://image.tmdb.org/t/p/w500' + tvpopular[index]['backdrop_path'] , 
                       posterurl: 'https://image.tmdb.org/t/p/w500'+tvpopular[index]['poster_path'] , 
                       vote: tvpopular[index]['vote_average'].toString(), 
                       launch_on: '' 
                       ))); 
                },
                child: Container(
                  width: 140,
                  child: Column(
                    children: [
                      Container(
                        height: 200, 
                        decoration: BoxDecoration(
                          image: DecorationImage(image:NetworkImage('https://image.tmdb.org/t/p/w500'+tvpopular[index]['poster_path']) )
                        ),
                      ),
                      const SizedBox(height: 11,), 
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(tvpopular[index]['name'] ?? 'Loading', 
                        style:const TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                      ) 
                    ], 
                  ), 
                ),
              );
            },),
          )
        ],
      ),
    );
  }
}