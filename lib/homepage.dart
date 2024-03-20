import 'package:flutter/material.dart';

class BarCodeScanner extends StatelessWidget {
  const BarCodeScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: Colors.redAccent,
          ),
        ),
        bottomSheet: DraggableScrollableSheet(
          //kama vr laksh de adi bg m te bg jaly ka hav tas
          //idot avaj yetoy mota
          //sharad  ?? hoo
          initialChildSize: 0.1,
          minChildSize: 0.1,
          maxChildSize: 0.4,
          expand: false,
          builder: (_,controller){
            return Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
              ),


               child:ListView(
                 controller: controller,
                 children:[ Row(
                   children: [
                     Icon(Icons.add,size: 70,),
                     Icon(Icons.add,size: 70,),
                     Icon(Icons.add,size: 70,),
                     Icon(Icons.add,size: 70,),
                     Icon(Icons.add,size: 70,),


                   ],
                 ),
                   Row(
                     children: [
                       Icon(Icons.add,size: 70,),
                       Icon(Icons.add,size: 70,),
                       Icon(Icons.add,size: 70,),
                       Icon(Icons.add,size: 70,),
                       Icon(Icons.add,size: 70,),


                     ],
                   ),]
               ) //ListView.builder(
              //   padding: EdgeInsets.all(20),
              //      controller: controller,
              //     itemBuilder: (context, index){
              //       return Column(
              //         children: [
              //           Text('Oosfjasdfjalsdfjlasdfjalsdjf aldjf asldf sal;djflasdjf lasdkjflsadjfk ;alsdfkj lsadjf laskjdf al;ksdjfalsdjfk alsdjfasldfjkasldfj saldkflas;jdkflsakjdf lskjdf sa;kjdf sdlj '),
              //           Text('Oosfjasdfjalsdfjlasdfjalsdjf aldjf asldf sal;djflasdjf lasdkjflsadjfk ;alsdfkj lsadjf laskjdf al;ksdjfalsdjfk alsdjfasldfjkasldfj saldkflas;jdkflsakjdf lskjdf sa;kjdf sdlj '),
              //           Text('Oosfjasdfjalsdfjlasdfjalsdjf aldjf asldf sal;djflasdjf lasdkjflsadjfk ;alsdfkj lsadjf laskjdf al;ksdjfalsdjfk alsdjfasldfjkasldfj saldkflas;jdkflsakjdf lskjdf sa;kjdf sdlj '),
              //           Text('Oosfjasdfjalsdfjlasdfjalsdjf aldjf asldf sal;djflasdjf lasdkjflsadjfk ;alsdfkj lsadjf laskjdf al;ksdjfalsdjfk alsdjfasldfjkasldfj saldkflas;jdkflsakjdf lskjdf sa;kjdf sdlj '),
              //           Text('Oosfjasdfjalsdfjlasdfjalsdjf aldjf asldf sal;djflasdjf lasdkjflsadjfk ;alsdfkj lsadjf laskjdf al;ksdjfalsdjfk alsdjfasldfjkasldfj saldkflas;jdkflsakjdf lskjdf sa;kjdf sdlj '),
              //           Text('Oosfjasdfjalsdfjlasdfjalsdjf aldjf asldf sal;djflasdjf lasdkjflsadjfk ;alsdfkj lsadjf laskjdf al;ksdjfalsdjfk alsdjfasldfjkasldfj saldkflas;jdkflsakjdf lskjdf sa;kjdf sdlj '),
              //           Text('Oosfjasdfjalsdfjlasdfjalsdjf aldjf asldf sal;djflasdjf lasdkjflsadjfk ;alsdfkj lsadjf laskjdf al;ksdjfalsdjfk alsdjfasldfjkasldfj saldkflas;jdkflsakjdf lskjdf sa;kjdf sdlj '),
              //         ],
              //       );
              //     }),
            );
          },
        ),
        // body: Column(
        //   children: [
        //     Expanded(
        //       child: Center(
        //         child: ElevatedButton(
        //           style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        //           onPressed: () {
        //
        //           },
        //           child: const Text(
        //             'Scan',
        //             style: TextStyle(fontSize: 20, color: Colors.white),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
