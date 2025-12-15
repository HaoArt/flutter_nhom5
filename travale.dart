import 'package:flutter/material.dart';

class MyTravel extends StatelessWidget {
  const MyTravel({super.key});

  final List<Map<String, dynamic>> hotels = const [
    {
      "name": "An Nam Hue Boutique",
      "rating": 9.2,
      "review": "Tuyệt hảo",
      "reviewsCount": 34,
      "location": "Cư Chinh • cách bạn 0,9km",
      "roomInfo": "1 phòng khách sạn: 1 giường",
      "price": 20,
      "image":
          "https://images.unsplash.com/photo-1549294413-26f195200c16?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aG90ZWx8ZW58MHx8MHx8fDI%3D&auto=format&fit=crop&q=60&w=600",
    },
    {
      "name": "Huế Jade Hill Villa",
      "rating": 8.0,
      "review": "Rất tốt",
      "reviewsCount": 10,
      "location": "Cư Chinh • cách bạn 1,3km",
      "roomInfo": "1 biệt thự riêng: 3 phòng ngủ",
      "price": 285,
      "image":
          "https://images.unsplash.com/photo-1445019980597-93fa8acb246c?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG90ZWx8ZW58MHx8MHx8fDI%3D&auto=format&fit=crop&q=60&w=600",
    },
    {
      "name": "aNhill Boutique",
      "rating": 9.5,
      "review": "Xuất sắc",
      "reviewsCount": 95,
      "location": "Huế • cách bạn 0,6km",
      "roomInfo": "1 suite riêng: 1 giường",
      "price": 109,
      "image":
          "https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aG90ZWx8ZW58MHx8MHx8fDI%3D&auto=format&fit=crop&q=60&w=600",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Danh Sách Phòng",
      color: Colors.blue,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          title: const Text("Danh Sách Phòng"),
          centerTitle: true,
        ),
        body: myBody(),
      ),
    );
  }

  Widget myBody() {
    return SingleChildScrollView(child: Column(children: [block1(), block2()]));
  }

  Widget block1() {
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        // Thanh công cụ sắp xếp, lọc, bản đồ
        Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Container(
            color: const Color.fromARGB(255, 237, 237, 237),
            padding: const EdgeInsets.only(top: 40.0, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _toolItem(
                  Icons.compare_arrows_outlined,
                  "Sắp xếp",
                  rotate: -1.5708,
                ),
                _toolItem(Icons.format_align_left, "Lọc"),
                _toolItem(Icons.map_outlined, "Bản đồ"),
              ],
            ),
          ),
        ),

        Container(height: 100, color: const Color(0xFF003B95)),

        Positioned(
          top: 70,
          left: 16,
          right: 16,
          child: AppBar(
            toolbarHeight: 60,
            backgroundColor: Colors.white,
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            leading: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Xung quanh vị trí hiện tại",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                Text(
                  "23 thg 10 – 24 thg 10",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _toolItem(IconData icon, String label, {double rotate = 0}) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Transform.rotate(
            angle: rotate,
            child: Icon(icon, color: Colors.black),
          ),
        ),
        Text(label),
      ],
    );
  }

  Widget block2() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "757 chỗ nghỉ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          ...hotels.map((hotel) => item(hotel)).toList(),
        ],
      ),
    );
  }

  Widget item(Map<String, dynamic> hotel) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ảnh khách sạn
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                hotel["image"],
                width: 110,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),

            // Thông tin
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tên khách sạn
                  Row(
                    children: [
                      Text(
                        hotel["name"],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // Đánh giá
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          "${hotel["rating"]}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(hotel["review"]),
                      const SizedBox(width: 6),
                      Text(
                        "${hotel["reviewsCount"]} đánh giá",
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // Vị trí
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        hotel["location"],
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // Thông tin phòng (RichText)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      RichText(
                        text: TextSpan(
                          text: "${hotel["roomInfo"].split(":")[0]}: ",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: hotel["roomInfo"].split(":").length > 1
                                  ? hotel["roomInfo"].split(":")[1]
                                  : "",
                              style: const TextStyle(
                                fontWeight: FontWeight.w100,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // Giá
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      Text(
                        "US\$${hotel["price"]}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  // Thuế & phí
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "Đã bao gồm thuế và phí",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w100,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
