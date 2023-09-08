import 'dart:math';
import 'package:app_blog/Model/models/TipoAcessoDataBase.dart';
import 'package:app_blog/Model/servicos/acessardados_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import '../../Model/models/Artigo.dart';
import 'package:exists_in/exists_in.dart';
part 'inicio_viewmodel.g.dart';

class InicioViewModel = InicioViewModelMobx with _$InicioViewModel;

abstract class InicioViewModelMobx with Store{

  final AcessarDadosRepository _repositoryAcessar = AcessarDadosRepository();
  final TipoAcessoDataBase _tipoAcesso = TipoAcessoDataBase();

  @observable
  List<Artigo> _populares = [];

  @observable
  List<Artigo> _emAlta = [];

  @observable
  List<Map<String, List<Artigo>>> _topicosArtigos = [];

  @computed
  List<Artigo> get artigosPopulares => _populares;

  @computed
  List<Artigo> get artigosEmAlta => _emAlta;

  @computed
  List<Map<String, List<Artigo>>> get topicosArtigos => _topicosArtigos;

  @action
  recuperarArtigosPopulares(BuildContext context)async{
    List<Artigo> artigos = [];
    _tipoAcesso.tipo = TipoAcesso.acessarArtigos;
    artigos = await _repositoryAcessar.acessarDados(_tipoAcesso, context);
    _populares.clear();
    if(artigos.length<=2){
      _populares = artigos;
    } else {
      List<Artigo> _artigos = [];
      while(_artigos.length < artigos.length~/2){
        var artigo = artigos[Random().nextInt(artigos.length)];
        if(!existsIn(artigo, _artigos)){
          _artigos.add(artigo);
        }
      }
      _populares = _artigos;
      // fatiamento em listas no dart 
      //_populares = [...artigos].getRange(0,artigos.length~/2).toList();
    }
  }

  @action
  recuperarArtigosEmAlta(BuildContext context)async{
    List<Artigo> artigos = [];
    _tipoAcesso.tipo = TipoAcesso.acessarArtigos;
    artigos = await _repositoryAcessar.acessarDados(_tipoAcesso, context);
    _emAlta.clear();
    if(artigos.length<=2){
      _emAlta = artigos;
    } else {
      List<Artigo> _artigos = [];
      while(_artigos.length < artigos.length~/2){
        var artigo = artigos[Random().nextInt(artigos.length)];
        if(!existsIn(artigo, _artigos)){
          _artigos.add(artigo);
        }
      }
      _emAlta = _artigos;
    }
  }

}
