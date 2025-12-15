import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/article_api.dart';
import 'package:flutter_application_1/model/article.dart';
import 'package:flutter_application_1/screen/detail_article.dart';

class ArticlePage extends StatelessWidget {
  final NewsService newsService = NewsService();

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Tin tức",
      color: Colors.blue,
      child: Scaffold(
        appBar: AppBar(title: Text("Tin tức")),
        body: FutureBuilder<List<Article>>(
          future: newsService.fetchNews(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            final articles = snapshot.data!;

            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final a = articles[index];

                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: CachedNetworkImage(
                        imageUrl: a.urlToImage,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          width: 70,
                          height: 70,
                          color: Colors.grey.shade200,
                          child: Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            Icon(Icons.broken_image, size: 30),
                      ),
                    ),
                    title: Text(
                      a.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      a.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailArticlePage(article: a),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
