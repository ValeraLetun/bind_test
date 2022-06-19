import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

buttonOutline(String text, Function callback){
  return Stack(
    children: <Widget>[
      Container(
          padding: const EdgeInsets.only(top: 6, bottom: 6, left: 10, right: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(text,
            style: GoogleFonts.roboto(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,)
      ),
      Positioned.fill(
          child: Material(
              color: Colors.transparent,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10) ),
              child: InkWell(
                splashColor: Colors.black.withOpacity(0.2),
                onTap: (){
                  callback();
                }, // needed
              )),
        )
    ],
  );
}
