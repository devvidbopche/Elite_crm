import 'package:elite_crm/Utils/color_constants.dart';
import 'package:flutter/material.dart';

class AddReport extends StatefulWidget {
  const AddReport({Key? key}) : super(key: key);

  @override
  _AddReportState createState() => _AddReportState();
}

class _AddReportState extends State<AddReport> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.deppp,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Select an option:', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,)),


                DropdownButtonFormField(
                  value: _selectedOption,
                  // icon: const Icon(Icons.location_on),
                  decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      ),
                      labelStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                      filled: true,
                      fillColor: Colors.white,
                      hintText:  'Select Lead',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 'existing_lead',
                      child: Text('Existing Lead'),
                    ),
                    DropdownMenuItem(
                      value: 'other_option',
                      child: Text('Other Option'),
                    ),
                  ],
                  onChanged: (newValue) {
                    setState(() {
                      _selectedOption = newValue;
                    });
                  },

                ),
              ],
            ),


            SizedBox(height: 10,),
            if (_selectedOption == 'existing_lead')
              TextFormField(


                decoration: InputDecoration(
                    labelText: 'Enter the lead',
                    filled: true,
                    fillColor: Colors.white,
                    //suffixIcon: const Icon(Icons.search),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),

              ),
          ],
        ),
      ),
    );
  }
}
