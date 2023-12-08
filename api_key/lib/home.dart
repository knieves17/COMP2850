import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_key/datamodel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  // Define a list to hold your articles
  List<Article> articles = [];

  _getData() async {
    try {
      String url = "https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=2177254705934afe9ee1e593b5cac437";  // Update this URL to your API endpoint
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        // Parse the response using DataModel.fromJson
        DataModel dataFromAPI = DataModel.fromJson(json.decode(res.body));

        // Assign articles to the list
        articles = dataFromAPI.articles;

        // Set isLoading to false to show the data
        _isLoading = false;
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("REST API Example"),
      ),
      body: _isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display the article image
                Image.network(
                  articles[index].urlToImage.toString(),
                  width: 200,
                ),

                // Display the article title
                Text(articles[index].title.toString()),
                // Display other information
                Text("Author: ${articles[index].author.toString()}"),
                Text("Description: ${articles[index].description.toString()}"),
                Text("URL: ${articles[index].url.toString()}"),
              ],
            ),
          );
        },
        itemCount: articles.length,
      ),
    );
  }
}