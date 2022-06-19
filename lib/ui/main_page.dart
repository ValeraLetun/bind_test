import 'package:bind_test/ui/widgets/button_outline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data.dart';

class MainPage extends StatefulWidget {

  const MainPage({Key? key,}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  bool _showHeader = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
        body: ListView(
          padding: const EdgeInsets.only(top: 0),
          children: _children(),
        )
    );
  }

  List<Widget> _children(){
    List<Widget> list = [];

    list.add(Container(
      color: Colors.black,
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(),
        _header(),
        Container(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Expanded(child: Text("Transactions History", style:
                    GoogleFonts.roboto(fontSize: 18, color: Colors.white), maxLines: 1)
                ),
                if (!_showHeader)
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  alignment: Alignment.centerRight,
                  child: buttonOutline("Show", (){
                    _showHeader = true;
                    setState((){});
                  })),
              ],
            )),
        _transactionHistory(),
        _dateSelect(),
        const SizedBox(height: 15,)
      ],
    )));

    list.addAll(_list());
    
    return list;
  }

  Widget _title(){
    return Container(
      color: Colors.black,
      padding: EdgeInsets.only(left: 10, right: 10, top: MediaQuery.of(context).padding.top+10, bottom: 10),
      child: Row(
        children: [
          InkWell(child: Image.asset("assets/arrow.png", color: Colors.white, width: 25,)),
          const Expanded(child: SizedBox(width: 10,)),
          Image.asset("assets/open.png", color: Colors.white, width: 25),
        ],
      )
    );
  }

  _header(){
    if (!_showHeader)
      return Container();
    return Container(
        color: Colors.black,
        child: Column(
          children: [
            const SizedBox(height: 70,),
            const CircleAvatar(
              radius: 40,
              // backgroundColor: ,
              backgroundImage: AssetImage("assets/usa.png"),
            ),
            const SizedBox(height: 10,),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5),
                    alignment: Alignment.center,
                    child: Text("USD Account", style: GoogleFonts.roboto(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w400),)
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  alignment: Alignment.centerRight,
                  child: buttonOutline("Hide", (){
                    _showHeader = false;
                    setState((){});
                  }),
                ),
              ],
            ),
            const SizedBox(height: 15,),
            Center(child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 4),
                    child: Text("\$", style: GoogleFonts.abrilFatface(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w500),)),
                const SizedBox(width: 15,),
                Text("180,970.83", style: GoogleFonts.roboto(fontSize: 27, color: Colors.white, fontWeight: FontWeight.w500),),
            ],)),
            const SizedBox(height: 70,),
          ],
        )
    );
  }

  var _comboValueTH = "USD Dollar";
  final List<String> _currency = [
    "USD Dollar",
    "AED Dirham",
    "Moroccan Dirham",
  ];

  Widget _transactionHistory(){
    List<DropdownMenuItem<String>> menuItems = [];

    for (var item in _currency)
      menuItems.add(DropdownMenuItem(
        value: item,
        child: Container(
            padding: const EdgeInsets.only(right: 5),
            child: Text(item, style:
            GoogleFonts.roboto(fontSize: 18, color: Colors.white), maxLines: 1)),
      ),);

    return Container(
        color: Colors.black,
        child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButtonHideUnderline(child: DropdownButton<String>(
                dropdownColor: Colors.black,
                style: GoogleFonts.roboto(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
                icon: Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: const RotatedBox(quarterTurns: 1,
                    child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey, size: 15,))),
                isExpanded: true,
                value: _comboValueTH,
                items: menuItems,
                onChanged: (value) {
                  if (value == null)
                    return;
                  _comboValueTH = value;
                  setState(() {
                  });
                })
            ))
    ));
  }

  var _comboValueDate = "All";
  final List<String> _date = [
    "All",
    "Yesterday",
    "This week",
  ];

  Widget _dateSelect(){
    List<DropdownMenuItem<String>> menuItems = [];

    for (var item in _date)
      menuItems.add(DropdownMenuItem(
        value: item,
        child: Container(
            padding: const EdgeInsets.only(right: 5),
            child: Text(item, style:
            GoogleFonts.roboto(fontSize: 18, color: Colors.white), maxLines: 1)),
      ),);

    return Row(
      children: [
        Expanded(child: Container(
            margin: const EdgeInsets.only(left: 10, right: 0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButtonHideUnderline(child: DropdownButton<String>(
                    dropdownColor: Colors.black,
                    style: GoogleFonts.roboto(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
                    icon: Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: const RotatedBox(quarterTurns: 1,
                            child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey, size: 15,))),
                    isExpanded: true,
                    value: _comboValueDate,
                    items: menuItems,
                    onChanged: (value) {
                      if (value == null)
                        return;
                      _comboValueDate = value;
                      setState(() {
                      });
                    })
                ))
        )),
        const SizedBox(width: 10,),
        InkWell(
          onTap: (){
            _showDatePicker();
          },
            child: Container(
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(onPressed: (){
            _showDatePicker();
          }, icon: Image.asset("assets/date.png", color: Colors.white, width: 25,)),
        )),
      ],
    );
  }

  List<Widget> _list(){
    List<Widget> list = [];
    for (var item in dataForApp){
      list.add(Container(
        padding: const EdgeInsets.all(10),
        color: Colors.grey.withAlpha(180),
        child: Text(item.date, style: GoogleFonts.roboto(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),)
      ));
      for (var data in item.data){
        list.add(Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
            margin: const EdgeInsets.only(bottom: 2),
            color: Colors.white,
            child: Row(
              children: [
                data.image == "right" ? Image.asset("assets/arrow2.png", width: 32, color: Colors.black.withAlpha(200),)
                    : data.image == "left"
                    ? RotatedBox(quarterTurns: 2, child: Image.asset("assets/arrow2.png", width: 32, color: Colors.black.withAlpha(200),))
                    : Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    shape: BoxShape.circle,
                  ),
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage(data.image,),
                )),
                const SizedBox(width: 10,),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(data.name, style: GoogleFonts.roboto(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),),),
                        Text(data.price, style: GoogleFonts.roboto(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),),
                      ],
                    ),
                    const SizedBox(height: 6,),
                    Text(data.time, style: GoogleFonts.questrial(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w400),),
                  ],
                ))

              ],
            )
        ));
      }
    }
    list.add(const SizedBox(height: 60,));
    return list;
  }

  void _showDatePicker() {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
          height: 400,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: CupertinoDatePicker(
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (val) {
                      setState(() {
                        //_chosenDateTime = val;
                      });
                    }),
              ),

              // Close the modal
              CupertinoButton(
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          ),
        ));
  }
}
