:- module(
       proposta,
       [
        carrega_tab/1,
        proposta/59,
        insere/59,
        remove/1,
        atualiza/59,
        sincroniza/0
       ]).

:- use_module(library(persistency)).
:- use_module(chave, []).

:- persistent
    proposta(emiCod: positive_integer,
           emiConfig: string,
           emiIndJur: string,
           emiIndFis: string,
           cliCod: string,
           emiNom: string,
           emiDes: string,
           emiTipAber: string,
           emiStatus: string,
           emiPrjNes: string,
           emiMtpQtd: string,
           emiDatAbe: string,
           emiObsQtd: string,
           emiCtrlCor: string,
           orcTipo: string,
           orcDatReg: string,
           orcSolCod: string,
           orcSolNom: string,
           orcSolNro: string,
           orcSolCid: string,
           orcSolBai: string,
           orcSolLgr: string,
           orcSolCas: string,
           orcFon1: string,
           orcFax: string,
           orcCel: string,
           orcFunCod: string,
           orcFunNom: string,
           orcVlrIm1: string,
           orcVlrIpi: string,
           orcVlrIcms: string,
           orcVlrIss: string,
           orcSumTot: string,
           orcSumPer: string,
           orcVlrPar: string,
           orcNroPer: string,
           orcTmp: string,
           orcTmpTot: string,
           emiPrjCod: string,
           emiPrjNom: string,
           emiPrjIni: string,
           emiPrjFim: string,
           emiAcaDes: string,
           emiMtpPro: string,
           orcQtdLar: string,
           orcQtdCom: string,
           orcQtdPro: string,
           orcQtdPer: string,
           orcQtdAdd: string,
           orcVlrMet: string,
           emiPagFor: string,
           emiPagQtd: string,
           emiPagIni: string,
           emiPagFim: string,
           emiObsApr: string,
           emiSolOpe: string,
           emiAcaInd: string,
           emiEncado: string,
           emiEncAux: string
           ).

%:- initialization(db_attach('tbl_proposta.pl',[])).
:- initialization( at_halt(db_sync(gc(always))) ).

carrega_tab(ArqTabela):-
    db_attach(ArqTabela, []).

:- dynamic proposta/59.

insere(EmiCod,EmiConfig,EmiIndJur,EmiIndFis,CliCod,EmiNom,EmiDes,EmiTipAber,EmiStatus,EmiPrjNes,EmiMtpQtd,EmiDatAbe,EmiObsQtd,EmiCtrlCor,OrcTipo,OrcDatReg,OrcSolCod,OrcSolNom,OrcSolNro,OrcSolCid,OrcSolBai,OrcSolLgr,OrcSolCas,OrcFon1,OrcFax,OrcCel,OrcFunCod,OrcFunNom,OrcVlrIm1,OrcVlrIpi,OrcVlrIcms,OrcVlrIss,OrcSumTot,OrcSumPer,OrcVlrPar,OrcNroPer,OrcTmp,OrcTmpTot,EmiPrjCod,EmiPrjNom,EmiPrjIni,EmiPrjFim,EmiAcaDes,EmiMtpPro,OrcQtdLar,OrcQtdCom,OrcQtdPro,OrcQtdPer,OrcQtdAdd,OrcVlrMet,EmiPagFor,EmiPagQtd,EmiPagIni,EmiPagFim,EmiObsApr,EmiSolOpe,EmiAcaInd,EmiEncado,EmiEncAux):-
    chave:pk(proposta, EmiCod),
    with_mutex(proposta,
    assert_proposta(EmiCod,EmiConfig,EmiIndJur,EmiIndFis,CliCod,EmiNom,EmiDes,EmiTipAber,EmiStatus,EmiPrjNes,EmiMtpQtd,EmiDatAbe,EmiObsQtd,EmiCtrlCor,OrcTipo,OrcDatReg,OrcSolCod,OrcSolNom,OrcSolNro,OrcSolCid,OrcSolBai,OrcSolLgr,OrcSolCas,OrcFon1,OrcFax,OrcCel,OrcFunCod,OrcFunNom,OrcVlrIm1,OrcVlrIpi,OrcVlrIcms,OrcVlrIss,OrcSumTot,OrcSumPer,OrcVlrPar,OrcNroPer,OrcTmp,OrcTmpTot,EmiPrjCod,EmiPrjNom,EmiPrjIni,EmiPrjFim,EmiAcaDes,EmiMtpPro,OrcQtdLar,OrcQtdCom,OrcQtdPro,OrcQtdPer,OrcQtdAdd,OrcVlrMet,EmiPagFor,EmiPagQtd,EmiPagIni,EmiPagFim,EmiObsApr,EmiSolOpe,EmiAcaInd,EmiEncado,EmiEncAux)).

remove(EmiCod):-
    with_mutex(proposta,
      retract_proposta(EmiCod,_EmiConfig,_EmiIndJur,_EmiIndFis,_CliCod,_EmiNom,_EmiDes,_EmiTipAber,_EmiStatus,_EmiPrjNes,_EmiMtpQtd,_EmiDatAbe,_EmiObsQtd,_EmiCtrlCor,_OrcTipo,_OrcDatReg,_OrcSolCod,_OrcSolNom,_OrcSolNro,_OrcSolCid,_OrcSolBai,_OrcSolLgr,_OrcSolCas,_OrcFon1,_OrcFax,_OrcCel,_OrcFunCod,_OrcFunNom,_OrcVlrIm1,_OrcVlrIpi,_OrcVlrIcms,_OrcVlrIss,_OrcSumTot,_OrcSumPer,_OrcVlrPar,_OrcNroPer,_OrcTmp,_OrcTmpTot,_EmiPrjCod,_EmiPrjNom,_EmiPrjIni,_EmiPrjFim,_EmiAcaDes,_EmiMtpPro,_OrcQtdLar,_OrcQtdCom,_OrcQtdPro,_OrcQtdPer,_OrcQtdAdd,_OrcVlrMet,_EmiPagFor,_EmiPagQtd,_EmiPagIni,_EmiPagFim,_EmiObsApr,_EmiSolOpe,_EmiAcaInd,_EmiEncado,_EmiEncAux)).

atualiza(EmiCod,EmiConfig,EmiIndJur,EmiIndFis,CliCod,EmiNom,EmiDes,EmiTipAber,EmiStatus,EmiPrjNes,EmiMtpQtd,EmiDatAbe,EmiObsQtd,EmiCtrlCor,OrcTipo,OrcDatReg,OrcSolCod,OrcSolNom,OrcSolNro,OrcSolCid,OrcSolBai,OrcSolLgr,OrcSolCas,OrcFon1,OrcFax,OrcCel,OrcFunCod,OrcFunNom,OrcVlrIm1,OrcVlrIpi,OrcVlrIcms,OrcVlrIss,OrcSumTot,OrcSumPer,OrcVlrPar,OrcNroPer,OrcTmp,OrcTmpTot,EmiPrjCod,EmiPrjNom,EmiPrjIni,EmiPrjFim,EmiAcaDes,EmiMtpPro,OrcQtdLar,OrcQtdCom,OrcQtdPro,OrcQtdPer,OrcQtdAdd,OrcVlrMet,EmiPagFor,EmiPagQtd,EmiPagIni,EmiPagFim,EmiObsApr,EmiSolOpe,EmiAcaInd,EmiEncado,EmiEncAux):-
    with_mutex(proposta,
              (retractall_proposta(EmiCod,_EmiConfig,_EmiIndJur,_EmiIndFis,_CliCod,_EmiNom,_EmiDes,_EmiTipAber,_EmiStatus,_EmiPrjNes,_EmiMtpQtd,_EmiDatAbe,_EmiObsQtd,_EmiCtrlCor,_OrcTipo,_OrcDatReg,_OrcSolCod,_OrcSolNom,_OrcSolNro,_OrcSolCid,_OrcSolBai,_OrcSolLgr,_OrcSolCas,_OrcFon1,_OrcFax,_OrcCel,_OrcFunCod,_OrcFunNom,_OrcVlrIm1,_OrcVlrIpi,_OrcVlrIcms,_OrcVlrIss,_OrcSumTot,_OrcSumPer,_OrcVlrPar,_OrcNroPer,_OrcTmp,_OrcTmpTot,_EmiPrjCod,_EmiPrjNom,_EmiPrjIni,_EmiPrjFim,_EmiAcaDes,_EmiMtpPro,_OrcQtdLar,_OrcQtdCom,_OrcQtdPro,_OrcQtdPer,_OrcQtdAdd,_OrcVlrMet,_EmiPagFor,_EmiPagQtd,_EmiPagIni,_EmiPagFim,_EmiObsApr,_EmiSolOpe,_EmiAcaInd,_EmiEncado,_EmiEncAux),
                assert_proposta(EmiCod,EmiConfig,EmiIndJur,EmiIndFis,CliCod,EmiNom,EmiDes,EmiTipAber,EmiStatus,EmiPrjNes,EmiMtpQtd,EmiDatAbe,EmiObsQtd,EmiCtrlCor,OrcTipo,OrcDatReg,OrcSolCod,OrcSolNom,OrcSolNro,OrcSolCid,OrcSolBai,OrcSolLgr,OrcSolCas,OrcFon1,OrcFax,OrcCel,OrcFunCod,OrcFunNom,OrcVlrIm1,OrcVlrIpi,OrcVlrIcms,OrcVlrIss,OrcSumTot,OrcSumPer,OrcVlrPar,OrcNroPer,OrcTmp,OrcTmpTot,EmiPrjCod,EmiPrjNom,EmiPrjIni,EmiPrjFim,EmiAcaDes,EmiMtpPro,OrcQtdLar,OrcQtdCom,OrcQtdPro,OrcQtdPer,OrcQtdAdd,OrcVlrMet,EmiPagFor,EmiPagQtd,EmiPagIni,EmiPagFim,EmiObsApr,EmiSolOpe,EmiAcaInd,EmiEncado,EmiEncAux)
              )
               ).

sincroniza :-
    db_sync(gc(always)).


