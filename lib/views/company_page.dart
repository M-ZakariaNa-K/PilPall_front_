import 'package:flutter/material.dart';
import 'package:pharmacist_app/Models/get_companies_model.dart';
import 'package:pharmacist_app/card/company_card.dart';
import 'package:pharmacist_app/helper/varibles.dart';
import 'package:pharmacist_app/services/get_all_companies.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompanyPage extends StatefulWidget {
  CompanyPage({super.key});

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0XFF88BFDD),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
        ),
        title: const Text(
          "Companies",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: FutureBuilder<List<CompaniesModel>>(
          future: AllCompaniesService().getAllCompanies(
            token: tokenVar,
            str: strVar,
            // saveStr(),
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<CompaniesModel> Company = snapshot.data!;
              return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: Company.length,
                  itemBuilder: (context, index) {
                    return CompanyCard(
                      companies: Company[index],
                    );
                  });
            } else {
              return SizedBox(
                height: MediaQuery.of(context).size.height / 1.2,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xff88BFDD),
                  ),
                ),
              );
            }
          }),
    );
  }
}
