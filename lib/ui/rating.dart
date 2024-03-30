import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class Rating extends StatefulWidget {
  Rating({Key? key}) : super(key: key);
  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  double rating=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,

      children:[
        Text('rating $rating'),
        RatingBar.builder(
minRating:1,
        itemBuilder:(context,_)=>Icon(Icons.star,color: Colors.amberAccent,),
            updateOnDrag: true,

            onRatingUpdate: (rating)=>setState(() {
          this.rating= rating;
          }),

      ),
SizedBox(height: 32,),
        TextButton(onPressed: (){
          showRating();
        }, child: Text('rate us'))
     ] ) );
  }
  Widget buildRating() => RatingBar.builder(
    minRating:1,
    itemBuilder:(context,_)=>Icon(Icons.star,color: Colors.amberAccent,),
    updateOnDrag: true,
    onRatingUpdate: (rating)=>setState(() {
      this.rating= rating;
    }),

  );




  void showRating() =>showDialog(context: context, builder: (context)=>AlertDialog(
    title: Text('leave a rate'),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('plss raaate'),
        SizedBox(height: 32,),

    RatingBar.builder(
      minRating:1,
      itemBuilder:(context,_)=>Icon(Icons.star,color: Colors.amberAccent,),
      updateOnDrag: true,
      onRatingUpdate: (rating)=>setState(() {
        this.rating= rating;
      }),

    )

    ],
    ),
    actions: [
      TextButton(onPressed: (){Navigator.pop(context,);}, child: Text('ok'))
    ],
  ));

}
