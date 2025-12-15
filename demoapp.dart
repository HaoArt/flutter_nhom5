import 'package:flutter/material.dart';

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Picture Place",
      color: Colors.blue,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          title: const Text("Picture Place"),
          centerTitle: true,
        ),
        body: Padding(padding: const EdgeInsets.all(16), child: myBody()),
      ),
    );
  }

  Widget myBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        block1(),
        const SizedBox(height: 5),
        block2(),
        const SizedBox(height: 5),
        block3(),
        const SizedBox(height: 5),
        block4(),
        const SizedBox(height: 5),
        block5(),
      ],
    );
  }

  Widget block1() {
    return SizedBox(
      width: 500,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            children: [
              IconButton(
                onPressed: null,
                icon: const Icon(Icons.notifications),
              ),
            ],
          ),
          Column(
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: null,
                    icon: const Icon(Icons.extension),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget block2() {
    return SizedBox(
      width: 500,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: "Welcome, \n",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60),
              children: const <TextSpan>[
                TextSpan(
                  text: "Charlie",
                  style: TextStyle(fontWeight: FontWeight.w100),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget block3() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Search",
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget block4() {
    return Row(
      children: [
        Text(
          "Saved Places",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Widget block5() {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 4 / 3,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset('assets/img/1.png', fit: BoxFit.contain),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset('assets/img/2.png', fit: BoxFit.contain),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset('assets/img/3.png', fit: BoxFit.contain),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset('assets/img/4.png', fit: BoxFit.contain),
          ),
        ],
      ),
    );
  }
}
