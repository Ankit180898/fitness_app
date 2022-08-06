import 'package:fitness_app/colors.dart';
import 'package:fitness_app/swimming.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String location ='Null, Press Button';
  String Address = 'Search';
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
  Future<void> GetAddressFromLatLong()async {
    Position position = await _getGeoLocationPosition();
    location ='Lat: ${position.latitude} , Long: ${position.longitude}';
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    print(Address);
    setState(()  {

    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Color(0xFFEEEFEF),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     ClipRRect(borderRadius: BorderRadius.circular(50),child: Image.network("https://4bgowik9viu406fbr2hsu10z-wpengine.netdna-ssl.com/wp-content/uploads/2020/03/Portrait_5-1.jpg",height: 60,width: 60,)),
                      Container(
                        decoration: BoxDecoration(
                          color: AllColors().selectClr.withOpacity(0.1),
                          border: Border.all(
                              color: AllColors().selectClr.withOpacity(0.3),
                              width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  30.0) //                 <--- border radius here
                              ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: SvgPicture.asset('assets/images/location.svg'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Text(
                                '${Address}',
                                style: TextStyle(
                                    fontFamily: "Sora",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AllColors().blackClr),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Hi Alok",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Sora"),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Explore the sport facilites \nnear you",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Sora")))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 20,top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Recommended",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Sora"),
                      ),
                      //
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              "See all",
                              style: TextStyle(
                                fontFamily: "Sora",
                                fontWeight: FontWeight.w600,
                                color: AllColors().primaryClr,
                                fontSize: 13,
                              ),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: AllColors().primaryClr,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Container(

                  height: 230,

                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      // the number of items in the list
                      itemCount: swimmingDetails.length,

                      // display each item of the product list
                      itemBuilder: (context, index) {
                        return Card(
                          shadowColor: AllColors().boxShadow.withOpacity(0.25),
                          elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          // In many cases, the key isn't mandatory
                            margin: const EdgeInsets.symmetric(vertical:5,horizontal: 18),
                            child: InkWell(
                              onTap: (){},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(

                                    children: [
                                      ClipRRect(borderRadius: BorderRadius.only(topLeft:Radius.circular(15),topRight:Radius.circular(15)),child: Image.network("https://images.unsplash.com/photo-1622629797619-c100e3e67e2e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHN3aW1taW5nfGVufDB8fDB8fA%3D%3D&w=1000&q=80",height: 150,width: 300,fit: BoxFit.cover,)),
                                      Row(
                                        children: [
                                          ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),child: SvgPicture.asset("assets/images/swimming.svg")),

                                          Align(alignment: Alignment.centerRight,child: SvgPicture.asset("assets/images/like.svg",height: 42,width: 42,))
                                        ],
                                      ),


                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,top: 10),
                                    child: Align(alignment: Alignment.centerLeft,child: Text(swimmingDetails[index].title,style: TextStyle(fontFamily: "Sora",fontWeight: FontWeight.w600,fontSize: 16,color: AllColors().blackClr))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset("assets/images/location_outline.svg",height: 15,width: 15,color: Colors.black,),
                                        Text(swimmingDetails[index].location,style: TextStyle(fontFamily: "Sora",fontWeight: FontWeight.w400,fontSize: 14,color: AllColors().darkGreyClr),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      }),
                ),
                SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text(
                        "Explore ${Address}",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Sora"),
                      ),
                      //
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              "See all",
                              style: TextStyle(
                                fontFamily: "Sora",
                                fontWeight: FontWeight.w600,
                                color: AllColors().primaryClr,
                                fontSize: 13,
                              ),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: AllColors().primaryClr,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Container(

                  height: 250,

                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      // the number of items in the list
                      itemCount: swimmingDetails.length,

                      // display each item of the product list
                      itemBuilder: (context, index) {
                        return Card(
                            shadowColor: AllColors().boxShadow.withOpacity(0.25),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            // In many cases, the key isn't mandatory
                            margin: const EdgeInsets.symmetric(vertical:5,horizontal: 18),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(

                                  children: [
                                    ClipRRect(borderRadius: BorderRadius.only(topLeft:Radius.circular(15),topRight:Radius.circular(15)),child: Image.network("https://images.unsplash.com/photo-1622629797619-c100e3e67e2e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHN3aW1taW5nfGVufDB8fDB8fA%3D%3D&w=1000&q=80",height: 150,width: 300,fit: BoxFit.cover,)),
                                    Row(
                                      children: [
                                        ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),child: SvgPicture.asset("assets/images/swimming.svg")),

                                        Align(alignment: Alignment.centerRight,child: SvgPicture.asset("assets/images/like.svg",height: 42,width: 42,))
                                      ],
                                    ),


                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,top: 10),
                                  child: Align(alignment: Alignment.centerLeft,child: Text(swimmingDetails[index].title,style: TextStyle(fontFamily: "Sora",fontWeight: FontWeight.w600,fontSize: 16,color: AllColors().blackClr))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_on_rounded,),
                                      Text(swimmingDetails[index].location,style: TextStyle(fontFamily: "Sora",fontWeight: FontWeight.w400,fontSize: 14,color: AllColors().darkGreyClr),),
                                    ],
                                  ),
                                ),
                              ],
                            ));
                      }),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
