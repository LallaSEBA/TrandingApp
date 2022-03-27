import 'package:flutter/material.dart';
import '../../models/item.dart';

import '../ressources.dart';

class ItemCard extends StatelessWidget {

  final double width2;
  final Item   item;
  const ItemCard({Key? key, required this.width2, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
            shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            elevation: 3,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 0,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                      child: Image.network(
                        item.urlImag,
                        fit: BoxFit.fitHeight,
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                        return const Text('Picture Not Found...', style: TextStyle(fontSize: 12, color: Colors.red),);
                                      },
                      )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 5, top: 10),
                        width: width2-30,
                        child:RichText(
                          softWrap: true,
                          text: TextSpan( 
                              style: itemStyle,
                              children: <TextSpan> [
                                  TextSpan(text: item.title+' ', style: itemStyleBold),
                                  TextSpan(text: item.subTitle,)
                              ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                        child: CircleAvatar(
                          backgroundColor: colorBG,
                          backgroundImage: NetworkImage(item.urlImag,)),
                      ),
                    ],
                  ),
                      Container(
                        padding: const EdgeInsets.only(left: 5, top: 3),
                        width: width2,
                        child: Text(item.getDuration(),
                          textAlign: TextAlign.left,
                          style: durationStyle,
                        ),
                      )
                ],
              ),
            )
      );
  }
}