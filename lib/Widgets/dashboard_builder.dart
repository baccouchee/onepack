import 'package:flutter/material.dart';
import 'package:onepack/Widgets/custom_widgets.dart';
import 'package:onepack/Components/header.dart';
import 'package:onepack/Components/side_menu.dart';
import 'package:onepack/global/constants.dart';

class DashboardBuilder extends StatefulWidget {
  final String title;
  final List titleList;
  final List iconList;
  DashboardBuilder({
    Key? key,
    required this.title,
    required this.titleList,
    required this.iconList,
  }) : super(key: key);

  @override
  _DashboardBuilderState createState() => _DashboardBuilderState();
}

class _DashboardBuilderState extends State<DashboardBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: SideMenu(),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(title: widget.title),
                    SizedBox(
                      height: 62,
                    ),
                    Expanded(
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.titleList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: defaultPadding,
                          mainAxisSpacing: defaultPadding,
                          childAspectRatio: 1.0,
                        ),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context,
                                '/${widget.titleList[index]}'
                                    .replaceAll(' ', '-'));
                          },
                          child: CustomWidgets.funcButtons(
                            title: widget.titleList[index],
                            iconPath: widget.iconList[index],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
