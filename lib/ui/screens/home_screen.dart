
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabs_app/models/item.dart';
import 'package:tabs_app/models/list_item.dart';
import 'package:tabs_app/ui/ressources.dart';
import 'package:tabs_app/ui/widgets/item_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
   late TabController tabController;
   late TextEditingController titlItemCont;
   late TextEditingController subtitlItemCont;
   late TextEditingController imgItemCont;
   late List<String> listTabs;
   late List<Map<int, List<Item>>> listItemCtagory;
   int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    
    listTabs = context.read<ListItem>().listTabs;

    listItemCtagory = context.watch<ListItem>().listItemCtegory;
    tabController = TabController(length: listTabs.length, vsync: this);
    tabController.addListener(() => currentIndex = tabController.index);
    
   
    titlItemCont    = TextEditingController();
    subtitlItemCont = TextEditingController();
    imgItemCont     = TextEditingController();
  }

  @override
  dispose(){
    super.dispose();
    tabController.dispose();
    titlItemCont.dispose();
    subtitlItemCont.dispose();
    imgItemCont.dispose();
  }

  showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Add Item into The Current Category"),
        content: SizedBox(
          height: MediaQuery.of(context).size.height*.35,
          child: ListView(
              shrinkWrap: true,
              children: [
                TextField(textInputAction: TextInputAction.next, decoration: const InputDecoration(label: Icon(Icons.title)), controller: titlItemCont,),
                TextField(textInputAction: TextInputAction.next, decoration: const InputDecoration(label: Icon(Icons.subtitles)), controller: subtitlItemCont,),
                TextField(textInputAction: TextInputAction.done, decoration: const InputDecoration(label: Icon(Icons.image)), controller: imgItemCont,),
            ],),
        ),
        actions: [
          TextButton(
            child: Text(btnAddItemOk),
            onPressed: () {
              context.read<ListItem>().addItemInListCategory(Item(title: titlItemCont.text, subTitle: subtitlItemCont.text, 
                                                                   urlImag: imgItemCont.text, dateCreation: DateTime.now()), currentIndex);
              titlItemCont.clear();
              subtitlItemCont.clear(); 
              imgItemCont.clear();  
              Navigator.of(context).pop();
            } ,
          ),
          TextButton(
            child: Text(btnAddItemCancel),
            onPressed: (){ 
              titlItemCont.clear();
              subtitlItemCont.clear(); 
              imgItemCont.clear();  
              Navigator.of(context).pop();
            }
          ),
        ],
      );
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    //listTabs = context.watch<ListItem>().listTabs;
    //listItemCtagory = context.watch<ListItem>().listItemCtegory;
    double widthS  = MediaQuery.of(context).size.width-10;
    double heightS = MediaQuery.of(context).size.height-30;
    double width2  = widthS / 2 - 20;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          backgroundColor: colorBG,
          title: Row(
            children: [
              Image.asset(imgTitle, scale: 2,),
              const SizedBox(width: 15,),
              Text(strTitle, style: titleStyle,),
            ],
          ),
          actions: [
            IconButton(onPressed: ()async{ await showAlertDialog(context);}, icon: Icon(Icons.add, color: colorIcon)),
            IconButton(onPressed: (){}, icon: Image.asset(imgMail, scale: 1.5,)),
            const SizedBox(width: 20,)
          ],
          bottom: TabBar(
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.label,
            labelPadding: const EdgeInsets.symmetric(horizontal: 15),
            isScrollable: true,
            labelColor: colorBG,
            unselectedLabelColor: Colors.black,
            indicator: BoxDecoration(
              color: colorTab,
              borderRadius: BorderRadius.circular(25.0,)
            ),
            tabs: listTabs.map<Container>((e) => Container(
                height: 35,
                width: 100,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Tab(text : e,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(color: colorTab, width: 2),
                ),
            ),).toList(),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: colorNavigBar,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: (){}, icon: Image.asset(imgHome,    scale: 2,)),
              IconButton(onPressed: (){}, icon: Image.asset(imgSearch,  scale: 2,)),
              IconButton(onPressed: (){}, icon: Image.asset(imgdCercle, scale: 2,)),
              IconButton(onPressed: (){}, icon: Image.asset(imgCheck,   scale: 2,)),
              IconButton(onPressed: (){}, icon: Image.asset(imgProfil,  scale: 2,)),
          ],),
        ),
        body: TabBarView(
          controller: tabController,
          children: listItemCtagory.map((listCategories) => Container(
              height: heightS,
              width: widthS,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(children: [
                            Expanded(
                              child: ListView.builder(
                                        itemCount: listCategories[0]!.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return ItemCard(width2: width2, item: listCategories[0]![index]);
                                          })
                            ),
                            Expanded(
                              child: ListView.builder(
                                        itemCount: listCategories[1]!.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return ItemCard(width2: width2, item: listCategories[1]![index]);
                                          })
                            )
                    ]
              ,))).toList()
            )
          )
        );
  }
}