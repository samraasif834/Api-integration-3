import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project3/model/home_screen_model.dart';
import 'package:project3/service/home_screen_service.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Api Integration")),
      ),
      body: FutureBuilder(
          future: getApi(),
          builder: (context, AsyncSnapshot<List<User_model>> snapshot) {
            if (!snapshot.hasData) {
              return Text("Loading");
            }
            if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return ListView.builder(
                  itemCount: userlist.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Api(title: 'Email', value: snapshot.data![index].email.toString()),
                         Api(title: 'Address', value: snapshot.data![index].address!.street.toString()),                  
                         Api(title: 'Geo', value: snapshot.data![index].address!.geo!.lat.toString()),

                          
                          ],
                          
                      ),
                    );
                  });
            }
          }),
    );
  }
}

class Api extends StatelessWidget {
  String title;
  String value;
 Api({ Key? key ,required this.title,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(value),

      ],
    );
  }
}