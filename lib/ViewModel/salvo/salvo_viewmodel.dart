import 'package:app_blog/Model/models/TipoAcessoDataBase.dart';
import 'package:app_blog/Model/models/TipoSalvarDataBase.dart';
import 'package:app_blog/Model/servicos/acessardados_service.dart';
import 'package:app_blog/Model/servicos/salvardados_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import '../../Model/models/Artigo.dart';
part 'salvo_viewmodel.g.dart';

class SalvoViewModel = SalvoViewModelMobx with _$SalvoViewModel;

abstract class SalvoViewModelMobx with Store{

  final TipoSalvarDataBase _tipoSalvar = TipoSalvarDataBase();
  final TipoAcessoDataBase _tipoAcesso = TipoAcessoDataBase();
  final AcessarDadosRepository _acessarDados = AcessarDadosRepository();
  final SalvarDados _salvarDados = SalvarDados();

  @observable
  List<Artigo> _artigosSalvos = [];

  @observable
  bool _artigoEstaSalvo = false;

  @computed
  List<Artigo> get artigosSalvos => _artigosSalvos;

  @computed
  bool get artigoEstaSalvo => _artigoEstaSalvo;

  @action
  recuperarArtigosSalvos(BuildContext context)async{
    _tipoAcesso.tipo = TipoAcesso.acessarArtigosSalvos;
    _artigosSalvos = await _acessarDados.acessarDados(_tipoAcesso, context);
  }

  @action
  retirarArtigoSalvo(BuildContext context, {required Artigo artigo})async{
    // TODO: fazer método de retirar artigo do salvos
  }

  @action
  salvarArtigo(BuildContext context, {required Artigo artigo}){
    _tipoSalvar.tipo = TipoSalvar.salvarArtigo;
    _salvarDados.salvarDados(_tipoSalvar, context, args: artigo);
  }

  @action
  aArtigoSalvo(BuildContext context, Artigo artigo){
    for(int i = 0; i < artigosSalvos.length; i++){
      if(artigo.id == artigosSalvos[i].id){
        _artigoEstaSalvo = true;
        break;
      }
    }
    print(_artigoEstaSalvo);
  }



}