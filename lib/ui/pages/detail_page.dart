import 'package:airplane/models/destination_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/choose_seat_page.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/interest_item.dart';
import 'package:airplane/ui/widgets/photo_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final DestinationModel destination;

  const DetailPage(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(destination.imageUrl), fit: BoxFit.cover)),
      );
    }

    Widget customShadow() {
      return Container(
        height: 214,
        margin: EdgeInsets.only(top: 236),
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              kWhiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95)
            ])),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        width: double.infinity,
        child: Column(
          children: [
            // NOTE: Emblem
            Container(
              width: 108,
              height: 24,
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icon_emblem.png'))),
            ),
            // NOTE: Title
            Container(
              margin: EdgeInsets.only(top: 256),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destination.name,
                          style: whiteTextStyle.copyWith(
                              fontSize: 24, fontWeight: semiBold),
                        ),
                        Text(
                          destination.city,
                          style: whiteTextStyle.copyWith(
                              fontSize: 16, fontWeight: light),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        margin: EdgeInsets.only(right: 1),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/icon_star.png'))),
                      ),
                      Text(
                        destination.rating.toString(),
                        style: whiteTextStyle.copyWith(
                            fontSize: 14, fontWeight: medium),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                  color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NOTE: About
                  Text('About',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold)),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
                    style: blackTextStyle.copyWith(height: 2),
                  ),
                  // NOTE: Photos
                  SizedBox(
                    height: 20,
                  ),
                  Text('About',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold)),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      PhotoItem(
                        imageUrl: 'assets/image_photo1.png',
                      ),
                      PhotoItem(imageUrl: 'assets/image_photo2.png'),
                      PhotoItem(imageUrl: 'assets/image_photo3.png')
                    ],
                  ),
                  SizedBox(height: 20),
                  // NOTE: Interest
                  Text('Interests',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold)),
                  SizedBox(
                    height: 13,
                  ),
                  Row(
                    children: [
                      InterestItem(
                        text: 'Kids Park',
                      ),
                      InterestItem(
                        text: 'Honor Bridge',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      InterestItem(
                        text: 'City Museum',
                      ),
                      InterestItem(
                        text: 'Central Mall',
                      ),
                    ],
                  )
                ],
              ),
            ),
            // NOTE: Price & Button Book
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 30),
              child: Row(
                children: [
                  // NOTE: Price
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(destination.price),
                          style: blackTextStyle.copyWith(
                              fontSize: 18, fontWeight: medium),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'per orang',
                          style: greyTextStyle.copyWith(fontWeight: light),
                        )
                      ],
                    ),
                  ),
                  // NOTE: Button Book Now
                  CustomButton(
                    title: 'Book Now',
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ChooseSeatPage())))
                    },
                    width: 170,
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [backgroundImage(), customShadow(), content()],
        ),
      ),
    );
  }
}
