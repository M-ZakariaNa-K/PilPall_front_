//DONE>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
import 'package:flutter/material.dart';
import 'package:pharmacist_app/Models/OldOrderDetailsModel.dart';
import 'package:pharmacist_app/services/GetShowOrderDetails1.dart';
import 'package:pharmacist_app/widgets/basket_item_lists.dart';

int numOfItems = 0;

class OldOrderDetails extends StatelessWidget {
  const OldOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GetShowOrderDetails().getShowOrderDetails(
          url: 'http://10.0.2.2:8000/api/orders/detail?order_id=1h',
            token:'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI3IiwianRpIjoiOTNiYTkzMTcwMjY5MGUxOWZiY2JlYTY1MTFiNzI5ODZmZmEwM2RmZDE5ZmZmZDk4NTc1NWM1NDc4ZjFmYWZlMWVkN2IyZmJmZDBmYThjOGQiLCJpYXQiOjE3MDE4NTgyMzcuODIzNDA1LCJuYmYiOjE3MDE4NTgyMzcuODIzNDA5LCJleHAiOjE3MzM0ODA2MzcuNjk4ODksInN1YiI6IjEwIiwic2NvcGVzIjpbXX0.Ojtc79h_mJMwNRIzdKv439yLfVT7h0xnxnrqbi3u1rab5S7SOU5SYmZgA6Kl4wdj19xMGpxr4Kn92KfMoAYxdusLgJ5_FXMwdfAfQULa4AeIpzD58YRh2JsvmBFykZKz3VswqGhbrBWUjxF02X7urYt00CIPA7gFoTMD-1wPBwrsktEhmBcez_6nTRoYcGSn4oqFLHNt8HsK4f_e5rz3RKmqsgX_2mSJQ8undStEyJ2QGN_FVh3cYYgPX7LrNpbWip00cZLz4Tsif2qfS0GCNYhWwKy3Xo8ABoYalTZ4pnMqrkfZVJORkpV1Xb3vSFrlwri_0gZFb-FOWYhTNf0KdZjsDe4j1Q0TE5IHiX5m-HjcX1bSWCpR0LqeZLFYk9ahWPHbjSa7oXV7nV6byp87cyh9wtr0e1MN2NK1TsEXewjftC4brJpcIA6Uvo1SZsUAGWwKHEMY4dZKns962GzMUpCeWX39CV4xhlXTPc6wKlw-LXSg3h92PPa5RS5gBMfDfaFQzvdjVTynnwyWh2q1CeXLOMZMd5W0a6hSNXNp1HNEDWzc6gRhxAMNVal-jXqbHF62d6CZvNPzTlkfyh1N26PE-Ufod_B13MRJxZszamBQjT-MVALAV7pYSGU-0Q5Lr2hUEcRIQCZSJkHauvtV3zeC_yawA3j1PEqHuYxFnnA',),
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.hasData) {
            dynamic temp = snapshot.data;

//data == oldOrderDetailsList
            List<Medicine> data = temp;
            numOfItems = data.length;
            return DefaultTabController(
              length: data.length,
              child: TabBarView(
                children: List.generate(
                  data.length,
                  (index) => ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, ind) => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Container(
                                width: 80,
                                height: 80,
                                child: Image.network(
                                  //data[index].image
                                  'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            subtitle: Text(
                              data[index].quantityPrice.toString() + ' SYR',
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Open Sans',
                                  color: Color(0xff003A71),
                                  fontWeight: FontWeight.w300),
                            ),
                            title: Text(
                              data[index].commercialName,
                              style: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'Open Sans',
                                color: Color(0xff003A71),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: const Color(0xff013a71).withOpacity(.2),
                          endIndent: 50,
                          indent: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
