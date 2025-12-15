import 'package:flutter/material.dart';
import 'package:flutter_application_1/api.dart';
import 'package:flutter_application_1/model/product.dart';

class MyProducts extends StatefulWidget {
  const MyProducts({super.key});

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await test_api.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "My Shop",
      color: Colors.blue,
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Shop"),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
        ),
        body: FutureBuilder(
          future: test_api.getAllProducts(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.done) {
              return myListProduct(snap.data!);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  // children: ls.map((p) => myProduct(p)).toList(),
  Widget myListProduct(List<Product> ls) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: ls.length,
      itemBuilder: (context, index) {
        return myProduct(ls[index]);
      },
    );
  }

  Widget myProduct(Product p) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(p.image, fit: BoxFit.cover),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 36,
                      child: Text(
                        p.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 6),

                    Text(
                      "${p.price} đ",
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),

                    Row(
                      children: [
                        Icon(Icons.star, size: 16, color: Colors.orange),
                        SizedBox(width: 4),
                        Text(
                          "${p.rating.rate}",
                          style: TextStyle(fontSize: 13),
                        ),
                        SizedBox(width: 4),
                        Text(
                          "(${p.rating.count})",
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
