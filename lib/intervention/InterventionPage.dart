import 'package:intl/intl.dart';
import 'package:intl/src/intl_helpers.dart';
import 'package:apptech/intervention/InventionForm.dart';
import 'package:flutter/material.dart';

//class needs to extend StatefulWidget since we need to make changes to the bottom app bar according to the user clicks
class InterventionsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InterventionsPageState();
  }
}

class InterventionsPageState extends State<InterventionsPage> {
  bool clickedCentreFAB = false; //boolean used to handle container animation which expands from the FAB
  int selectedIndex = 0; //to handle which item is currently selected in the bottom app bar
  String text = "Home";
  static const String routeName = '/interventionPage';
  //call this method on click of each bottom app bar item to update the screen
  void updateTabSelection(int index, String buttonText) {
    setState(() {
      selectedIndex = index;
      text = buttonText;
    });
  }

  DateTime now = DateTime.now();
  var dateString = DateFormat.ABBR_MONTH_WEEKDAY_DAY;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: FractionalOffset.center,
            //in this demo, only the button text is updated based on the bottom app bar clicks
            child: RaisedButton(
              child: Text(text),
              onPressed: () {},
            ),
          ),
          //this is the code for the widget container that comes from behind the floating action button (FAB)
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
              //if clickedCentreFAB == true, the first parameter is used. If it's false, the second.
              height:
              clickedCentreFAB ? MediaQuery.of(context).size.height : 10.0,
              width: clickedCentreFAB ? MediaQuery.of(context).size.height : 10.0,
              decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(clickedCentreFAB ? 0.0 : 300.0),
                  color: Colors.blue),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, //specify the location of the FAB
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => InterventionPage()));
        },
        tooltip: "Centre FAB",
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Icon(Icons.add),
        ),
        elevation: 4.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                //update the bottom app bar view each time an item is clicked
                onPressed: () {
                  updateTabSelection(0, "Home");
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.home,
                  //darken the icon if it is selected or else give it a different color
                  color: selectedIndex == 0
                      ? Colors.blue.shade900
                      : Colors.grey.shade400,
                ),
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(1, "Outgoing");
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.call_made,
                  color: selectedIndex == 1
                      ? Colors.blue.shade900
                      : Colors.grey.shade400,
                ),
              ),
              //to leave space in between the bottom app bar items and below the FAB
              SizedBox(
                width: 50.0,
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(2, "Incoming");
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.call_received,
                  color: selectedIndex == 2
                      ? Colors.blue.shade900
                      : Colors.grey.shade400,
                ),
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(3, "Settings");
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.settings,
                  color: selectedIndex == 3
                      ? Colors.blue.shade900
                      : Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
        //to add a space between the FAB and BottomAppBar
        shape: CircularNotchedRectangle(),
        //color of the BottomAppBar
        color: Colors.white,
      ),
    );
  }
}