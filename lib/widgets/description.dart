import 'package:flutter/material.dart';


class Description extends StatelessWidget {
  const Description({super.key, required this.name, required this.description, required this.bannerurl, required this.posterurl, required this.vote, required this.launch_on});

 final String name, description, bannerurl, posterurl,vote,launch_on;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: ListView(
            children: [
              Container(
                height: 340,
                child: Stack(
                  children: [
                    Positioned(child:
                    Container(
                      height: 340,   
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(bannerurl != null ?bannerurl:'', fit: BoxFit.contain,),
                    )), 
                    Positioned(
                      bottom: 20, 
                      child: Text('  ⭐ Average Rating - '+vote != null?'  ⭐ Average Rating - '+vote:'No Rating',
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),))
                  ],
                ), 
              ),
              const SizedBox(height:30,),
              Container(
                padding: const EdgeInsets.all(6),
                child: Text(name != null? name:'Not Loaded',  
                style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20) ,), 
              ),
                const SizedBox(height: 2,),
              Container(padding: EdgeInsets.only(left: 4),
              child: Text('Releasing on  -  '+ launch_on != null ?'Releasing on  -  '+ launch_on :'' ,
              style: const TextStyle(color: Colors.white,fontSize: 12 )),),
              const SizedBox(height: 18,),  
            Row(
              children: [ 
                Container( 
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl != null ?posterurl:''), 
                ),
                const SizedBox(width: 12,),
                Flexible(
                  child: Container(
                    child: Text(description!= null ?description:'',
                    style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14)), 
                  ),
                ) 
              ], 
            )
            ],

          ),
        ),
      ),
    );
  }
}