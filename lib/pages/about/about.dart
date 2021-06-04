import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  SizedBox _buildCard(BuildContext context, {required String nama, required String assetPhoto, required String socialMediaTag}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.45,
      child: Card(
        elevation: 7,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Stack(
                // fit: StackFit.expand,
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    right: 0,
                    left: 0,
                    top: 0,
                    bottom: -5,
                    child: Container(
                      color: Colors.grey[400],
                      child: Image(
                        image: AssetImage(assetPhoto),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 15,
                          blurRadius: 30,
                          offset: Offset(0, 0),
                        ),
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 5,
                          blurRadius: 20,
                          offset: Offset(0, 18),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 2,
                    bottom: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nama,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.7,
                            fontSize: (MediaQuery.of(context).size.height * 0.1) * 0.25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                color: const Color(0xff494949),
                child: Text(
                  socialMediaTag,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: (MediaQuery.of(context).size.height * 0.1) * 0.17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Anggota Kelompok 1',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[200],
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Center(
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.start,
                verticalDirection: VerticalDirection.up,
                runSpacing: 15,
                spacing: 10,
                children: [
                  _buildCard(
                    context,
                    nama: 'Say Habsyie',
                    assetPhoto: 'assets/icons/anonym.png',
                    socialMediaTag: ''
                  ),
                  _buildCard(
                    context,
                    nama: 'Syifa Assegaf',
                    assetPhoto: 'assets/icons/anonym.png',
                    socialMediaTag: ''
                  ),
                  _buildCard(
                    context,
                    nama: 'Marzuki Ahmad S',
                    assetPhoto: 'assets/images/photos/me.jpg',
                    socialMediaTag: '@uki.io'
                  ),
                  _buildCard(
                    context,
                    nama: 'Dicky Hermawan',
                    assetPhoto: 'assets/icons/anonym.png',
                    socialMediaTag: ''
                  ),
                  _buildCard(
                    context,
                    nama: 'Aldi Ahmad',
                    assetPhoto: 'assets/icons/anonym.png',
                    socialMediaTag: ''
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
