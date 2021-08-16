import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:onepack/global/constants.dart';

class Header extends StatefulWidget {
  final String title;
  const Header({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (ModalRoute.of(context)!.settings.name != '/Home')
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: primaryColor,
            ),
          ),
        Text(
          "${widget.title}",
          style: Theme.of(context).textTheme.headline6,
        ),
        Spacer(),
        Container(
          margin: EdgeInsets.only(left: defaultPadding),
          padding: EdgeInsets.symmetric(
            horizontal: defaultPadding,
            vertical: defaultPadding / 2,
          ),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.white10),
          ),
          child: Row(
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: 38,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                child: Text("Nom Prénom"),
              ),
            ],
          ),
        ),
        Badge(
          badgeContent: Text('3', style: TextStyle(color: Colors.white),),
          child:       PopupMenuButton(
            icon: Icon(Icons.notifications, color: primaryColor,),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Row(
                  children: <Widget>[
                    Text('Working a lot harder'),
                    IconButton(
                      icon: new Icon(Icons.close),
                      onPressed: (){},
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                child: Row(
                  children: <Widget>[
                    Text('Working a lot harder'),
                    IconButton(
                      icon: new Icon(Icons.close),
                      onPressed: (){},
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                child: Row(
                  children: <Widget>[
                    Text('Working a lot harder'),
                    IconButton(
                      icon: new Icon(Icons.close),
                      onPressed: (){},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
