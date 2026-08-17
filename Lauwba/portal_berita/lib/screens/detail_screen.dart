import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:portal_berita/api/DetailBerita.dart';
import 'package:portal_berita/textstyle_constant.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../api/api.dart';

 class DetailScreen extends StatefulWidget {
   final String id;
   const DetailScreen({super.key, required this.id});

   @override
   State<DetailScreen> createState() => _DetailScreenState();
 }

 class _DetailScreenState extends State<DetailScreen> {
   DetailBerita? detailBerita;

   fetchDetailBerita(){
     Api.getDetailBerita(widget.id).then((value){
       setState(() {
         detailBerita = value;
       });
     }).catchError((error){
       print(error.toString());
     });
   }

   @override
  void initState() {
    // TODO: implement initState
     fetchDetailBerita();
    super.initState();
  }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: Text("Detail Berita")),
       body: Skeletonizer(
         enabled: detailBerita == null,
         child: ListView(
           children: [
             GFCard(
             boxFit: BoxFit.cover,
               titlePosition: GFPosition.start,
               image: Image.network(
                 detailBerita != null ? detailBerita!.fotoNews! : 'https://lauwba.com//news/in-house-training-fotografi-design-grafis-dan-video-editing.webp',
                 height: MediaQuery.of(context).size.height * 0.3,
                 width: MediaQuery.of(context).size.width,
                 fit: BoxFit.cover,
               ),
               showImage: true,
               content: Text(detailBerita != null ? detailBerita!.jdlNews! : "Some quick example text to build on the card", style: MyFont.heading1,),
               buttonBar: GFButtonBar(
                 children: <Widget>[
                   GFAvatar(
                     size: GFSize.SMALL,
                     backgroundColor: GFColors.PRIMARY,
                     child: Icon(
                       Icons.share,
                       color: Colors.white,
                     ),
                   ),
                   GFAvatar(
                     size: GFSize.SMALL,
                     backgroundColor: GFColors.SECONDARY,
                     child: Icon(
                       Icons.search,
                       color: Colors.white,
                     ),
                   ),
                   GFAvatar(
                     size: GFSize.SMALL,
                     backgroundColor: GFColors.SUCCESS,
                     child: Icon(
                       Icons.phone,
                       color: Colors.white,
                     ),
                   ),
                 ],
               ),
             ),
             
             Padding(
               padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
               child: Text(detailBerita != null ? detailBerita!.ketNews ! : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vitae neque eget risus semper auctor sit amet sit amet nisl. Cras sed urna in velit auctor pellentesque bibendum non dolor. Curabitur vel mauris turpis. Proin eu lorem cursus, egestas magna non, interdum turpis. Duis molestie molestie est sagittis venenatis. Quisque ac semper orci. Integer condimentum nisi ut ullamcorper malesuada. Vestibulum eget sapien mattis, laoreet odio quis, dapibus eros. Pellentesque orci ante, viverra a arcu et, semper dictum tortor. Aenean eget lectus porttitor, imperdiet erat vitae, feugiat dui. Nullam sed tortor orci. Vestibulum non mauris sit amet mauris mollis bibendum. Nullam molestie scelerisque risus, in volutpat turpis. Proin euismod non leo vel hendrerit.",style: MyFont.paragraph,),
             )
         
         ],
         ),
       ),
     );
   }
 }
