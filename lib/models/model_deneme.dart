// To parse this JSON data, do
//
//     final kastamonuJson = kastamonuJsonFromJson(jsonString);

import 'dart:convert';

KastamonuJson kastamonuJsonFromJson(String str) {
  final jsonData = json.decode(str);
  return KastamonuJson.fromJson(jsonData);
}

String kastamonuJsonToJson(KastamonuJson data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class KastamonuJson {
  List<Bilgiler> bilgiler;

  KastamonuJson({
    this.bilgiler,
  });

  factory KastamonuJson.fromJson(Map<String, dynamic> json) =>
      new KastamonuJson(
        bilgiler: json["bilgiler"] == null
            ? null
            : new List<Bilgiler>.from(
                json["bilgiler"].map((x) => Bilgiler.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bilgiler": bilgiler == null
            ? null
            : new List<dynamic>.from(bilgiler.map((x) => x.toJson())),
      };
}

class Bilgiler {
  int id;
  String il;
  String ilce;
  String nufus;
  String resim;
  String baskan;
  String telefon;
  String adres;
  List<Mahalle> mahalle;
  List<Koyler> koyler;

  Bilgiler({
    this.id,
    this.il,
    this.ilce,
    this.nufus,
    this.resim,
    this.baskan,
    this.telefon,
    this.adres,
    this.mahalle,
    this.koyler,
  });

  factory Bilgiler.fromJson(Map<String, dynamic> json) => new Bilgiler(
        id: json["id"] == null ? null : json["id"],
        il: json["il"] == null ? null : json["il"],
        ilce: json["ilce"] == null ? null : json["ilce"],
        nufus: json["nufus"] == null ? null : json["nufus"],
        resim: json["resim"] == null ? null : json["resim"],
        baskan: json["baskan"] == null ? null : json["baskan"],
        telefon: json["telefon"] == null ? null : json["telefon"],
        adres: json["adres"] == null ? null : json["adres"],
        mahalle: json['mahalle'] == null
            ? null
            : new List<Mahalle>.from(
                json["mahalle"].map((x) => Mahalle.fromJson(x))),
        koyler: json['koyler'] == null
            ? null
            : new List<Koyler>.from(
                json["koyler"].map((x) => Koyler.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "il": il == null ? null : il,
        "ilce": ilce == null ? null : ilce,
        "nufus": nufus == null ? null : nufus,
        "resim": resim == null ? null : resim,
        "baskan": baskan == null ? null : baskan,
        "telefon": telefon == null ? null : telefon,
        "adres": adres == null ? null : adres,
        "mahalle": mahalle == null
            ? null
            : new List<dynamic>.from(mahalle.map((x) => x.toJson())),
        "koyler": koyler == null
            ? null
            : new List<dynamic>.from(koyler.map((x) => x.toJson())),
      };
}

class Koyler {
  String koyAdi;
  String koyTemsilcisi;
  String koyTemsilcisiTel;

  Koyler({
    this.koyAdi,
    this.koyTemsilcisi,
    this.koyTemsilcisiTel,
  });

  factory Koyler.fromJson(Map<String, dynamic> json) => Koyler(
        koyAdi: json["koy_adi"] == null ? null : json["koy_adi"],
        koyTemsilcisi:
            json["koy_temsilcisi"] == null ? null : json["koy_temsilcisi"],
        koyTemsilcisiTel: json["koy_temsilcisi_telefon"] == null
            ? null
            : json["koy_temsilcisi_telefon"],
      );

  Map<String, dynamic> toJson() => {
        "koy_adi": koyAdi == null ? null : koyAdi,
        "koy_temsilcisi": koyTemsilcisi == null ? null : koyTemsilcisi,
        "koy_temsilcisi_telefon":
            koyTemsilcisiTel == null ? null : koyTemsilcisiTel,
      };
}

class Mahalle {
  String mahalleAdi;
  String mahalleTemsilcisi;

  Mahalle({
    this.mahalleAdi,
    this.mahalleTemsilcisi,
  });

  factory Mahalle.fromJson(Map<String, dynamic> json) => Mahalle(
        mahalleAdi: json["mahalle_adi"] == null ? null : json["mahalle_adi"],
        mahalleTemsilcisi: json["mahalle_temsilcisi"] == null
            ? null
            : json["mahalle_temsilcisi"],
      );

  Map<String, dynamic> toJson() => {
        "mahalle_adi": mahalleAdi == null ? null : mahalleAdi,
        "mahalle_temsilcisi":
            mahalleTemsilcisi == null ? null : mahalleTemsilcisi,
      };
}
