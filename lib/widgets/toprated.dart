import 'package:flutter/material.dart';
import 'package:netflix_app/widgets/description.dart';

class TopRated extends StatelessWidget {
  const TopRated({super.key, required this.toprated});

 final List toprated;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
     const  Padding(
        padding: EdgeInsets.only(top:10,left: 12),
         child:    Text('Top Rated Movies', 
            style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold),
            ),
       ),
       const SizedBox(height: 11,),
          Container(
            height: 250,
            child: ListView.builder(itemCount: toprated.length, 
            
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>
                    Description(name: toprated[index]['title'],
                     description: toprated[index]['overview'],
                      bannerurl:'https://image.tmdb.org/t/p/w500' + toprated[index]['backdrop_path'] , 
                       posterurl: 'https://image.tmdb.org/t/p/w500' + toprated[index]['poster_path'] ,  
                       vote: toprated[index]['vote_average'].toString(), 
                       launch_on: toprated[index]['release_date'])));
                },
                child: Container(
                  width: 140,
                  child: Column(
                    children: [
                      Container(
                        height: 200, 
                        decoration: BoxDecoration(
                          image: DecorationImage(image:NetworkImage('https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']) )
                        ),
                      ),
                      const SizedBox(height: 11,), 
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(toprated[index]['title'] ?? 'Loading',
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