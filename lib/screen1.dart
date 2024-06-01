import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Screen1 extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _urlController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _upiController = TextEditingController();
  String _liveStatus = 'Yes';
  String _monthlySalesVolume = '0-5 lacs';
  String _businessType = 'Private Limited';

  final Map<String, String> _monthlySalesMap = {
    '0-5 lacs': '1',
    '5-10 lacs': '2',
    '10-2.5 cr': '3',
    '>2.5 cr': '4'
  };

  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      final apiUrl = Uri.parse(
        'https://www.sendinr.com/registertest/api/WINZ/register?app_website_url=${_urlController.text}&app_web_status=$_liveStatus&firstname=${_nameController.text.split(" ").first}&lastname=${_nameController.text.split(" ").last}&emailid=${_emailController.text}&mobileno=${_mobileController.text}&upiid=${_upiController.text}&month_sale_staus=${_monthlySalesMap[_monthlySalesVolume]}&business_type=$_businessType',
      );

      final response = await http.get(apiUrl);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
          SnackBar(content: Text('Form submitted successfully')),
        );
      } else {
        ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
          SnackBar(content: Text('Failed to submit form')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Accept Payments directly to your Bank Account',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double formWidth = constraints.maxWidth > 600 ? 600 : constraints.maxWidth;

          return Center(
            child: SingleChildScrollView(
              child: Container(
                width: formWidth,
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Register your payments with SendINR',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Enter the app/website URL of your business',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _urlController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).primaryColor),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a URL';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Is your app/website live?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        value: _liveStatus,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).primaryColor),
                          ),
                        ),
                        items: <String>['Yes', 'Will be live soon']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            _liveStatus = newValue;
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select an option';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Personal Details:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Name:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).primaryColor),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Email ID:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).primaryColor),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email ID';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Mobile Number:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _mobileController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).primaryColor),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your mobile number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            // Process data
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                        child: Text('Send OTP'),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Enter your UPI ID:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _upiController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).primaryColor),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your UPI ID';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            // Process UPI verification
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Verifying UPI ID')),
                            );
                          }
                        },
                        child: Text('Verify'),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Monthly Sales Volume of your business:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        value: _monthlySalesVolume,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).primaryColor),
                          ),
                        ),
                        items: _monthlySalesMap.keys.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            _monthlySalesVolume = newValue;
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select an option';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Business Type:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        value: _businessType,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).primaryColor),
                          ),
                        ),
                        items: <String>[
                          'Private Limited',
                          'Public Limited',
                          'Proprietorship',
                          'Partnership/LLP',
                          'Trust/Society',
                          'HUF',
                          'Unregistered'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            _businessType = newValue;
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select an option';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _submitForm,
                        child: Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
