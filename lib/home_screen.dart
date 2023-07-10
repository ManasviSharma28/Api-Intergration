import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_learning/model.dart';

import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<SampleApii> sampleApii = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                itemCount: sampleApii.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    margin: EdgeInsets.only(bottom: 10),
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getText(index, 'ID:', sampleApii[index].id.toString()),
                        getText(
                            index, 'NAME:', sampleApii[index].name.toString()),
                        getText(index, 'USERNAME:',
                            sampleApii[index].username.toString()),
                        getText(index, 'EMAIL:',
                            sampleApii[index].email.toString()),
                        getText(index, 'PHONE:',
                            sampleApii[index].phone.toString()),
                        getText(index, 'WEBSITE:',
                            sampleApii[index].website.toString()),
                        getText(index, 'COMPANY:',
                            sampleApii[index].company.toString()),
                        getText(index, 'ADDRESS:',
                            '${sampleApii[index].address.suite.toString()},${sampleApii[index].address.street.toString()},${sampleApii[index].address.city.toString()},-${sampleApii[index].address.zipcode.toString()},'),
                      ],
                    ),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });

    /*FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: sampleApi.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 120,
                  color: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'User id : ${sampleApi[index].userId}',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        ' id : ${sampleApi[index].id}',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Title : ${sampleApi[index].title}',
                        style: TextStyle(fontSize: 18),
                        maxLines: 1,
                      ),
                      Text(
                        'Body : ${sampleApi[index].body}',
                        style: TextStyle(fontSize: 18),
                        maxLines: 1,
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<List<SampleApi>> getData() async {
    final reponse =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(reponse.body.toString());
    if (reponse.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        sampleApi.add(SampleApi.fromJson(index));
      }
      return sampleApi;
    } else {
      return sampleApi;

    }*/
  }

  Text getText(int index, String fieldName, String content) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: fieldName,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      TextSpan(
          text: content,
          style: TextStyle(
            fontSize: 16,
          )),
      TextSpan(text: ''),
    ]));
  }

  Future<List<SampleApii>> getData() async {
    final reponse =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(reponse.body.toString());
    if (reponse.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        sampleApii.add(SampleApii.fromJson(index));
      }
      return sampleApii;
    } else {
      return sampleApii;
    }
  }
}
