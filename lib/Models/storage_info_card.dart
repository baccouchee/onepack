

import 'package:flutter/material.dart';

import 'package:onepack/global/constants.dart';



class StorageInfoCard extends StatelessWidget {
  const StorageInfoCard({
    Key? key,
    required this.title,

  }) : super(key: key);

  final String title;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: primaryColor.withOpacity(0.15)),
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultPadding),
        ),
      ),
      child: Row(
        children: [

          Expanded(

              child: Row(
                children: [
                  Row(

                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(width: 10,),
                      Row(
                        children: [
                          IconButton(onPressed: () {  }, icon: Icon(Icons.add_circle_outline, color: Colors.green)),

                          Text('0'),
                          IconButton(onPressed: () {  }, icon: Icon(Icons.remove_circle_outline, color: Colors.red,))
                        ],
                      ),
                      SizedBox(width: 10,),
                      Text(
                        "15DT",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                ],
              ),


              ]
              ),
            ),


        ],
      ),
    );
  }
}
