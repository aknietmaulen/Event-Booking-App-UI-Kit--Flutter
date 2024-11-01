import 'package:event_booking_app_ui/models/event_model.dart';
import 'package:event_booking_app_ui/models/tab_item_model.dart';
import 'package:event_booking_app_ui/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../my_theme.dart';
import 'package:event_booking_app_ui/screens/events.dart';
import 'package:event_booking_app_ui/screens/home/home_screen.dart';
import 'package:event_booking_app_ui/screens/profile_page.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  var bottomBarItemSelectedIndex = 2; // Start on Map page
  late GoogleMapController mapController;

  final Set<Marker> _markers = {}; // Set of markers to be displayed on the map

  final bottomBarItemsDataList = [
    TabItemModel(
      image: "assets/icons/ic_explore.png",
      title: "Explore",
      backgroundColor: MyTheme.customRed,
    ),
    TabItemModel(
      image: "assets/icons/ic_calendar.png",
      title: "Events",
      backgroundColor: MyTheme.customYellowWithOrangeShade,
    ),
    TabItemModel(
      image: "assets/icons/ic_location_marker.png",
      title: "Map",
      backgroundColor: MyTheme.foodTabItemColor,
    ),
    TabItemModel(
      image: "assets/icons/ic_profile.png",
      title: "Profile",
      backgroundColor: MyTheme.customRed,
    ),
  ];

  void selectBottomBarItem(int index) {
    print(">> selectBottomBarItem : index = $index");
    setState(() {
      bottomBarItemSelectedIndex = index;
    });
  }

  // Initial position for the map
  static const LatLng _initialPosition = LatLng(51.16693117041015, 71.42941761898858); // Coordinates for Almaty, Kazakhstan

  @override
  void initState() {
    super.initState();
    _fetchEvents(); // Fetch events when the map page is initialized
  }

  Future<void> _fetchEvents() async {
    await Provider.of<EventsProvider>(context, listen: false).fetchEvents();
    final events = Provider.of<EventsProvider>(context, listen: false).events;
    _setMarkers(events);
  }

  void _setMarkers(List<EventModel> events) {
    for (var event in events) {
      final latLng = LatLng(event.location.latitude, event.location.longitude); // Access latitude and longitude from GeoPoint
      _markers.add(
        Marker(
          markerId: MarkerId(event.name), // Use a unique identifier for the marker
          position: latLng,
          infoWindow: InfoWindow(
            title: event.name,
            snippet: event.description,
          ),
          onTap: () {
            // Handle marker tap
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(event.name),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(event.photo), // Display the event photo
                      SizedBox(height: 8),
                      Text(event.description),
                      SizedBox(height: 8),
                      Text('Location: ${event.place}'),
                    ],
                  ),
                  actions: [
                    TextButton(
                      child: Text('Close'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      );
    }
    setState(() {}); // Update the UI to show the markers
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
        automaticallyImplyLeading: false,
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 12.0,
        ),
        markers: _markers, // Set the markers to be displayed
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomBarItem(
              imagePath: bottomBarItemsDataList[0].image,
              title: bottomBarItemsDataList[0].title,
              isSelected: bottomBarItemSelectedIndex == 0,
              onTap: () {
                selectBottomBarItem(0);
                // Navigate to the Events Page
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
            ),
            BottomBarItem(
              imagePath: bottomBarItemsDataList[1].image,
              title: bottomBarItemsDataList[1].title,
              isSelected: bottomBarItemSelectedIndex == 1,
              onTap: () {
                selectBottomBarItem(1);
                // Navigate to the Events Page
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EventsPage(),
                  ),
                );
              },
            ),
            SizedBox(width: 30), // Spacing for FAB
            BottomBarItem(
              imagePath: bottomBarItemsDataList[2].image,
              title: bottomBarItemsDataList[2].title,
              isSelected: bottomBarItemSelectedIndex == 2,
              onTap: () {
                selectBottomBarItem(2);
              },
            ),
            BottomBarItem(
              imagePath: bottomBarItemsDataList[3].image,
              title: bottomBarItemsDataList[3].title,
              isSelected: bottomBarItemSelectedIndex == 3,
              onTap: () {
                selectBottomBarItem(3);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final bool isSelected;
  final Function onTap;

  const BottomBarItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap.call();
      },
      child: Container(
        margin: EdgeInsets.only(top: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              width: 24,
              height: 24,
              image: AssetImage(imagePath),
              color: (isSelected) ? MyTheme.customBlue1 : MyTheme.grey,
            ),
            Text(
              title,
              style: TextStyle(
                color: (isSelected) ? MyTheme.customBlue1 : MyTheme.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}



// import 'package:event_booking_app_ui/models/tab_item_model.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import '../../my_theme.dart';
// import 'package:event_booking_app_ui/screens/events.dart';
// import 'package:event_booking_app_ui/screens/home/home_screen.dart';
// import 'package:event_booking_app_ui/screens/profile_page.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import '../../my_theme.dart';

// class MapPage extends StatefulWidget {
//   const MapPage({super.key});

//   @override
//   State<MapPage> createState() => _MapPageState();
// }

// class _MapPageState extends State<MapPage> {
//   var bottomBarItemSelectedIndex = 2; // Start on Map page
//   late GoogleMapController mapController;

//   final bottomBarItemsDataList = [
//     TabItemModel(
//       image: "assets/icons/ic_explore.png",
//       title: "Explore",
//       backgroundColor: MyTheme.customRed,
//     ),
//     TabItemModel(
//       image: "assets/icons/ic_calendar.png",
//       title: "Events",
//       backgroundColor: MyTheme.customYellowWithOrangeShade,
//     ),
//     TabItemModel(
//       image: "assets/icons/ic_location_marker.png",
//       title: "Map",
//       backgroundColor: MyTheme.foodTabItemColor,
//     ),
//     TabItemModel(
//       image: "assets/icons/ic_profile.png",
//       title: "Profile",
//       backgroundColor: MyTheme.customRed,
//     ),
//   ];

//   void selectBottomBarItem(int index) {
//     print(">> selectBottomBarItem : index = $index");
//     setState(() {
//       bottomBarItemSelectedIndex = index;
//     });
//   }

//   // Initial position for the map
//   static const LatLng _initialPosition = LatLng(51.16693117041015, 71.42941761898858); // Coordinates for Almaty, Kazakhstan


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Map'),
//         automaticallyImplyLeading: false,
//       ),
//       body: GoogleMap(
//         onMapCreated: (GoogleMapController controller) {
//           mapController = controller;
//         },
//         initialCameraPosition: CameraPosition(
//           target: _initialPosition,
//           zoom: 12.0,
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             BottomBarItem(
//               imagePath: bottomBarItemsDataList[0].image,
//               title: bottomBarItemsDataList[0].title,
//               isSelected: bottomBarItemSelectedIndex == 0,
//               onTap: () {
//                 selectBottomBarItem(0);
//                 // Navigate to the Events Page
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => HomeScreen(
//                       //savedEvents: eventList, // Pass the saved events here
//                     ),
//                   ),
//                 );
//               },
//             ),
//             BottomBarItem(
//               imagePath: bottomBarItemsDataList[1].image,
//               title: bottomBarItemsDataList[1].title,
//               isSelected: bottomBarItemSelectedIndex == 1,
//               onTap: () {
//                 selectBottomBarItem(1);

//                 // Navigate to the Events Page
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => EventsPage(
//                       //savedEvents: eventList, // Pass the saved events here
//                     ),
//                   ),
//                 );
//               },
//             ),
//             SizedBox(width: 30), // Spacing for FAB
//             BottomBarItem(
//               imagePath: bottomBarItemsDataList[2].image,
//               title: bottomBarItemsDataList[2].title,
//               isSelected: bottomBarItemSelectedIndex == 2,
//               onTap: () {
//                 selectBottomBarItem(2);
//               },
//             ),
//             BottomBarItem(
//               imagePath: bottomBarItemsDataList[3].image,
//               title: bottomBarItemsDataList[3].title,
//               isSelected: bottomBarItemSelectedIndex == 3,
//               onTap: () {
//                 selectBottomBarItem(3);

//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => ProfilePage(
//                       //savedEvents: eventList, // Pass the saved events here
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BottomBarItem extends StatelessWidget {
//   String imagePath;
//   String title;
//   bool isSelected;
//   Function onTap;

//   BottomBarItem(
//       {super.key,
//       required this.imagePath,
//       required this.title,
//       required this.isSelected,
//       required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         onTap.call();
//       },
//       child: Container(
//         margin: EdgeInsets.only(top: 6),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Image(
//               width: 24,
//               height: 24,
//               image: AssetImage(imagePath),
//               color: (isSelected) ? MyTheme.customBlue1 : MyTheme.grey,
//             ),
//             Text(
//               title,
//               style: TextStyle(
//                   color: (isSelected) ? MyTheme.customBlue1 : MyTheme.grey),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TabItemsList extends StatelessWidget {
//   const TabItemsList({
//     super.key,
//     required this.tabItemsList,
//   });

//   final List<TabItemModel> tabItemsList;

//   @override
//   Widget build(BuildContext context) {
//     final query = MediaQuery.of(context);
//     return Container(
//       height: 40,
//       width: query.size.width,
//       margin: EdgeInsets.symmetric(vertical: 12),
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (ctx, index) {
//           final item = tabItemsList[index];
//           return TabItem(
//             image: item.image,
//             title: item.title,
//             backgroundColor: item.backgroundColor,
//           );
//         },
//         itemCount: tabItemsList.length,
//       ),
//     );
//   }
// }

// class TabItem extends StatelessWidget {
//   String image;
//   String title;
//   Color backgroundColor;
//   TabItem({
//     super.key,
//     required this.image,
//     required this.title,
//     required this.backgroundColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(right: 14),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(24)),
//         color: backgroundColor,
//       ),
//       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Image(
//             image: AssetImage(image),
//             width: 18,
//             height: 18,
//           ),
//           const SizedBox(width: 10),
//           Text(
//             title,
//             style: const TextStyle(
//               fontSize: 12,
//               color: Colors.white,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }





// // // class MapPage extends StatefulWidget {
// // //   final String selectedCity; // Add this line
// // //   const MapPage({super.key, required this.selectedCity}); // Modify the constructor

// // //   @override
// // //   State<MapPage> createState() => _MapPageState();
// // // }

// // // class _MapPageState extends State<MapPage> {
// // //   var bottomBarItemSelectedIndex = 2; // Start on Map page
// // //   late GoogleMapController mapController;

// // //   late LatLng _initialPosition; // Change to late initialization

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _initialPosition = getCoordinatesForCity(widget.selectedCity); // Get the coordinates based on city
// // //   }

// // //   // Method to get coordinates based on city name
// // //   LatLng getCoordinatesForCity(String city) {
// // //     switch (city) {
// // //       case 'Astana':
// // //         return LatLng(51.1694, 71.4491); // Coordinates for Astana
// // //       // You can add more cities here if needed
// // //       default:
// // //         return LatLng(51.1694, 71.4491); // Default to Astana if city not found
// // //     }
// // //   }

// // //   void selectBottomBarItem(int index) {
// // //     print(">> selectBottomBarItem : index = $index");
// // //     setState(() {
// // //       bottomBarItemSelectedIndex = index;
// // //     });
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Map - ${widget.selectedCity}'),
// // //       ),
// // //       body: GoogleMap(
// // //         onMapCreated: (GoogleMapController controller) {
// // //           mapController = controller;
// // //         },
// // //         initialCameraPosition: CameraPosition(
// // //           target: _initialPosition,
// // //           zoom: 10.0,
// // //         ),
// // //         myLocationEnabled: true,
// // //         // Add other map configurations if needed
// // //       ),
// // //       bottomNavigationBar: BottomAppBar(
// // //         child: Row(
// // //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // //           children: [
// // //             BottomBarItem(
// // //               imagePath: "assets/icons/ic_explore.png",
// // //               title: "Explore",
// // //               isSelected: bottomBarItemSelectedIndex == 0,
// // //               onTap: () {
// // //                 selectBottomBarItem(0);
// // //                 Navigator.of(context).push(
// // //                   MaterialPageRoute(
// // //                     builder: (context) => HomeScreen(),
// // //                   ),
// // //                 );
// // //               },
// // //             ),
// // //             BottomBarItem(
// // //               imagePath: "assets/icons/ic_calendar.png",
// // //               title: "Events",
// // //               isSelected: bottomBarItemSelectedIndex == 1,
// // //               onTap: () {
// // //                 selectBottomBarItem(1);
// // //                 Navigator.of(context).push(
// // //                   MaterialPageRoute(
// // //                     builder: (context) => EventsPage(),
// // //                   ),
// // //                 );
// // //               },
// // //             ),
// // //             BottomBarItem(
// // //               imagePath: "assets/icons/ic_location_marker.png",
// // //               title: "Map",
// // //               isSelected: bottomBarItemSelectedIndex == 2,
// // //               onTap: () {
// // //                 selectBottomBarItem(2);
// // //               },
// // //             ),
// // //             BottomBarItem(
// // //               imagePath: "assets/icons/ic_profile.png",
// // //               title: "Profile",
// // //               isSelected: bottomBarItemSelectedIndex == 3,
// // //               onTap: () {
// // //                 selectBottomBarItem(3);
// // //                 Navigator.of(context).push(
// // //                   MaterialPageRoute(
// // //                     builder: (context) => ProfilePage(),
// // //                   ),
// // //                 );
// // //               },
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class BottomBarItem extends StatelessWidget {
// // //   final String imagePath;
// // //   final String title;
// // //   final bool isSelected;
// // //   final Function onTap;

// // //   BottomBarItem({
// // //     super.key,
// // //     required this.imagePath,
// // //     required this.title,
// // //     required this.isSelected,
// // //     required this.onTap,
// // //   });

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return InkWell(
// // //       onTap: () {
// // //         onTap.call();
// // //       },
// // //       child: Container(
// // //         margin: EdgeInsets.only(top: 6),
// // //         child: Column(
// // //           mainAxisSize: MainAxisSize.min,
// // //           children: [
// // //             Image(
// // //               width: 24,
// // //               height: 24,
// // //               image: AssetImage(imagePath),
// // //               color: (isSelected) ? MyTheme.customBlue1 : MyTheme.grey,
// // //             ),
// // //             Text(
// // //               title,
// // //               style: TextStyle(
// // //                 color: (isSelected) ? MyTheme.customBlue1 : MyTheme.grey,
// // //               ),
// // //             )
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
