class ImcHistoryModel {

 final int? id;
 final double massa;
 final double altura;
 final double imc;
 final DateTime data;

 ImcHistoryModel({this.id, required this.massa, required this.altura, required this.imc, required this.data});

Map<String, dynamic> toMap() => {

 'id' : id,
 'massa' : massa,
 'altura' : altura,
 'imc' : imc,
 'data' : data.toIso8601String(),

};

factory ImcHistoryModel.fromMap(Map<String, dynamic> map) {

  return ImcHistoryModel(massa: map['massa'],
   altura: map['altura'], imc: map['imc'], 
   data: DateTime.parse(map['data']));

}

}