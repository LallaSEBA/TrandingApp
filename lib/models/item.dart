class Item{
  late String title;
  late String subTitle;
  late String urlImag;
  late DateTime dateCreation;
  Item({required this.title, required this.subTitle, required this.urlImag, required this.dateCreation});
  
  Item.fromJson(Map<String, dynamic> map){
    title        = map['titme'];
    subTitle     = map['subTitme'];
    urlImag      = map['urlImage'];
    dateCreation = map['dateCreation'];
  }

  String getDuration(){
    Duration diff = DateTime.now().difference(dateCreation);
    String result = "";
    if(diff.inDays > 7)
    {
      result = dateCreation.toString();
    }
    else if(diff.inDays > 0 && diff.inDays < 7)
    {
      result = '${diff.inDays} Days Ago';
    }
    else if(diff.inHours > 0)
    {
      result = '${diff.inHours} ${diff.inMinutes == 1? 'Hour Ago':'Hours Ago'}';
    }
    else if(diff.inMinutes > 0)
    {
      result = '${diff.inMinutes} Min Ago';
    }

    return result;
  }
}