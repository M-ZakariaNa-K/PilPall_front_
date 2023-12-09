import 'package:flutter/material.dart';
import 'package:pharmacist_app/Models/get_medicine_details_model.dart';
import 'package:pharmacist_app/card/medicine_card.dart';

int clickNumber = 1;
int clickNumberFa = 1;

class MedicineDetailsCard extends StatefulWidget {
  MedicineDetailsCard({required this.medicine});
  @override
  final MedicineDetailsModel medicine;

  @override
  State<MedicineDetailsCard> createState() => _MedicineDetailsCardState();
}

class _MedicineDetailsCardState extends State<MedicineDetailsCard> {
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const CircleAvatar(
          radius: 120,
          backgroundColor: Color(0XFF88BFDD),
          child: CircleAvatar(
            radius: 115,
            backgroundImage: NetworkImage(
                //medicine.image
                'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      clickNumber++;
                      if (clickNumber % 2 == 0) {
                        activeBa = true;
                      } else {
                        activeBa = false;
                      }
                    });
                  },
                  icon: Icon(
                    activeBa == true
                        ? Icons.shopping_basket
                        : Icons.shopping_basket_outlined,
                    color: const Color(0XFF88BFDD),
                    size: 55,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      print('im meeee: ' + '$clickNumberFa');
                      clickNumberFa++;
                      if (clickNumberFa % 2 == 0) {
                        activeFa = true;
                      } else {
                        activeFa = false;
                      }
                    });
                  },
                  icon: Icon(
                    activeFa == true
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: const Color(0XFF88BFDD),
                    size: 55,
                  )),
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "Scientific Name: ",
                style: TextStyle(
                    color: Color(0XFF88BFDD),
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              widget.medicine.scientificName,
              style: TextStyle(
                color: Color(0XFF013A71),
                fontSize: 22,
              ),
            ),
          ],
        ),
        Divider(
          color: Color(0XFF88BFDD),
          thickness: 2,
          endIndent: 30,
          indent: 30,
          height: 50,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "Commercial Name: ",
                style: TextStyle(
                    color: Color(0XFF88BFDD),
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              widget.medicine.commercialName,
              style: const TextStyle(
                color: Color(0XFF013A71),
                fontSize: 22,
              ),
            ),
          ],
        ),
        const Divider(
          color: Color(0XFF88BFDD),
          thickness: 2,
          endIndent: 30,
          indent: 30,
          height: 50,
        ),
        Row(
          children: [
            const Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "Category: ",
                style: TextStyle(
                    color: Color(0XFF88BFDD),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              '${widget.medicine..category}',
              style: const TextStyle(
                color: Color(0XFF013A71),
                fontSize: 16,
              ),
            ),
          ],
        ),
        const Divider(
          color: Color(0XFF88BFDD),
          thickness: 2,
          endIndent: 30,
          indent: 30,
          height: 50,
        ),
        Row(
          children: [
            const Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "Manufacture Company: ",
                style: TextStyle(
                    color: Color(0XFF88BFDD),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              '${widget.medicine.company}',
              style: const TextStyle(
                color: Color(0XFF013A71),
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const Divider(
          color: Color(0XFF88BFDD),
          thickness: 2,
          endIndent: 30,
          indent: 30,
          height: 50,
        ),
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                "Quantity Available: ",
                style: TextStyle(
                    color: Color(0XFF88BFDD),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              '${widget.medicine.quantity}',
              style: const TextStyle(
                color: Color(0XFF013A71),
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        const Divider(
          color: Color(0XFF88BFDD),
          thickness: 2,
          endIndent: 30,
          indent: 30,
          height: 50,
        ),
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                "Expiration Date: ",
                style: TextStyle(
                    color: Color(0XFF88BFDD),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              widget.medicine.expirationDate,
              style: const TextStyle(
                  color: Color(0XFF013A71),
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
        const Divider(
          color: Color(0XFF88BFDD),
          thickness: 2,
          endIndent: 30,
          indent: 30,
          height: 50,
        ),
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                "Price: ",
                style: TextStyle(
                    color: Color(0XFF88BFDD),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              '${widget.medicine.price}',
              style: const TextStyle(
                color: Color(0XFF013A71),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
