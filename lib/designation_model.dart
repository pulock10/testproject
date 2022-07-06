class DesignationModel{
  int id;
  String rankName;

  DesignationModel({required this.id,required this.rankName});

  factory DesignationModel.convertFromJSON(data){
    return DesignationModel(
      id: data["Id"],
      rankName: data["DesignationRank"]
    );
  }

}
