
import 'package:flutter/material.dart';
import 'package:tabs_app/models/item.dart';

class ListItem with ChangeNotifier {

  List<String> listTabs = ['#Tranding', '#Food', '#Activity', '#Shopping'];
  List<Map<int, List<Item>>> listItemCtegory = [ 
                                        { 
                                          0: [
                                              Item(title: 'Ingrid Be',      subTitle: 'Selfie Dare Accepted',               urlImag: 'https://images.unsplash.com/photo-1557777586-f6682739fcf3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3024&q=80',    dateCreation: DateTime(2022, 3, 27, 17, 37 )),
                                              Item(title: 'Hanah Jo',       subTitle: 'Photobooth at done with #sis',       urlImag: 'https://images.unsplash.com/photo-1574201635302-388dd92a4c3f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3165&q=80', dateCreation: DateTime(2022, 3, 27, 17, 25 )),
                                              Item(title: 'Jason Crus',     subTitle: '360 Degree tornado kick #challenge', urlImag: 'https://images.unsplash.com/photo-1559582798-678dfc71ccd8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80',     dateCreation: DateTime(2022, 3, 22, 10, 37 )),
                                              Item(title: 'Ingrid Jones',   subTitle: 'Selfie tornado kick #challenge',     urlImag: 'https://images.unsplash.com/photo-1589782051446-a24efcec7ffc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3135&q=80', dateCreation: DateTime(2022, 3, 22, 10, 37 )),
                                          ],
                                          1:[
                                              Item(title: 'Meryl St',       subTitle: 'Pose in the lockdown without studio', urlImag: 'https://images.unsplash.com/photo-1592329347810-258afdd206bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1931&q=80', dateCreation: DateTime(2022, 3, 27, 10, 37 )),
                                              Item(title: 'Missa Amane',    subTitle: 'Flying kiss to my friend #dare',      urlImag: 'https://images.unsplash.com/photo-1557002665-c552e1832483?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',     dateCreation: DateTime(2022, 3, 27, 13, 37 )),
                                              Item(title: 'Migane Trainor', subTitle: 'All about that bass #dare',           urlImag: 'https://images.unsplash.com/photo-1546961342-ea5f71b193f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3087&q=80',    dateCreation: DateTime(2022, 3, 22, 10, 37 )),
                                              Item(title: 'Ingrid Jones',   subTitle: 'Selfie tornado kick #challenge',      urlImag: 'https://images.unsplash.com/photo-1600657644140-aa5b5e003829?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80', dateCreation: DateTime(2022, 3, 22, 10, 37 )),
                                            ],
                                        },
                                        {
                                          0: [],
                                          1: []
                                        },
                                        {
                                          0: [],
                                          1: []
                                        },
                                        {
                                          0: [],
                                          1: []
                                        }
                                    ]; 
  addItemInListCategory(Item item, int index){
    listItemCtegory[index][0]!.length <= listItemCtegory[index][1]!.length?
    listItemCtegory[index][0]!.add(item): listItemCtegory[index][1]!.add(item);
    notifyListeners();
  }
}