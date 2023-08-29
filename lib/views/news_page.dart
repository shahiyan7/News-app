// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:news_app/models/article_model.dart';

class NewsPage extends StatefulWidget {
  final List articles;
  const NewsPage({
    required this.articles,
  });

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    // TODO: implement initState
    print(widget.articles.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('News Page')),
        body: ListView.builder(
            itemCount: widget.articles.length,
            itemBuilder: (context, index) {
              final article = widget.articles[index];
              return Card(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: article.urlToImage!=null?
                        Image.network(
                          article.urlToImage,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                   
                        ):CircularProgressIndicator()
                      ),
                      SizedBox(height: 8,), 
                      Text(
                        article.title!=null?article.title:'No Title',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                     SizedBox(height: 8,),
                      Text(
                        article.description!=null?article.description:'No Description',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
