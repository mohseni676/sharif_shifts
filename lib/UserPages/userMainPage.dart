import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sharif_shifts/UserPages/reserveShift.dart';
import 'package:sharif_shifts/classes/globalVars.dart';
import 'package:sharif_shifts/login/login.dart';
import 'package:sharif_shifts/ui/CustomWidgets.dart';
import 'package:sharif_shifts/ui/theme.dart' as Theme;

//import 'addJobSchedule.dart';

class userMainPage extends StatefulWidget {
  @override
  _userMainPageState createState() => _userMainPageState();
}

class _userMainPageState extends State<userMainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<bool> _onWillPop() {
    return showDialog(
            context: context,
            builder: (context) => Directionality(
                  textDirection: TextDirection.rtl,
                  child: AlertDialog(
                    title: Text('آیا اطمینان دارید؟'),
                    content: Text('آیا می خواهید از اپ خارج شوید'),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text('خیر'),
                      ),
                      FlatButton(
                        onPressed: () {

                          globalVars.token="";
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ));
    },
                        /*Navigator.of(context).pop(true)*/
                        child: Text('بلی'),
                      ),
                    ],
                  ),
                )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: _onWillPop,
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: new Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(
                  title: new Text('نیکوکاران شریف'),
                  centerTitle: true,
                ),
                body: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overscroll) {
                      overscroll.disallowGlow();
                    },
                    child: Center(
                        child: new Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height >= 775.0
                                ? MediaQuery.of(context).size.height
                                : 775.0,
                            decoration: new BoxDecoration(
                              gradient: new LinearGradient(
                                  colors: [
                                    Theme.Colors.loginGradientStart
                                        .withAlpha(90),
                                    Theme.Colors.loginGradientEnd.withAlpha(90)
                                  ],
                                  begin: const FractionalOffset(0.0, 0.0),
                                  end: const FractionalOffset(1.0, 1.0),
                                  stops: [0.0, 1.0],
                                  tileMode: TileMode.clamp),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 60,
                                  child: new Column(
                                    children: [
                                      new Container(
                                        alignment: Alignment.center,
                                        color: Colors.black,
                                        child:                                   new Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text('نام مددکار',style: TextStyle(color: Colors.white),),
                                            Text('کد مددکار',style: TextStyle(color: Colors.white),)
                                          ],
                                        ),

                                      ),
                                      new Container(
                                        color: Colors.white70,
                                        child:                                   new Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text('${globalVars.MadadkarName}'),
                                            Text('${globalVars.MadadkarId}')
                                          ],
                                        ),

                                      )
                                    ],
                                  )

                                ),
                                Expanded(
                                  child:
                                  GridView.count(
                                    crossAxisCount:
                                    MediaQuery.of(context).size.width >= 750.0 ? 9 : 3,
                                    children: <Widget>[
                                      gridIcon(
                                        icon: Icon(
                                          FontAwesomeIcons.clock,
                                          color: Colors.black87,
                                          size: 35,
                                        ),
                                        label: 'رزرو شیفت',
                                        onPress: () {

                                          Navigator.push(context, MaterialPageRoute(builder: (context) => reserveShift(),));
                                        },
                                      ),

                                    ],
                                  )),

                              ],
                            )))))));
  }


}
