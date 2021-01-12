import 'package:demo_app/pages/catalog_page.dart';
import 'package:flutter/material.dart';

class CatalogListTile extends StatelessWidget {
  final imgUrl;

  CatalogListTile({Key key, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CatalogPage(
            imgUrl: imgUrl,
          ),
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(imgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text('Fresh summer set'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('09:00 - 00:00'),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.amberAccent,
                  ),
                  Text('4.9'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
