class StudentValidationMixin{
  String? validateFirstName(String? value) {
    if(value!=null){
      if(value.length<2){
        return "İsim en az 2 karakter olmalıdır";
      }
    }
    return null;
  }

  String? validateLastName(String? value) {
    if(value!=null){
      if(value.length<2){
        return "Soyisim en az 2 karakter olmalıdır";
      }
    }
    return null;
  }
  String? validateGrade(String value){
    var grade = int.parse(value);
    if(grade<0 || grade>100){
      return "Not 0 ile 100 arasında olmalıdır";
    }
  }

  String? validatePhotoUrl(String value){
    if(value==null){
      return "Fotoğraf linki giriniz";
    }
  }


}