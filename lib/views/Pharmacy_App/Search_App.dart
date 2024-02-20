import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/Models/App_Model/SearchModel.dart';
import 'package:pharmacist_app/Models/App_Model/SearchModelEdit.dart';
import 'package:pharmacist_app/helper/varibles.dart';
import 'package:pharmacist_app/services/homePage/Search_Home.dart';
import 'package:pharmacist_app/views/medicine_details_page.dart';

class SearchMedicine extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    // Call your API to get search results
    return FutureBuilder<SearchEdited>(
      future: SearchAppService().getsearchapp(query),
      builder: (context, snapshot) {
        print(snapshot);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData) {
          return const Center(child: Text('Not Found'));
        } else {
          return Column(
            children: [
              langVar == "en"
                  ? Text(
                      'Medicines',
                      style: TextStyle(
                        color: Color(0xff003A71),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text('الأدوية',
                      style: TextStyle(
                        color: Color(0xff003A71),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
              Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.medicines.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Get.to(MedicineDetailsPage());
                      },
                      title: Text(
                        snapshot.data!.medicines[index].commercialName,
                        style: TextStyle(
                          color: Color(0xff003A71),
                        ),
                      ),
                      leading: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Container(
                          width: 40,
                          height: 40,
                          child: Image.asset(
                            'assets/images/syringe.png',
                            fit: BoxFit.cover,
                          ),
                          // Image.network(
                          //   snapshot.data![index].image,
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                      ),
                      //
                    );
                  },
                ),
              ),
              Divider(
                height: 2,
                indent: 60,
                endIndent: 60,
                thickness: 2,
                color: Color(0xff003A71),
              ),
              langVar == "en"
                  ? Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text('Categories',
                          style: TextStyle(
                            color: Color(0xff003A71),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                    )
                  : Text('التصنفات',
                      style: TextStyle(
                        color: Color(0xff003A71),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
              Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.categories.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {},
                      title: Text(
                        snapshot.data!.categories[index].name,
                        style: TextStyle(
                          color: Color(0xff003A71),
                        ),
                      ),
                      leading: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Container(
                          width: 50,
                          height: 50,
                          child: Image.asset(
                            'assets/images/syringe.png',
                            fit: BoxFit.cover,
                          ),
                          // Image.network(
                          //   snapshot.data![index].image,
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                      ),
                      //
                    );
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('');
  }
}
