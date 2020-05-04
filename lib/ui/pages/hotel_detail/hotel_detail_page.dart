import 'package:buscatelo/model/hotel_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HotelDetailPage extends StatefulWidget {
  HotelDetailPage(this.hotel);

  final HotelModel hotel;

  @override
  _HotelDetailPageState createState() => _HotelDetailPageState();
}

class _HotelDetailPageState extends State<HotelDetailPage> {
  @override
  Widget build(BuildContext context) => Container(
        color: Theme.of(context).canvasColor,
        child: Stack(
          children: <Widget>[
            RecipeBodyBackground(hotel: widget.hotel),
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              right: 0,
              child: Scaffold(
                appBar: AppBar(
                  iconTheme: IconThemeData(
                    color: Colors.white,
                    size: 32,
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                backgroundColor: Colors.transparent,
                body: RecipeBody(hotel: widget.hotel),
              ),
            ),
          ],
        ),
      );
}

class RecipeBodyBackground extends StatelessWidget {
  const RecipeBodyBackground({
    Key key,
    @required this.hotel,
  }) : super(key: key);

  final HotelModel hotel;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: MediaQuery.of(context).size.height * .60,
      child: Hero(
        tag: Key("key" + hotel.imageUrl),
        child: Container(
          height: MediaQuery.of(context).size.height * .25,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(hotel.imageUrl), fit: BoxFit.cover),
          ),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .25,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment(0, .8),
                    end: Alignment(0, 0),
                    colors: [
                  Color(0xEE000000),
                  Color(0x33000000),
                ])),
          ),
        ),
      ),
    );
  }
}

class RecipeBody extends StatelessWidget {
  final HotelModel hotel;

  const RecipeBody({Key key, this.hotel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 32, right: 32, bottom: 112, top: 144),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(height: 16),
          Expanded(
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
              elevation: 8,
              child: Container(
                // padding: EdgeInsets.all(24),
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: TabBarView(
                            children: [
                              HotelDetailTab(hotel: hotel),
                              HotelRoomTab(),
                              HotelReviewTab(),
                            ],
                          ),
                        ),
                      ),
                      TabBar(
                        indicator: UnderlineTabIndicator(
                          borderSide:
                              BorderSide(color: Color(0xDD613896), width: 4.0),
                          insets: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 40.0),
                        ),
                        tabs: [
                          Tab(
                            child: Text(
                              "DETAILS",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "ROOMS",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "REVIEW",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HotelReviewTab extends StatelessWidget {
  const HotelReviewTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.directions_bike);
  }
}

class HotelRoomTab extends StatelessWidget {
  const HotelRoomTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.directions_transit);
  }
}

class HotelDetailTab extends StatelessWidget {
  const HotelDetailTab({
    Key key,
    @required this.hotel,
  }) : super(key: key);

  final HotelModel hotel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          hotel.name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontFamily: 'Avenir',
            fontWeight: FontWeight.w700,
          ),
        ),
        Divider(
          height: 2,
          color: Colors.grey,
        )
      ],
    );
  }
}
