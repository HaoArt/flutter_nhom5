import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Sahara",
      color: Colors.blue,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(197, 207, 230, 249),
          title: const Text("Chi tiết"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(child: myBody()),
      ),
    );
  }

  Widget myBody() {
    return Column(children: [block1(), block2(), block3(), block4()]);
  }

  Widget block1() {
    var src =
        'https://images.unsplash.com/photo-1732454940390-3aa645d710a4?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
    return Image.network(src);
  }

  Widget block2() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hoang mạc Sahara",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text("Phía Bắc Châu phi", style: TextStyle(color: Colors.grey)),
            ],
          ),
          Row(
            children: [
              Icon(Icons.star, color: Colors.red),
              Text("41"),
            ],
          ),
        ],
      ),
    );
  }

  Widget block3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Icon(Icons.phone, color: Colors.blue),
            Text("CALL"),
          ],
        ),
        Column(
          children: [
            Icon(Icons.near_me, color: Colors.blue),
            Text("Router"),
          ],
        ),
        Column(
          children: [
            Icon(Icons.share, color: Colors.blue),
            Text("Share"),
          ],
        ),
      ],
    );
  }

  Widget block4() {
    var str =
        "Hoang mạc Sahara là hoang mạc nóng lớn nhất thế giới, nằm ở Bắc Phi và trải dài qua hơn 10 quốc gia như Ai Cập, Libya, Algeria và Maroc. Sahara có diện tích khoảng 9 triệu km², với đặc trưng là những cồn cát mênh mông, cao nguyên đá, cùng khí hậu cực kỳ khắc nghiệt: ban ngày nhiệt độ có thể vượt quá 50°C, trong khi ban đêm lại rất lạnh. Mặc dù điều kiện sống khắc nghiệt, Sahara vẫn có hệ sinh thái riêng với các loài động thực vật thích nghi tốt như lạc đà, cáo sa mạc và các loài cây chịu hạn, đồng thời là nơi sinh sống lâu đời của một số cộng đồng du mục.";
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Text(str, textAlign: TextAlign.justify),
    );
  }
}
