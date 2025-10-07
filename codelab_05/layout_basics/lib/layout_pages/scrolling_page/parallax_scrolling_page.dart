import 'package:flutter/material.dart';

class ParallaxScrollingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Parallax Scrolling'),
              background: Image.network(
                'https://www.google.com/imgres?q=gambar%20online&imgurl=https%3A%2F%2Fmaxipro.co.id%2Fwp-content%2Fuploads%2F2021%2F11%2Fsemua-serba-online-Maxipro.png&imgrefurl=https%3A%2F%2Fmaxipro.co.id%2Fmengenal-online-printing-solusi-percetakan-agar-bertahan%2F&docid=4fqzAQdx8u6mZM&tbnid=lXYSiq7e1Mf85M&vet=12ahUKEwjS3ZHcmpKQAxUqRmwGHdLfKD0QM3oECA8QAA..i&w=770&h=470&hcb=2&ved=2ahUKEwjS3ZHcmpKQAxUqRmwGHdLfKD0QM3oECA8QAA/500x300',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('Item $index')),
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
