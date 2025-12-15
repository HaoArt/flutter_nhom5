import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_application_1/model/article.dart';

class DetailArticlePage extends StatelessWidget {
  final Article article;

  const DetailArticlePage({required this.article});

  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat(
      'dd/MM/yyyy • HH:mm',
    ).format(article.publishedAt);

    return Title(
      title: "Chi tiết bài viết",
      color: Colors.blue,
      child: Scaffold(
        appBar: AppBar(title: Text("Chi tiết bài viết")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // 👈 canh trái
            children: [
              if (article.urlToImage.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    article.urlToImage,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 200,
                        color: Colors.grey.shade300,
                        child: Center(
                          child: Icon(
                            Icons.broken_image,
                            size: 60,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    },
                  ),
                ),

              SizedBox(height: 16),

              Text(
                article.title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10),

              Row(
                children: [
                  Icon(Icons.person, size: 18),
                  SizedBox(width: 4),
                  Text(article.author.isNotEmpty ? article.author : "Không rõ"),

                  SizedBox(width: 16),

                  Icon(Icons.access_time, size: 18),
                  SizedBox(width: 4),

                  Text(formattedDate), // 👈 GIỜ ĐÚNG
                ],
              ),

              SizedBox(height: 16),

              if (article.description.isNotEmpty)
                Text(
                  article.description,
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),

              SizedBox(height: 16),

              Text(
                article.content.isNotEmpty
                    ? article.content
                    : "Không có nội dung hiển thị.",
                style: TextStyle(fontSize: 16),
              ),

              SizedBox(height: 30),

              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  ),
                  onPressed: () async {
                    final Uri url = Uri.parse(article.url);
                    if (!await launchUrl(
                      url,
                      mode: LaunchMode.externalApplication,
                    )) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Không mở được link")),
                      );
                    }
                  },
                  child: Text("Đọc bài gốc", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
