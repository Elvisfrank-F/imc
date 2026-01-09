class ImcHistoryModel {

 final int? id;
 final double massa;
 final double altura;
 final double imc;
 final DateTime data;
 final String image;

 ImcHistoryModel({this.id, required this.massa, required this.altura, required this.imc, required this.data, required this.image});

Map<String, dynamic> toMap() => {

 'id' : id,
 'massa' : massa,
 'altura' : altura,
 'imc' : imc,
 'data' : data.toIso8601String(),
 'image' : image

};

factory ImcHistoryModel.fromMap(Map<String, dynamic> map) {

  return ImcHistoryModel(
      id: map['id'],
      massa: map['massa'],
   altura: map['altura'], imc: map['imc'], 
   data: DateTime.parse(map['data']),
   image: map['image']
   );

}

}