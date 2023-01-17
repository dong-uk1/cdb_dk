<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="srcFrm" name="srcFrm" action="/empInfo/empInfoSrch/list/dtlEmpSrchList.do?occupation=&amp;notSrcKeyword=&amp;_csrf=0f3805e8-752c-4f43-9d2c-4bbf8f1ddd4b&amp;region=&amp;srcKeyword=&amp;keyword=" method="post" onsubmit="return false;">
	
	







<script type="text/javascript" src="/js/worknet.search.new.js" charset="utf-8"></script>
<script type="text/javaScript">
//<![CDATA[
	//검색
	function goSubmit(condSaveCode){

		//키워드
		$("#mForm #srcKeyword").val($("#srcFrm #srchKeyword").val());
		$("#mForm #notSrcKeyword").val($("#srcFrm #notSrchKeyword").val());


		if($("#srckeywordWantedTitle").prop("checked")){
			$("#keywordWantedTitle").val( $("#srckeywordWantedTitle").val() );
		}else{
			$("#keywordWantedTitle").val('');
		}
		if($("#srckeywordBusiNm").prop("checked")){
			  $("#keywordBusiNm").val( $("#srckeywordBusiNm").val() );
		}else{
			$("#keywordBusiNm").val('');
		}
		if($("#srckeywordJobCont").prop("checked")){
			  $("#keywordJobCont").val( $("#srckeywordJobCont").val() );
		}else{
			 $("#keywordJobCont").val('');
		}
		if($("#srckeywordStaAreaNm").prop("checked")){
			  $("#keywordStaAreaNm").val( $("#srckeywordStaAreaNm").val() );
		}else{
			  $("#keywordStaAreaNm").val('');
		}

		//경력 : 경력선택시 개월수 필수 체크
		if($("#careerTypeE").prop("checked")){
			if($("#careerFromParam").val() == "" && $("#careerToParam").val() == ""){
				alert("경력기간을 입력해 주세요");
				$("#careerFromParam").focus();
				return false;
			}

			if($("#careerFromParam").val() != "" && $("#careerToParam").val() != ""){
				if(parseInt($("#careerFromParam").val()) > parseInt($("#careerToParam").val())){
					alert("경력기간 입력을 정확하게 해주세요");
					$("#careerFromParam").focus();
					return false;
				}
			}
		}

		//희망연금 관계없음이 아닐경우 체크
		if($("#noPayType").prop("checked")==false){
			if($("#b_minPay").val() == "" && $("#b_maxPay").val() == ""){
				alert("희망임금을 입력해 주세요");
				$("#b_minPay").focus();
				return false;
			}

			if($("#b_minPay").val() != "" && $("#b_maxPay").val() != "" ){
				if(parseInt($("#b_minPay").val(),10) > parseInt($("#b_maxPay").val(), 10)){
					$("#b_minPay").focus();
					alert('최소 금액이 최대 금액보다 클 수 없습니다.');
					return false;
				}
			}
		}

		//채용마감일 validator
		if(($("#cloDateEndt").val() != '' && $("#cloDateStdt").val() != '') && $("#cloDateStdt").val() > $("#cloDateEndt").val()){
			alert("마감일의 시작일은 종료일보다 같거나 우선일이여야 합니다.");
			return false;
		}

		//공고등록일 validator
		if(($("#regDateEndt").val() != '' && $("#regDateStdt").val()) && $("#regDateStdt").val() > $("#regDateEndt").val() ){
			alert("등록일의 시작일은 종료일보다 같거나 우선일이여야 합니다.");
			return false;
		}

	    //직종
		var occupationItem= $("input[name='occupationParam']").map(function(){
			return $(this).val();
		}).get();
		$("#occupation").val(occupationItem);

		 //지역
		var regionItem= $("input[name='regionParam']").map(function(){
			return $(this).val();
		}).get();
		$("#region").val(regionItem);

		// 서식개정 - 재택근무
		if($("#tlmgYnParamY").prop("checked")){
			  $("#tlmgYn").val( $("#tlmgYnParamY").val() );
		 }else{
			$("#tlmgYn").val('');
		 }

		 //역세권별
		var stationItem= $("input[name='stationParam']").map(function(){
			return $(this).val();
		}).get();

		$("#station").val(stationItem);

		var stationNmItem= $("input[name='stationNmParam']").map(function(){
			return $(this).val();
		}).get();
		$("#stationNm").val(stationNmItem);

		//산업단지별
		//$("#depth2SelCode").val($("#templateDepthNoInfo").val());


		//경력
	     var careerTypesItem=[];
		 $('input:checkbox[name=careerType]:checked').each(function(){
			 careerTypesItem.push($(this).val());
		 });

		 $("#careerTypes").val(careerTypesItem);

		 if($("#careerToParam").val()!=""){
			 var careerTo = $("#careerToParam").val() * 12 ;
		    $("#careerTo").val(careerTo);
		 }else{
			 $("#careerTo").val('');
		 }

		 if($("#careerFromParam").val()!=""){
			 var careerFrom = $("#careerFromParam").val() * 12 ;
		    $("#careerFrom").val(careerFrom);
		 }else{
			 $("#careerFrom").val('');
		 }

		 // 서식개정 경력조건 필수/우대
		 var carrEssYnItem=[];
		 $('input:checkbox[name=carrEssYn]:checked').each(function(){
			 carrEssYnItem.push($(this).val());
		 });
		 $("#carrEssYns").val(carrEssYnItem);


		//고용형태
		 var employGbnItem=[];
		 $('input:checkbox[name=employGbnParam]:checked').each(function(){
			 employGbnItem.push($(this).val());
		 });

		 $("#employGbn").val(employGbnItem);

		 if($("#subEmpHopeYnParamY").prop("checked")){
		    $("#subEmpHopeYn").val( $("#subEmpHopeYnParamY").val() );
	 	 }else{
			$("#subEmpHopeYn").val('');
		 }

		 var termContractMmcntItem=[];
		 $('input:checkbox[name=termContractMmcntParam]:checked').each(function(){
			 termContractMmcntItem.push($(this).val());
		 });

		 $("#termContractMmcnt").val(termContractMmcntItem);


		 //학력
		 if($("#b_academicGbnoEdu").prop("checked")){
			 $("#academicGbnoEdu").val("noEdu");
			 $("#academicGbn").val("");
		 }else{
			var academicItem=[];
			$('input:checkbox[name=b_academicGbn]:checked').each(function(){
				academicItem.push($(this).val());
			});
			$("#academicGbnoEdu").val("");
			$("#academicGbn").val(academicItem);
		 }


		 //희망임금
		 $("#minPay").val( $("#b_minPay").val());
		 $("#maxPay").val( $("#b_maxPay").val());


		 //기업형태
		 var enterPriseGbnItem=[];
		 $('input:checkbox[name=enterPriseGbnParam]:checked').each(function(){
			 enterPriseGbnItem.push($(this).val());
		 });
		 $("#enterPriseGbn").val(enterPriseGbnItem);

		 //근무형태
		  var holidayGbnItem=[];
		 $('input:checkbox[name=holidayGbnParam]:checked').each(function(){
			 holidayGbnItem.push($(this).val());
		 });

		 $("#holidayGbn").val(holidayGbnItem);

		 //우대조건
	     var preferentialGbnParam =$('input:checkbox[name="preferentialGbnParam"]:checked').val();
	     $("#preferentialGbn").val(preferentialGbnParam);

		 //정보제공처
		 var siteClcdItem=[];
	     $('input:checkbox[name=b_siteClcd]:checked').each(function(){

	    	 siteClcdItem.push($(this).val());
		 });
	     $("#siteClcd").val(siteClcdItem);

	     //이메일 입사지원
	     if($("#emailApplyYnParamY").prop("checked")){
			  $("#emailApplyYn").val( $("#emailApplyYnParamY").val() );
		 }else{
			$("#emailApplyYn").val('');
		 }

	    //마감일
	     $("#cloDateEndtParam").val($("#cloDateEndt").val().replace(/\./g,""));
		 $("#cloDateStdtParam").val($("#cloDateStdt").val().replace(/\./g,""));
		 var cloTermSearchGbnParam =$('input:radio[name="cloTermSearchGbnParam"]:checked').val();
	     $("#cloTermSearchGbn").val(cloTermSearchGbnParam);

		//등록일
	     $("#regDateStdtParam").val($("#regDateStdt").val().replace(/\./g,""));
		 $("#regDateEndtParam").val($("#regDateEndt").val().replace(/\./g,""));

		 var termSearchGbnParam =$('input:radio[name="termSearchGbnParam"]:checked').val();
	     $("#termSearchGbn").val(termSearchGbnParam);

	     // 서식개정 - 격일근무
	     if($("#eodwYnParam").prop("checked")){
			    $("#eodwYn").val( $("#eodwYnParam").val() );
		 }else{
				$("#eodwYn").val('');
		 }

	 	 

         //장애인 희망채용
	     var disableEmpHopeGbnItem=[];
	     $('input:checkbox[name=disableEmpHopeGbnParam]:checked').each(function(){
	    	 disableEmpHopeGbnItem.push($(this).val());
		 });

	     $("#disableEmpHopeGbn").val(disableEmpHopeGbnItem);

         //근로시간단축여부
		 if($("#laborHrShortYnParamY").prop("checked")){
			    $("#laborHrShortYn").val( $("#laborHrShortYnParamY").val() );
		 }else{
				$("#laborHrShortYn").val('');
		 }
	     

	     // 서식개정 - 교대제근무
	     if($("#shsyWorkSecdParamY").prop("checked")){
			    $("#shsyWorkSecd").val( $("#shsyWorkSecdParamY").val() );
		 }else{
				$("#shsyWorkSecd").val('');
		 }

		 

		 //채용구분
	     var empTpGbcdParam=[];
	     $('input:checkbox[name=empTpGbcdParam]:checked').each(function(){
	    	 empTpGbcdParam.push($(this).val());
		 });
	     $("#empTpGbcd").val(empTpGbcdParam);


		//기타복리후생
	     var benefitGbnItem=[];
	     $('input:checkbox[name=b_benefitGbn]:checked').each(function(){
	    	 benefitGbnItem.push($(this).val());
		 });

	     $("#benefitGbn").val(benefitGbnItem);

	     //교대근무여부
	     if($("#rot2WorkYnParamY").prop("checked")){
			    $("#rot2WorkYn").val( $("#rot2WorkYnParamY").val() );
		 }else{
				$("#rot2WorkYn").val('');
		 }
	     if($("#rot3WorkYnParamY").prop("checked")){
			    $("#rot3WorkYn").val( $("#rot3WorkYnParamY").val() );
		 }else{
				$("#rot3WorkYn").val('');
		 }

	     //식사비제공
	      var mealOfferClcdItem=[];
	     $('input:checkbox[name=mealOfferClcdParam]:checked').each(function(){
	    	 mealOfferClcdItem.push($(this).val());
		 });

	     $("#mealOfferClcd").val(mealOfferClcdItem);


	     //병역특례
	     var actServExcYnItem=[];
	     if($("#actServExcYnParamY").prop("checked")){
			    $("#actServExcYn").val( $("#actServExcYnParamY").val() );
		 }else{
				$("#actServExcYn").val('');
		 }
	     if($("#resrDutyExcYnParamY").prop("checked")){
			    $("#resrDutyExcYn").val( $("#resrDutyExcYnParamY").val() );
		 }else{
				$("#resrDutyExcYn").val('');
		 }
	     if($("#publDutyExcYnParamY").prop("checked")){
			    $("#publDutyExcYn").val( $("#publDutyExcYnParamY").val() );
		 }else{
				$("#publDutyExcYn").val('');
		 }
	     if($("#infaYnParamY").prop("checked")){
			    $("#infaYn").val( $("#infaYnParamY").val() );
		 }else{
				$("#infaYn").val('');
		 }

	     //자격증
		 var licItem= $("input[name='licParam']").map(function(){
			return $(this).val();
		 }).get();

		 $("#cert").val(licItem);

		 if($("#b_essCertChkY").prop("checked")){
			    $("#essCertChk").val($("#b_essCertChkY").val());
		 }else{
				$("#essCertChk").val('');
		 }

		 //전공
		 var majItem= $("input[name='majParam']").map(function(){
			return $(this).val();
		 }).get();

		 $("#major").val(majItem);

		 //외국어
		 var foriegnItem=[];
		 $('input:checkbox[name=forItem]:checked').each(function(){
			 foriegnItem.push($(this).val());
		 });

		 $("#foriegn").val(foriegnItem);


		 //기타우대사항
		 var arrComputerPreferentialItem=[];
		 $('input:checkbox[name=computerPreferentialParam]:checked').each(function(){
			 arrComputerPreferentialItem.push($(this).val());
		 });

		 $("#computerPreferential").val(arrComputerPreferentialItem);

		 var arrPfMatterPreferentialItem=[];
		 $('input:checkbox[name=pfMatterPreferentialParam]:checked').each(function(){
			 arrPfMatterPreferentialItem.push($(this).val());
		 });

		 $("#pfMatterPreferential").val(arrPfMatterPreferentialItem);

	     


		if(condSaveCode == "Y"){	//맞춤채용 조건 저장 여부
			return true;
		} else {
			$("#searchOn").val("Y");
			fn_Search(1);
		}
	}


	//##########클릭시 실시간 검색#####################################

// 	 $(document).ready(function(){

// 		 //키워드
// 		 $("#srcKeyword").blur(function(){
// 			 fn_keywordSearch();
// 			 f_requestSearchListCnt();
// 		 });


// 		 $("#cloDateStdt").change(function(){
// 			  document.getElementById("cloTermSearchGbn0").checked = false;
// 			  resultDateTemplate('마감일','cloDateStdt','cloDateEndt','cloTermSearchGbn0');
// 			  f_requestSearchListCnt();
// 		 });

// 		 $("#cloDateEndt").change(function(){
// 			  document.getElementById("cloTermSearchGbn0").checked = false;
// 			  resultDateTemplate('마감일','cloDateStdt','cloDateEndt','cloTermSearchGbn0');
// 			  f_requestSearchListCnt();
// 		 });

// 		 $("#regDateStdt").change(function(){
// 			  document.getElementById("termSearchGbn0").checked = false;
// 			  resultDateTemplate('등록일','regDateStdt','regDateEndt','termSearchGbn0');
// 			  f_requestSearchListCnt();
// 		 });

// 		 $("#regDateEndt").change(function(){
// 			  document.getElementById("termSearchGbn0").checked = false;
// 			  resultDateTemplate('등록일','regDateStdt','regDateEndt','termSearchGbn0');
// 			  f_requestSearchListCnt();
// 		 });


// 		 //경력
// 		 $("#careerFromParam").blur(function(){
// 			 resultCheckBoxTemplate('careerType');
// 			 f_requestSearchListCnt();
// 		 });

// 		 $("#careerToParam").blur(function(){
// 			 resultCheckBoxTemplate('careerType');
// 			 f_requestSearchListCnt();
// 		 });

// 		//희망임금
// 		 $("#b_minPay").blur(function(){
// 			 resultPayTypeTemplate($("#payGbn").val(),'payType');
// 			 f_requestSearchListCnt();
// 		 });

// 		 $("#b_maxPay").blur(function(){
// 			 resultPayTypeTemplate($("#payGbn").val(),'payType');
// 			 f_requestSearchListCnt();
// 		 });


//  		 $('input[type="checkbox"],input[type="radio"]').click(function(){
// 			 f_requestSearchListCnt();
//  		 });

// 	 });

	 function fn_keywordSearch(){


		    if($("#srchKeyword").val()==""){
		    	$("#srcKeywordNm").remove();
		    	$("#srcKeywordkeywordWantedTitleNm").remove();
				$("#srcKeywordkeywordBusiNmNm").remove();
				$("#srcKeywordkeywordJobContNm").remove();
				$("#srcKeywordkeywordStaAreaNmNm").remove();
		    }else{
				//키워드 셋팅
			    if( $("#srckeywordAllChk").prop("checked")){
			    	resultKeywordTemplate('srcKeyword','');
			    	resultNotSrcKeywordTemplate('notSrcKeyword','');
				}
			    if( $("#srckeywordWantedTitle").prop("checked")){
			    	resultKeywordTemplate('srcKeyword','keywordWantedTitle');
			    	resultNotSrcKeywordTemplate('notSrcKeyword','keywordWantedTitle');
				}
			    if( $("#srckeywordBusiNm").prop("checked")){
			    	resultKeywordTemplate('srcKeyword','keywordBusiNm');
			    	resultNotSrcKeywordTemplate('notSrcKeyword','keywordBusiNm');
				}
			    if( $("#srckeywordJobCont").prop("checked")){
			    	resultKeywordTemplate('srcKeyword','keywordJobCont');
			    	resultNotSrcKeywordTemplate('notSrcKeyword','keywordJobCont');
				}
			    if( $("#srckeywordStaAreaNm").prop("checked")){
			    	consloe.log("fn_keywordSearch진입")
			    	resultKeywordTemplate('srcKeyword','keywordStaAreaNm');
			    	resultNotSrcKeywordTemplate('notSrcKeyword','keywordStaAreaNm');
				}
		    }
		}

	 function fn_moreButton(val){
		 $("#moerButtonYn").val(val);
	 }



	 //검색 클릭시 실시간 검색
	 function f_requestSearchListCnt() {

		var url = "/empInfo/empInfoSrch/list/dtlEmpSrchListCntAjax.do";
		var param = {};

		//키워드
		param.srcKeyword=$("#srcKeyword").val();
		param.notSrcKeyword=$("#notSrcKeyword").val();

		if($("#srckeywordWantedTitle").prop("checked")){
			param.keywordWantedTitle = $("#srckeywordWantedTitle").val();
		}else{
			param.keywordWantedTitle = '';
		}
		if($("#srckeywordBusiNm").prop("checked")){
			param.keywordBusiNm = $("#srckeywordBusiNm").val();
		}else{
			param.keywordBusiNm = '';
		}
		if($("#srckeywordJobCont").prop("checked")){
			param.keywordJobCont = $("#srckeywordJobCont").val();
		}else{
			param.keywordJobCont = '';
		}
		if($("#srckeywordStaAreaNm").prop("checked")){
			param.keywordStaAreaNm = $("#srckeywordStaAreaNm").val();
		}else{
			param.keywordStaAreaNm = '';
		}

		//직종
		var occupationItem= $("input[name='occupationParam']").map(function(){
			return $(this).val();
		}).get();
		param.occupation = occupationItem;

		//지역
		var regionItem= $("input[name='regionParam']").map(function(){
			return $(this).val();
		}).get();
		param.region = regionItem;

		//역세권별
		var stationItem= $("input[name='stationParam']").map(function(){
			return $(this).val();
		}).get();
		param.station = stationItem;

		var stationNmItem= $("input[name='stationNmParam']").map(function(){
			return $(this).val();
		}).get();
		param.stationNm = stationNmItem;

		//산업단지별
		//param.depth2SelCode = $("#templateDepthNoInfo").val();

		//경력
		var careerTypesItem=[];
		$('input:checkbox[name=careerType]:checked').each(function(){
			careerTypesItem.push($(this).val());
		});
		param.careerTypes = careerTypesItem;

		if($("#careerToParam").val()!=""){
			var careerTo = $("#careerToParam").val() * 12 ;
			param.careerTo = careerTo;
		}else{
			param.careerTo = '';
		}

		if($("#careerFromParam").val()!=""){
			var careerFrom = $("#careerFromParam").val() * 12 ;
			param.careerFrom = careerFrom;
		}else{
			param.careerFrom = '';
		}

		//고용형태
		var employGbnItem=[];
		$('input:checkbox[name=employGbnParam]:checked').each(function(){
			employGbnItem.push($(this).val());
		});
		param.employGbn = employGbnItem;

		
			if($("#subEmpHopeYnParamY").prop("checked")){
				param.subEmpHopeYn = $("#subEmpHopeYnParamY").val();
		 	}else{
		 		param.subEmpHopeYn = '';
			}
		
		var termContractMmcntItem=[];
		$('input:checkbox[name=termContractMmcntParam]:checked').each(function(){
			termContractMmcntItem.push($(this).val());
		});
		param.termContractMmcnt = termContractMmcntItem;

		//학력
		if($("#b_academicGbnoEdu").prop("checked")){
			param.academicGbnoEdu = 'noEdu';
			param.academicGbn = '';
		}else{
			var academicItem=[];
			$('input:checkbox[name=b_academicGbn]:checked').each(function(){
				academicItem.push($(this).val());
			});
			param.academicGbnoEdu = '';
			param.academicGbn = academicItem;
		}

		//희망임금
		param.payGbn = $("#payGbn").val();
	    param.minPay = $("#b_minPay").val();
		param.maxPay = $("#b_maxPay").val();

		//기업형태
		var enterPriseGbnItem=[];
		$('input:checkbox[name=enterPriseGbnParam]:checked').each(function(){
			enterPriseGbnItem.push($(this).val());
		});
		param.enterPriseGbn = enterPriseGbnItem;

		//근무형태
		var holidayGbnItem=[];
		$('input:checkbox[name=holidayGbnParam]:checked').each(function(){
			holidayGbnItem.push($(this).val());
		});
		param.holidayGbn = holidayGbnItem;

		//우대조건
	    var preferentialGbnParam =$('input:checkbox[name="preferentialGbnParam"]:checked').val();
	    param.preferentialGbn = preferentialGbnParam;

		//정보제공처
		var siteClcdItem=[];
	    $('input:checkbox[name=b_siteClcd]:checked').each(function(){
	    	siteClcdItem.push($(this).val());
		});

		
	    
	    param.siteClcd = siteClcdItem;
	    
	    //이메일 입사지원
	    if($("#emailApplyYnParamY").prop("checked")){
			param.emailApplyYn = $("#emailApplyYnParamY").val();
		}else{
			param.emailApplyYn = '';
		}

	    //마감일
	    param.cloDateEndt = $("#cloDateEndt").val().replace(/\./g,"");
		param.cloDateStdt = $("#cloDateStdt").val().replace(/\./g,"");

		//등록일
		param.regDateStdt = $("#regDateStdt").val().replace(/\./g,"");
	    param.regDateEndt = $("#regDateEndt").val().replace(/\./g,"");

	    

        //장애인 희망채용
	      var disableEmpHopeGbnItem=[];
	     $('input:checkbox[name=disableEmpHopeGbnParam]:checked').each(function(){
	    	 disableEmpHopeGbnItem.push($(this).val());
		 });
	     param.disableEmpHopeGbn = disableEmpHopeGbnItem;

       //근로시간단축여부
		 if($("#laborHrShortYnParamY").prop("checked")){
			    param.laborHrShortYn =$("#laborHrShortYnParamY").val();
		 }else{
			 param.laborHrShortYn = '';
		 }
	     

		 

		   //채용구분
	     var empTpGbcdParam=[];
	     $('input:checkbox[name=empTpGbcdParam]:checked').each(function(){
	    	 empTpGbcdParam.push($(this).val());
		 });

	     param.empTpGbcd = empTpGbcdParam;


		//기타복리후생
	     var benefitGbnItem=[];
	     $('input:checkbox[name=b_benefitGbn]:checked').each(function(){
	    	 benefitGbnItem.push($(this).val());
		 });
	     param.benefitGbn = benefitGbnItem;
	     param.benefitSrchAndOr =$("#benefitSrchAndOr").val();

	     //교대근무여부
	     if($("#rot2WorkYnParamY").prop("checked")){
			    param.rot2WorkYn = $("#rot2WorkYnParamY").val();
		 }else{
				param.rot2WorkYn = '';
		 }
	     if($("#rot3WorkYnParamY").prop("checked")){
			    param.rot3WorkYn = $("#rot3WorkYnParamY").val();
		 }else{
			 param.rot3WorkYn = '';
		 }

	     //식사비제공
	      var mealOfferClcdItem=[];
	     $('input:checkbox[name=mealOfferClcdParam]:checked').each(function(){
	    	 mealOfferClcdItem.push($(this).val());
		 });

	     param.mealOfferClcd = mealOfferClcdItem;

	     //병역특례
	     var actServExcYnItem=[];
	     if($("#actServExcYnParamY").prop("checked")){
			    param.actServExcYn = $("#actServExcYnParamY").val();
		 }else{
				param.actServExcYn = '';
		 }
	     if($("#resrDutyExcYnParamY").prop("checked")){
			    param.resrDutyExcYn = $("#resrDutyExcYnParamY").val();
		 }else{
				 param.resrDutyExcYn = '';
		 }
	     if($("#publDutyExcYnParamY").prop("checked")){
			    param.publDutyExcYn = $("#publDutyExcYnParamY").val();
		 }else{
				 param.publDutyExcYn = '';
		 }
	     if($("#infaYnParamY").prop("checked")){
			    param.infaYn = $("#infaYnParamY").val();
		 }else{
				 param.infaYn = '';
		 }


	     //자격증
		 var licItem= $("input[name='licParam']").map(function(){
			return $(this).val();
		 }).get();
		 param.cert = licItem;

		 if($("#b_essCertChkY").prop("checked")){
			    param.essCertChk = $("#b_essCertChkY").val();
		 }else{
			    param.essCertChk = '';
		 }

		 //전공
		 var majItem= $("input[name='majParam']").map(function(){
			return $(this).val();
		 }).get();
	     param.major = majItem;

		 //외국어
		 var foriegnItem=[];
		 $('input:checkbox[name=forItem]:checked').each(function(){
			 foriegnItem.push($(this).val());
		 });

		 param.foriegn = foriegnItem;

		 //기타우대사항
		 var arrComputerPreferentialItem=[];
		 $('input:checkbox[name=computerPreferentialParam]:checked').each(function(){
			 arrComputerPreferentialItem.push($(this).val());
		 });
		 param.computerPreferential = arrComputerPreferentialItem;

		 var arrPfMatterPreferentialItem=[];
		 $('input:checkbox[name=pfMatterPreferentialParam]:checked').each(function(){
			 arrPfMatterPreferentialItem.push($(this).val());
		 });
		 param.pfMatterPreferential = arrPfMatterPreferentialItem;

	     
	     
	     

		jQuery.ajaxSettings.traditional = true;

		$.ajax({
			type: 'GET',
			url: url,
			data: param,
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded;charset='+'utf-8',
			error: function(request, status, error){
				alert("code : " + request.status + "\r\nmessage : " + request.responseText);
			},
			success: function (resData) {
				f_responseSearchListCnt(resData);
			}
		 });
	}

   function f_responseSearchListCnt(resultObj) {

		resultObj = resultObj.ajaxResult;

		$(".futura").html(resultObj.replace(/\B(?=(\d{3})+(?!\d))/g,","));
   }

 //직종키워드검색 callback
	function f_response(resultObj){
		resultObj = resultObj.ajaxResult;
		if(resultObj != null && resultObj.length > 0){
			var keywordHtml = "";
			var jobsCd = "";
			var preJobsCd = "";

			for(var i = 0; i < resultObj.length; i++){

				jobsCd = resultObj[i].jobsCd;
				if(i == 0){
					keywordHtml += "<tr id='keyword_"+jobsCd+"'>\n";
					keywordHtml += "<th scope=\"row\" class=\"a-l\">"+resultObj[i].jobsCdKorNm+"</th>\n";
					keywordHtml += "<td class=\"a-l\">\n";
				}

				if(preJobsCd != "" && jobsCd != preJobsCd){
					keywordHtml += "</td>\n";
					keywordHtml += "</tr>\n";
					keywordHtml += "<tr id='keyword_"+jobsCd+"'>\n";
					keywordHtml += "<th scope=\"row\" class=\"a-l\">"+resultObj[i].jobsCdKorNm+"</th>\n";
					keywordHtml += "<td class=\"a-l\">\n";
				}

				keywordHtml += "<button type=\"button\" class=\"button tiny\" onclick=\"f_searchSubmit('"+resultObj[i].jobsCd+"', '"+resultObj[i].jobsCdSeqNo+"', 'N')\">"+resultObj[i].jobsKeywordNm+"</button>\n";
				preJobsCd = jobsCd;
			}

			if(preJobsCd == jobsCd){
				keywordHtml += "</td>\n";
				keywordHtml += "</tr>\n";
			}

			$('#jobsKeywordList').html(keywordHtml);
			$("#jobsKeywordLine").css("display", "block");
		}else{
			$("#jobsKeywordLine").css("display", "none");
		}
	}

	function f_searchSubmit(keywordJobCd, keywordJobCdSeqNo, keywordEtcYn){
		$("[id^='occupationNm']").each(function(){
			var data = $(this).attr('id');

			if(data != 'occupationNm'+keywordJobCd){
				$(this).remove();
			}
		});

		$('#keywordJobCd').val(keywordJobCd);
		$('#keywordJobCdSeqNo').val(keywordJobCdSeqNo);
		$('#exJobsCd').val($('#keywordJobCd').val()+$('#keywordJobCdSeqNo').val());

		goSubmit();
	}

	function copyLetter(letterVal){

	    $('#clip_target').val(letterVal);
	    $('#clip_target').select();
	    try {
	        var successful = document.execCommand('copy');
	        alert('클립보드에 문자('+ letterVal +')가 복사되었습니다. Ctrl+V 로 붙여넣기 하세요.');
	    } catch (err) {
	        alert('이 브라우저는 복사 기능을 지원하지 않습니다.');
	    }
	}

	function copyLetter2(letterVal){

	    $('#clip_target2').val(letterVal);
	    $('#clip_target2').select();
	    try {
	        var successful = document.execCommand('copy');
	        alert('클립보드에 문자('+ letterVal +')가 복사되었습니다. Ctrl+V 로 붙여넣기 하세요.');
	    } catch (err) {
	        alert('이 브라우저는 복사 기능을 지원하지 않습니다.');
	    }
	}
	
	
//]]>
</script>

<div class="careers-search">
<div class="careers-search-table">
	<table>
		<caption>채용정보 상세검색 기본 표로 키워드 검색, 직종, 지역 등의 상세검색 조건 제공</caption>
		<colgroup>
			<col style="width:126px;">
			<col>
			<col style="width:126px;">
			<col>
		</colgroup>
		<tbody>
			<!-- 20220608 추가 -->
			<tr>
				<th scope="row" class="pb00"><span class="label">키워드 검색 범위</span></th>
				<td colspan="3" class="pb00">
					<div class="label-wrap line-0">
						
						
							
						
						<span>
							<input type="checkbox" onclick="f_keywordTextCheck('srcKeyword','');" id="srckeywordAllChk" name="keywordStaAreaNm" value="Y" checked="checked">
							<label for="srckeywordAllChk">전체</label>
						</span>
						<span>
							<input type="checkbox" onclick="f_keywordTextCheck('srcKeyword','keywordWantedTitle');" id="srckeywordWantedTitle" title="제목" name="srckeywordWantedTitle" value="Y">
							<label for="srckeywordWantedTitle">제목</label>
						</span>
						<span>
							<input type="checkbox" onclick="f_keywordTextCheck('srcKeyword','keywordBusiNm');" id="srckeywordBusiNm" title="회사명" name="srckeywordBusiNm" value="Y">
							<label for="srckeywordBusiNm">회사명</label>
						</span>
						<span>
							<input type="checkbox" onclick="f_keywordTextCheck('srcKeyword','keywordJobCont');" id="srckeywordJobCont" title="직무내용" name="srckeywordJobCont" value="Y">
							<label for="srckeywordJobCont">직무내용</label>
						</span>
						<span>
							<input type="checkbox" onclick="f_keywordTextCheck('srcKeyword','keywordStaAreaNm');" id="srckeywordStaAreaNm" title="역세권명" name="srckeywordStaAreaNm" value="Y">
							<label for="srckeywordStaAreaNm">역세권명</label>
						</span>

					</div>
				</td>
			</tr>
			<!-- //20220608 추가 -->
			<!-- 20220607 수정 -->
			<tr>
				<th scope="row">
					<label for="srchKeyword" class="label">검색 키워드</label>
					<div class="tooltip">
						<a href="#layerTool_01" class="tooltip"><i class="iconset ico-tooltip">툴팁</i></a>
						<div id="layerTool_01" class="layer-tooltip w780px">
							<h3 class="mb10 font-black">검색 키워드</h3>
							<p class="txt font-normal">키워드 검색 시 검색연산자를 활용하면 원하는 결과를 쉽고 빠르게 검색할 수 있습니다. (검색연산자는 중복 사용 가능합니다.)</p>

							<div class="table-wrap mt05">
								<table class="tooltip-table">
									<caption>키워드 설명 표</caption>
									<colgroup>
										<col style="width:25%">
										<col style="width:20%">
										<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="col" class="bg-gray">연산자</th>
											<th scope="col" class="bg-gray">예시</th>
											<th scope="col" class="bg-gray">검색내용</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><span class="font-blue2">띄어쓰기</span></td>
											<td class="font-normal">영업 해외영업</td>
											<td class="font-normal">[영업]과 [해외영업] 모두 포함된 결과값을 검색(AND)</td>
										</tr>
										<tr>
											<td>												
												<span class="font-blue2 mr05">|</span>
<!-- 												<span><button type="button" class="button small tooltip" onclick="copyLetter('|');">문자복사</button></span> -->
											</td>
											<td class="font-normal">영업 <strong class="font-blue2">|</strong> 해외영업</td>
											<td class="font-normal">[해외영업] 중 하나 이상 포함된 결과값을 검색(OR)</td>
										</tr>
									</tbody>
								</table>
								<input id="clip_target" type="text" value="" title="주소복사" tabindex="-1" style="position:absolute;top:-9999em;">
							</div>
						</div>
					</div>
				</th>
				<td colspan="3">
					<input style="ime-mode:active;" type="search" id="srchKeyword" name="srcKeyword" value="" class="input-text" placeholder="여러단어를 입력하실 때는 띄어쓰기(AND), |(OR) 연산자를 이용하여 더욱 세밀하게 검색 가능합니다.(예:영업|해외영업)" maxlength="30" onfocus="input_limit_string(this,'/kor,/eng,/d,/symbol7,/s');" onkeypress="if(event.keyCode==13) goSubmit();">
				</td>
			</tr>
			<tr style="border-bottom:1px solid #dce4e9">
				<th scope="row" class="pb20">
					<label for="notSrcKeyword" class="label">제외 키워드</label>
					<div class="tooltip">
						<a href="#layerTool_02" class="tooltip"><i class="iconset ico-tooltip">툴팁</i></a>
						<div id="layerTool_02" class="layer-tooltip w780px">
						<h3 class="mb10 font-black">제외 키워드</h3>
							<p class="txt font-normal">입력란에 제외할 단어를 입력하세요. 여러 단어를 제외하고 싶은 경우 쉼표(,)를 사용하여 작성 가능합니다.</p>

							<div class="table-wrap mt05">
								<table class="tooltip-table">
									<caption>제외 키워드 설명 표</caption>
									<colgroup>
										<col style="width:20%">
										<col style="width:25%">
										<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="col" class="bg-gray">연산자</th>
											<th scope="col" class="bg-gray">예시</th>
											<th scope="col" class="bg-gray">검색내용</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
												<strong class="font-blue2">,</strong>
											</td>
											<td class="font-normal">제가요양보호사<strong class="font-blue2">,</strong> 돌봄서비스</td>
											<td class="font-normal">입력한 키워드를 제외하고 검색 (NOT)</td>
										</tr>
									</tbody>
								</table>
								<input id="clip_target2" type="text" value="" title="주소복사" tabindex="-1" style="position:absolute;top:-9999em;">
							</div>
						</div>
					</div>
				</th>
				<td colspan="3" class="pb20">
					<input style="ime-mode:active;" type="search" id="notSrchKeyword" name="notSrcKeyword" class="input-text" placeholder="검색결과에서 제외할 단어를 입력하세요. 여러 단어는 쉼표(,)로 작성이 가능합니다." value="" maxlength="30" onfocus="input_limit_string(this,'/kor,/eng,/d,/symbol8,/s');" onkeypress="if(event.keyCode==13) goSubmit();">
				</td>
			<!-- //20220607 수정 -->

			</tr><tr>
				<th scope="row" class="pt20">
					<span class="label">
						직종
					</span>
				</th>
				<td colspan="3" class="pt20">
					<!-- layer-group -->
					<div class="layer-group">
						<!--
							a 태그의 #값 과 해당 레이어의 id 가 일치 해야 함.
						 -->
						<div class="btn-block">
							<a href="#jobCategory" id="jobCategoryOpen" class="button btn-open-block">직종 선택</a>
						</div>

						<div id="jobCategory" class="layer-block">
								<div class="job-kind-select">
									<div class="search-area">
										<!-- 2018-11-01 문구수정 -->
										<ul class="dot-list v1">
											<li>직종 : 최대 10개의 직종 선택이 가능합니다. 원하시는 직종을 선택하세요.</li>
											<li>체크박스를 클릭하면 직종이 선택되고, ‘직종명’을 클릭하면 하위 분류가 보여집니다.</li>
											<li>3차 분류 직종을 선택하시면 해당 직종에 대한 키워드로 채용정보를 검색하실 수 있습니다.</li>
										</ul>
										<!--// 2018-11-01 문구수정 -->

										<!-- 2018-11-01 class 변경 -->
										<div class="mt10 mb10">
											<input style="ime-mode:active;" type="search" id="jobSearchKeyword" name="" title="직종 검색어 입력" placeholder="직종 키워드를 입력하세요. 예) 영업, 운전, 사무직" class="input-text w560px">
											<button type="button" class="button" onclick="jobCategorySearch();">검색</button>
										</div>
									</div>

									<!-- 카테고리 선택 -->
									<!--
										<div class="cate"> 의 갯수에 따라서 다중 클래스 처리

										1개 : <div class="category-select">
										2개 : <div class="category-select col-2">
										3개 : <div class="category-select col-3">
										4개 : <div class="category-select col-4">
										5개 : <div class="category-select col-5">
									-->
									<div class="category-select col-3">
										<div class="cate" id="mainJobDiv"><p class="tit bg01">1차분류</p>  <ul><li><input type="checkbox" name="mainJob" title="건설·채굴 선택. 선택시 하단의 검색결과에서 확인 가능함" onclick="f_checkJob(this,'08');f_requestJobSubList('08', 'mainJob0' , 'subJob');" value="08"><button type="button" class="choice" title="건설·채굴에 속하는 2차분류 조회" onclick="f_requestJobSubList('08', 'mainJob0' , 'subJob');">건설·채굴</button><input type="hidden" id="mainJob0Nm" value="건설·채굴"><input type="hidden" name="firstJobName" id="jobName08" value="건설·채굴"></li><li><input type="checkbox" name="mainJob" title="경영·사무·금융·보험 선택. 선택시 하단의 검색결과에서 확인 가능함" onclick="f_checkJob(this,'01');f_requestJobSubList('01', 'mainJob1' , 'subJob');" value="01"><button type="button" class="choice" title="경영·사무·금융·보험에 속하는 2차분류 조회" onclick="f_requestJobSubList('01', 'mainJob1' , 'subJob');">경영·사무·금융·보험</button><input type="hidden" id="mainJob1Nm" value="경영·사무·금융·보험"><input type="hidden" name="firstJobName" id="jobName01" value="경영·사무·금융·보험"></li><li><input type="checkbox" name="mainJob" title="교육·법률·사회복지·경찰·소방 및 군인 선택. 선택시 하단의 검색결과에서 확인 가능함" onclick="f_checkJob(this,'03');f_requestJobSubList('03', 'mainJob2' , 'subJob');" value="03"><button type="button" class="choice" title="교육·법률·사회복지·경찰·소방 및 군인에 속하는 2차분류 조회" onclick="f_requestJobSubList('03', 'mainJob2' , 'subJob');">교육·법률·사회복지·경찰·소방 및 군인</button><input type="hidden" id="mainJob2Nm" value="교육·법률·사회복지·경찰·소방 및 군인"><input type="hidden" name="firstJobName" id="jobName03" value="교육·법률·사회복지·경찰·소방 및 군인"></li><li><input type="checkbox" name="mainJob" title="농림어업직 선택. 선택시 하단의 검색결과에서 확인 가능함" onclick="f_checkJob(this,'13');f_requestJobSubList('13', 'mainJob3' , 'subJob');" value="13"><button type="button" class="choice" title="농림어업직에 속하는 2차분류 조회" onclick="f_requestJobSubList('13', 'mainJob3' , 'subJob');">농림어업직</button><input type="hidden" id="mainJob3Nm" value="농림어업직"><input type="hidden" name="firstJobName" id="jobName13" value="농림어업직"></li><li><input type="checkbox" name="mainJob" title="미용·여행·숙박·음식·경비·돌봄·청소 선택. 선택시 하단의 검색결과에서 확인 가능함" onclick="f_checkJob(this,'06');f_requestJobSubList('06', 'mainJob4' , 'subJob');" value="06"><button type="button" class="choice" title="미용·여행·숙박·음식·경비·돌봄·청소에 속하는 2차분류 조회" onclick="f_requestJobSubList('06', 'mainJob4' , 'subJob');">미용·여행·숙박·음식·경비·돌봄·청소</button><input type="hidden" id="mainJob4Nm" value="미용·여행·숙박·음식·경비·돌봄·청소"><input type="hidden" name="firstJobName" id="jobName06" value="미용·여행·숙박·음식·경비·돌봄·청소"></li><li><input type="checkbox" name="mainJob" title="보건·의료 선택. 선택시 하단의 검색결과에서 확인 가능함" onclick="f_checkJob(this,'04');f_requestJobSubList('04', 'mainJob5' , 'subJob');" value="04"><button type="button" class="choice" title="보건·의료에 속하는 2차분류 조회" onclick="f_requestJobSubList('04', 'mainJob5' , 'subJob');">보건·의료</button><input type="hidden" id="mainJob5Nm" value="보건·의료"><input type="hidden" name="firstJobName" id="jobName04" value="보건·의료"></li><li><input type="checkbox" name="mainJob" title="설치·정비·생산-기계·금속·재료 선택. 선택시 하단의 검색결과에서 확인 가능함" onclick="f_checkJob(this,'09');f_requestJobSubList('09', 'mainJob6' , 'subJob');" value="09"><button type="button" class="choice" title="설치·정비·생산-기계·금속·재료에 속하는 2차분류 조회" onclick="f_requestJobSubList('09', 'mainJob6' , 'subJob');">설치·정비·생산-기계·금속·재료</button><input type="hidden" id="mainJob6Nm" value="설치·정비·생산-기계·금속·재료"><input type="hidden" name="firstJobName" id="jobName09" value="설치·정비·생산-기계·금속·재료"></li><li><input type="checkbox" name="mainJob" title="설치·정비·생산-인쇄·목재·공예 및 제조 단순 선택. 선택시 하단의 검색결과에서 확인 가능함" onclick="f_checkJob(this,'12');f_requestJobSubList('12', 'mainJob7' , 'subJob');" value="12"><button type="button" class="choice" title="설치·정비·생산-인쇄·목재·공예 및 제조 단순에 속하는 2차분류 조회" onclick="f_requestJobSubList('12', 'mainJob7' , 'subJob');">설치·정비·생산-인쇄·목재·공예 및 제조 단순</button><input type="hidden" id="mainJob7Nm" value="설치·정비·생산-인쇄·목재·공예 및 제조 단순"><input type="hidden" name="firstJobName" id="jobName12" value="설치·정비·생산-인쇄·목재·공예 및 제조 단순"></li><li><input type="checkbox" name="mainJob" title="설치·정비·생산-전기·전자·정보통신 선택. 선택시 하단의 검색결과에서 확인 가능함" onclick="f_checkJob(this,'10');f_requestJobSubList('10', 'mainJob8' , 'subJob');" value="10"><button type="button" class="choice" title="설치·정비·생산-전기·전자·정보통신에 속하는 2차분류 조회" onclick="f_requestJobSubList('10', 'mainJob8' , 'subJob');">설치·정비·생산-전기·전자·정보통신</button><input type="hidden" id="mainJob8Nm" value="설치·정비·생산-전기·전자·정보통신"><input type="hidden" name="firstJobName" id="jobName10" value="설치·정비·생산-전기·전자·정보통신"></li><li><input type="checkbox" name="mainJob" title="설치·정비·생산-화학·환경·섬유·의복·식품가공 선택. 선택시 하단의 검색결과에서 확인 가능함" onclick="f_checkJob(this,'11');f_requestJobSubList('11', 'mainJob9' , 'subJob');" value="11"><button type="button" class="choice" title="설치·정비·생산-화학·환경·섬유·의복·식품가공에 속하는 2차분류 조회" onclick="f_requestJobSubList('11', 'mainJob9' , 'subJob');">설치·정비·생산-화학·환경·섬유·의복·식품가공</button><input type="hidden" id="mainJob9Nm" value="설치·정비·생산-화학·환경·섬유·의복·식품가공"><input type="hidden" name="firstJobName" id="jobName11" value="설치·정비·생산-화학·환경·섬유·의복·식품가공"></li><li><input type="checkbox" name="mainJob" title="연구 및 공학기술 선택. 선택시 하단의 검색결과에서 확인 가능함" onclick="f_checkJob(this,'02');f_requestJobSubList('02', 'mainJob10' , 'subJob');" value="02"><button type="button" class="choice" title="연구 및 공학기술에 속하는 2차분류 조회" onclick="f_requestJobSubList('02', 'mainJob10' , 'subJob');">연구 및 공학기술</button><input type="hidden" id="mainJob10Nm" value="연구 및 공학기술"><input type="hidden" name="firstJobName" id="jobName02" value="연구 및 공학기술"></li><li><input type="checkbox" name="mainJob" title="영업·판매·운전·운송 선택. 선택시 하단의 검색결과에서 확인 가능함" onclick="f_checkJob(this,'07');f_requestJobSubList('07', 'mainJob11' , 'subJob');" value="07"><button type="button" class="choice" title="영업·판매·운전·운송에 속하는 2차분류 조회" onclick="f_requestJobSubList('07', 'mainJob11' , 'subJob');">영업·판매·운전·운송</button><input type="hidden" id="mainJob11Nm" value="영업·판매·운전·운송"><input type="hidden" name="firstJobName" id="jobName07" value="영업·판매·운전·운송"></li><li><input type="checkbox" name="mainJob" title="예술·디자인·방송·스포츠 선택. 선택시 하단의 검색결과에서 확인 가능함" onclick="f_checkJob(this,'05');f_requestJobSubList('05', 'mainJob12' , 'subJob');" value="05"><button type="button" class="choice" title="예술·디자인·방송·스포츠에 속하는 2차분류 조회" onclick="f_requestJobSubList('05', 'mainJob12' , 'subJob');">예술·디자인·방송·스포츠</button><input type="hidden" id="mainJob12Nm" value="예술·디자인·방송·스포츠"><input type="hidden" name="firstJobName" id="jobName05" value="예술·디자인·방송·스포츠"></li></ul></div>
										<div class="cate" id="subJobDiv"><p class="tit bg02">2차분류</p> <p class="txt">1차 분류를 선택하세요</p></div>
										<div class="cate" id="thirdJobDiv"><p class="tit bg03">3차분류</p> <p class="txt">2차 분류를 선택하세요</p></div>
									</div>

									<!--// 카테고리 선택 -->

									<!-- 검색결과 레이어 -->
									<!--
										display : none,
										display : block 처리
									 -->
									<div class="job-kind-search" style="display:none;" id="txtSearchResult">
									<div class="scroll">
										<p class="txt"><span class="word" id="searchResultKeyword">영업</span>으로 검색한 직종 결과입니다. (직종 <span id="count1">0</span>건, 전체 채용정보 : <span class="font-blue2" id="count2">0</span>건)</p>

										<ul class="dot-list v1">
											<li>검색된 직종 정보가 없습니다.</li>
										</ul>
									</div>

									<!--
										js 이벤트 있음
									 -->
									<!-- 2018-11-02 삭제 및 변경 -->
									<!--
										 <button type="button" class="btn-close-search-word">검색어 레이어 닫기</button>
									-->
									<p class="txt">※ 분류 리스트로 검색하려면 [분류별보기] 버튼을 클릭하세요. <button type="button" id="focusBtn" class="button small btn-close-search-word" onclick="f_requestJobSubList('','','mainJob');">분류별보기</button></p>
									<!--// 2018-11-02 삭제 및 변경 -->
									<!--// 검색결과 레이어 -->
								</div>
								</div>
								<button type="button" class="btn-close-block" onclick="closeJobCategory();">직종선택 닫기</button>
							</div>
					</div>
					<!--// layer-group -->
				</td>
			</tr>

			<tr>
				<th scope="row">
					<span class="label">지역</span>
				</th>
				<td colspan="3">
					<!-- layer-group -->
					<div class="layer-group">
						<!--
							a 태그의 #값 과 해당 레이어의 id 가 일치 해야 함.
						 -->
						<div class="btn-block">
							<a href="#jobCatelocation01" id="jobCatelocation01Open" class="button btn-open-block on" title="선택됨">지역별</a>
							<a href="#jobCatelocation02" id="jobCatelocation02Open" class="button btn-open-block">역세권별</a>
							<!-- <a href="#jobCatelocation03" id="jobCatelocation03Open" class="button btn-open-block">산업단지별</a> -->
						</div>

						<div id="jobCatelocation01" class="layer-block" style="display: block;">
								<div class="careers-location-select">
									<!-- 2018-11-02 지역찾기 완전 수정 : 채용 홈하고 거의 동일 -->
									<div class="area-choice-new">

										<p class="txt">최대 20개의 지역 선택이 가능합니다.</p>

										<!-- local-area -->
										<div class="local-area">
											<div class="local">
												<ul class="list">
													<li class="full" id="regionOn_00000"><button type="button" class="btn" onclick="f_requestRegionSubList('00000');">전체</button>
													
													     
													
													     
											 				</li><li id="regionOn_11000"><button type="button" class="btn" onclick="f_requestRegionSubList('11000');">서울</button></li>
											 			
													
													     
											 				<li id="regionOn_26000"><button type="button" class="btn" onclick="f_requestRegionSubList('26000');">부산</button></li>
											 			
													
													     
											 				<li id="regionOn_27000"><button type="button" class="btn" onclick="f_requestRegionSubList('27000');">대구</button></li>
											 			
													
													     
											 				<li id="regionOn_28000"><button type="button" class="btn" onclick="f_requestRegionSubList('28000');">인천</button></li>
											 			
													
													     
											 				<li id="regionOn_29000"><button type="button" class="btn" onclick="f_requestRegionSubList('29000');">광주</button></li>
											 			
													
													     
											 				<li id="regionOn_30000"><button type="button" class="btn" onclick="f_requestRegionSubList('30000');">대전</button></li>
											 			
													
													     
											 				<li id="regionOn_31000"><button type="button" class="btn" onclick="f_requestRegionSubList('31000');">울산</button></li>
											 			
													
													     
											 				<li id="regionOn_36110"><button type="button" class="btn" onclick="f_requestRegionSubList('36110');">세종</button></li>
											 			
													
													     
											 				<li id="regionOn_41000"><button type="button" class="btn" onclick="f_requestRegionSubList('41000');">경기</button></li>
											 			
													
													     
											 				<li id="regionOn_42000"><button type="button" class="btn" onclick="f_requestRegionSubList('42000');">강원</button></li>
											 			
													
													     
											 				<li id="regionOn_43000"><button type="button" class="btn" onclick="f_requestRegionSubList('43000');">충북</button></li>
											 			
													
													     
											 				<li id="regionOn_44000"><button type="button" class="btn" onclick="f_requestRegionSubList('44000');">충남</button></li>
											 			
													
													     
											 				<li id="regionOn_45000"><button type="button" class="btn" onclick="f_requestRegionSubList('45000');">전북</button></li>
											 			
													
													     
											 				<li id="regionOn_46000"><button type="button" class="btn" onclick="f_requestRegionSubList('46000');">전남</button></li>
											 			
													
													     
											 				<li id="regionOn_47000"><button type="button" class="btn" onclick="f_requestRegionSubList('47000');">경북</button></li>
											 			
													
													     
											 				<li id="regionOn_48000"><button type="button" class="btn" onclick="f_requestRegionSubList('48000');">경남</button></li>
											 			
													
													     
											 				<li id="regionOn_50000"><button type="button" class="btn" onclick="f_requestRegionSubList('50000');">제주</button></li>
											 			
													
												</ul>
											</div>

											<div class="area" id="regionSubDiv">
												<ul class="list">

												</ul>
											</div>
										</div>
										<!--// local-area -->
									</div>
									<!--// 2018-11-02 지역찾기 완전 수정 : 채용 홈하고 거의 동일 -->
								</div>
							<button type="button" class="btn-close-block">지역선택 닫기</button>
						</div>

						<div id="jobCatelocation02" class="layer-block">
							<div class="careers-station-select">
								<div class="station-select">
									<div class="select-box medium" data-list-name="지역">
										<button type="button" class="btn" title="지역 선택목록 열기">
											
												
												
													수도권
												
											
										</button>
										<ul class="list">
										
											<li>
											   <button type="button" id="area11000" title="수도권 선택" onclick="fnRequestStaAreaCodeList1('11000', 'BTN');">
											   수도권
											   </button>
											</li>
										
											<li>
											   <button type="button" id="area26000" title="부산 선택" onclick="fnRequestStaAreaCodeList1('26000', 'BTN');">
											   부산
											   </button>
											</li>
										
											<li>
											   <button type="button" id="area27000" title="대구 선택" onclick="fnRequestStaAreaCodeList1('27000', 'BTN');">
											   대구
											   </button>
											</li>
										
											<li>
											   <button type="button" id="area28000" title="인천 선택" onclick="fnRequestStaAreaCodeList1('28000', 'BTN');">
											   인천
											   </button>
											</li>
										
											<li>
											   <button type="button" id="area29000" title="광주 선택" onclick="fnRequestStaAreaCodeList1('29000', 'BTN');">
											   광주
											   </button>
											</li>
										
											<li>
											   <button type="button" id="area30000" title="대전 선택" onclick="fnRequestStaAreaCodeList1('30000', 'BTN');">
											   대전
											   </button>
											</li>
										
										</ul>
									</div>

									<div class="select-box medium" data-list-name="호선">
										<button type="button" class="btn" id="staAreaDepthNm" title="호선 선택목록 열기">1호선</button>
										<ul class="list" id="staAreaListTwo">

										
	<li id="listStaArea_1">
		<button type="button" id="area_1" onclick="fnRequestStaAreaCodeList2('1')" title="1호선 선택">1호선</button>
	</li>

	<li id="listStaArea_2">
		<button type="button" id="area_2" onclick="fnRequestStaAreaCodeList2('2')" title="2호선 선택">2호선</button>
	</li>

	<li id="listStaArea_3">
		<button type="button" id="area_3" onclick="fnRequestStaAreaCodeList2('3')" title="3호선 선택">3호선</button>
	</li>

	<li id="listStaArea_4">
		<button type="button" id="area_4" onclick="fnRequestStaAreaCodeList2('4')" title="4호선 선택">4호선</button>
	</li>

	<li id="listStaArea_5">
		<button type="button" id="area_5" onclick="fnRequestStaAreaCodeList2('5')" title="5호선 선택">5호선</button>
	</li>

	<li id="listStaArea_6">
		<button type="button" id="area_6" onclick="fnRequestStaAreaCodeList2('6')" title="6호선 선택">6호선</button>
	</li>

	<li id="listStaArea_7">
		<button type="button" id="area_7" onclick="fnRequestStaAreaCodeList2('7')" title="7호선 선택">7호선</button>
	</li>

	<li id="listStaArea_8">
		<button type="button" id="area_8" onclick="fnRequestStaAreaCodeList2('8')" title="8호선 선택">8호선</button>
	</li>

	<li id="listStaArea_9">
		<button type="button" id="area_9" onclick="fnRequestStaAreaCodeList2('9')" title="9호선 선택">9호선</button>
	</li>

	<li id="listStaArea_13">
		<button type="button" id="area_13" onclick="fnRequestStaAreaCodeList2('13')" title="경강 선택">경강</button>
	</li>

	<li id="listStaArea_11">
		<button type="button" id="area_11" onclick="fnRequestStaAreaCodeList2('11')" title="경의중앙선 선택">경의중앙선</button>
	</li>

	<li id="listStaArea_12">
		<button type="button" id="area_12" onclick="fnRequestStaAreaCodeList2('12')" title="경춘선 선택">경춘선</button>
	</li>

	<li id="listStaArea_21">
		<button type="button" id="area_21" onclick="fnRequestStaAreaCodeList2('21')" title="공항철도 선택">공항철도</button>
	</li>

	<li id="listStaArea_16">
		<button type="button" id="area_16" onclick="fnRequestStaAreaCodeList2('16')" title="김포골드라인 선택">김포골드라인</button>
	</li>

	<li id="listStaArea_31">
		<button type="button" id="area_31" onclick="fnRequestStaAreaCodeList2('31')" title="분당선 선택">분당선</button>
	</li>

	<li id="listStaArea_15">
		<button type="button" id="area_15" onclick="fnRequestStaAreaCodeList2('15')" title="서해선 선택">서해선</button>
	</li>

	<li id="listStaArea_61">
		<button type="button" id="area_61" onclick="fnRequestStaAreaCodeList2('61')" title="수인선 선택">수인선</button>
	</li>

	<li id="listStaArea_17">
		<button type="button" id="area_17" onclick="fnRequestStaAreaCodeList2('17')" title="신림선 선택">신림선</button>
	</li>

	<li id="listStaArea_51">
		<button type="button" id="area_51" onclick="fnRequestStaAreaCodeList2('51')" title="신분당선 선택">신분당선</button>
	</li>

	<li id="listStaArea_81">
		<button type="button" id="area_81" onclick="fnRequestStaAreaCodeList2('81')" title="에버라인 선택">에버라인</button>
	</li>

	<li id="listStaArea_14">
		<button type="button" id="area_14" onclick="fnRequestStaAreaCodeList2('14')" title="우이신설 선택">우이신설</button>
	</li>

	<li id="listStaArea_71">
		<button type="button" id="area_71" onclick="fnRequestStaAreaCodeList2('71')" title="의정부경전철 선택">의정부경전철</button>
	</li>

	<li id="listStaArea_91">
		<button type="button" id="area_91" onclick="fnRequestStaAreaCodeList2('91')" title="자기부상 선택">자기부상</button>
	</li>
</ul>
									</div>
								</div>

								<div class="result-staticn">
									<div class="label-wrap line-5" id="checkSubwayList">

									
<span id="listCheckSubWay_ALL">
	<input type="checkbox" id="checkSubwayALL" name="checkSubway" onclick="f_checkStaArea(this, '전체');" value="11000-1">
	<label for="checkSubwayALL">전체</label>
</span>

<span id="listCheckSubWay_1">
	<input type="checkbox" id="checkSubway1" name="checkSubway" onclick="f_checkStaArea(this, '가능');" value="11000-1-1">
	<label for="checkSubway1">가능</label>
</span>

<span id="listCheckSubWay_2">
	<input type="checkbox" id="checkSubway2" name="checkSubway" onclick="f_checkStaArea(this, '가산디지털단지');" value="11000-1-2">
	<label for="checkSubway2">가산디지털단지</label>
</span>

<span id="listCheckSubWay_3">
	<input type="checkbox" id="checkSubway3" name="checkSubway" onclick="f_checkStaArea(this, '간석');" value="11000-1-3">
	<label for="checkSubway3">간석</label>
</span>

<span id="listCheckSubWay_4">
	<input type="checkbox" id="checkSubway4" name="checkSubway" onclick="f_checkStaArea(this, '개봉');" value="11000-1-4">
	<label for="checkSubway4">개봉</label>
</span>

<span id="listCheckSubWay_5">
	<input type="checkbox" id="checkSubway5" name="checkSubway" onclick="f_checkStaArea(this, '관악');" value="11000-1-5">
	<label for="checkSubway5">관악</label>
</span>

<span id="listCheckSubWay_6">
	<input type="checkbox" id="checkSubway6" name="checkSubway" onclick="f_checkStaArea(this, '광명');" value="11000-1-6">
	<label for="checkSubway6">광명</label>
</span>

<span id="listCheckSubWay_44">
	<input type="checkbox" id="checkSubway44" name="checkSubway" onclick="f_checkStaArea(this, '광운대');" value="11000-1-44">
	<label for="checkSubway44">광운대</label>
</span>

<span id="listCheckSubWay_7">
	<input type="checkbox" id="checkSubway7" name="checkSubway" onclick="f_checkStaArea(this, '구로');" value="11000-1-7">
	<label for="checkSubway7">구로</label>
</span>

<span id="listCheckSubWay_8">
	<input type="checkbox" id="checkSubway8" name="checkSubway" onclick="f_checkStaArea(this, '구일');" value="11000-1-8">
	<label for="checkSubway8">구일</label>
</span>

<span id="listCheckSubWay_9">
	<input type="checkbox" id="checkSubway9" name="checkSubway" onclick="f_checkStaArea(this, '군포');" value="11000-1-9">
	<label for="checkSubway9">군포</label>
</span>

<span id="listCheckSubWay_10">
	<input type="checkbox" id="checkSubway10" name="checkSubway" onclick="f_checkStaArea(this, '금정');" value="11000-1-10">
	<label for="checkSubway10">금정</label>
</span>

<span id="listCheckSubWay_54">
	<input type="checkbox" id="checkSubway54" name="checkSubway" onclick="f_checkStaArea(this, '금천구청');" value="11000-1-54">
	<label for="checkSubway54">금천구청</label>
</span>

<span id="listCheckSubWay_11">
	<input type="checkbox" id="checkSubway11" name="checkSubway" onclick="f_checkStaArea(this, '남영');" value="11000-1-11">
	<label for="checkSubway11">남영</label>
</span>

<span id="listCheckSubWay_12">
	<input type="checkbox" id="checkSubway12" name="checkSubway" onclick="f_checkStaArea(this, '노량진');" value="11000-1-12">
	<label for="checkSubway12">노량진</label>
</span>

<span id="listCheckSubWay_13">
	<input type="checkbox" id="checkSubway13" name="checkSubway" onclick="f_checkStaArea(this, '녹양');" value="11000-1-13">
	<label for="checkSubway13">녹양</label>
</span>

<span id="listCheckSubWay_14">
	<input type="checkbox" id="checkSubway14" name="checkSubway" onclick="f_checkStaArea(this, '녹천');" value="11000-1-14">
	<label for="checkSubway14">녹천</label>
</span>

<span id="listCheckSubWay_98">
	<input type="checkbox" id="checkSubway98" name="checkSubway" onclick="f_checkStaArea(this, '당정');" value="11000-1-98">
	<label for="checkSubway98">당정</label>
</span>

<span id="listCheckSubWay_15">
	<input type="checkbox" id="checkSubway15" name="checkSubway" onclick="f_checkStaArea(this, '대방');" value="11000-1-15">
	<label for="checkSubway15">대방</label>
</span>

<span id="listCheckSubWay_16">
	<input type="checkbox" id="checkSubway16" name="checkSubway" onclick="f_checkStaArea(this, '덕계');" value="11000-1-16">
	<label for="checkSubway16">덕계</label>
</span>

<span id="listCheckSubWay_17">
	<input type="checkbox" id="checkSubway17" name="checkSubway" onclick="f_checkStaArea(this, '덕정');" value="11000-1-17">
	<label for="checkSubway17">덕정</label>
</span>

<span id="listCheckSubWay_18">
	<input type="checkbox" id="checkSubway18" name="checkSubway" onclick="f_checkStaArea(this, '도봉');" value="11000-1-18">
	<label for="checkSubway18">도봉</label>
</span>

<span id="listCheckSubWay_19">
	<input type="checkbox" id="checkSubway19" name="checkSubway" onclick="f_checkStaArea(this, '도봉산');" value="11000-1-19">
	<label for="checkSubway19">도봉산</label>
</span>

<span id="listCheckSubWay_20">
	<input type="checkbox" id="checkSubway20" name="checkSubway" onclick="f_checkStaArea(this, '도원');" value="11000-1-20">
	<label for="checkSubway20">도원</label>
</span>

<span id="listCheckSubWay_21">
	<input type="checkbox" id="checkSubway21" name="checkSubway" onclick="f_checkStaArea(this, '도화');" value="11000-1-21">
	<label for="checkSubway21">도화</label>
</span>

<span id="listCheckSubWay_22">
	<input type="checkbox" id="checkSubway22" name="checkSubway" onclick="f_checkStaArea(this, '독산');" value="11000-1-22">
	<label for="checkSubway22">독산</label>
</span>

<span id="listCheckSubWay_23">
	<input type="checkbox" id="checkSubway23" name="checkSubway" onclick="f_checkStaArea(this, '동대문');" value="11000-1-23">
	<label for="checkSubway23">동대문</label>
</span>

<span id="listCheckSubWay_24">
	<input type="checkbox" id="checkSubway24" name="checkSubway" onclick="f_checkStaArea(this, '동두천');" value="11000-1-24">
	<label for="checkSubway24">동두천</label>
</span>

<span id="listCheckSubWay_25">
	<input type="checkbox" id="checkSubway25" name="checkSubway" onclick="f_checkStaArea(this, '동두천중앙');" value="11000-1-25">
	<label for="checkSubway25">동두천중앙</label>
</span>

<span id="listCheckSubWay_26">
	<input type="checkbox" id="checkSubway26" name="checkSubway" onclick="f_checkStaArea(this, '동묘앞');" value="11000-1-26">
	<label for="checkSubway26">동묘앞</label>
</span>

<span id="listCheckSubWay_27">
	<input type="checkbox" id="checkSubway27" name="checkSubway" onclick="f_checkStaArea(this, '동암');" value="11000-1-27">
	<label for="checkSubway27">동암</label>
</span>

<span id="listCheckSubWay_28">
	<input type="checkbox" id="checkSubway28" name="checkSubway" onclick="f_checkStaArea(this, '동인천');" value="11000-1-28">
	<label for="checkSubway28">동인천</label>
</span>

<span id="listCheckSubWay_29">
	<input type="checkbox" id="checkSubway29" name="checkSubway" onclick="f_checkStaArea(this, '두정');" value="11000-1-29">
	<label for="checkSubway29">두정</label>
</span>

<span id="listCheckSubWay_30">
	<input type="checkbox" id="checkSubway30" name="checkSubway" onclick="f_checkStaArea(this, '망월사');" value="11000-1-30">
	<label for="checkSubway30">망월사</label>
</span>

<span id="listCheckSubWay_31">
	<input type="checkbox" id="checkSubway31" name="checkSubway" onclick="f_checkStaArea(this, '명학');" value="11000-1-31">
	<label for="checkSubway31">명학</label>
</span>

<span id="listCheckSubWay_32">
	<input type="checkbox" id="checkSubway32" name="checkSubway" onclick="f_checkStaArea(this, '방학');" value="11000-1-32">
	<label for="checkSubway32">방학</label>
</span>

<span id="listCheckSubWay_95">
	<input type="checkbox" id="checkSubway95" name="checkSubway" onclick="f_checkStaArea(this, '배방');" value="11000-1-95">
	<label for="checkSubway95">배방</label>
</span>

<span id="listCheckSubWay_33">
	<input type="checkbox" id="checkSubway33" name="checkSubway" onclick="f_checkStaArea(this, '백운');" value="11000-1-33">
	<label for="checkSubway33">백운</label>
</span>

<span id="listCheckSubWay_34">
	<input type="checkbox" id="checkSubway34" name="checkSubway" onclick="f_checkStaArea(this, '병점');" value="11000-1-34">
	<label for="checkSubway34">병점</label>
</span>

<span id="listCheckSubWay_35">
	<input type="checkbox" id="checkSubway35" name="checkSubway" onclick="f_checkStaArea(this, '보산');" value="11000-1-35">
	<label for="checkSubway35">보산</label>
</span>

<span id="listCheckSubWay_97">
	<input type="checkbox" id="checkSubway97" name="checkSubway" onclick="f_checkStaArea(this, '봉명');" value="11000-1-97">
	<label for="checkSubway97">봉명</label>
</span>

<span id="listCheckSubWay_36">
	<input type="checkbox" id="checkSubway36" name="checkSubway" onclick="f_checkStaArea(this, '부개');" value="11000-1-36">
	<label for="checkSubway36">부개</label>
</span>

<span id="listCheckSubWay_37">
	<input type="checkbox" id="checkSubway37" name="checkSubway" onclick="f_checkStaArea(this, '부천');" value="11000-1-37">
	<label for="checkSubway37">부천</label>
</span>

<span id="listCheckSubWay_38">
	<input type="checkbox" id="checkSubway38" name="checkSubway" onclick="f_checkStaArea(this, '부평');" value="11000-1-38">
	<label for="checkSubway38">부평</label>
</span>

<span id="listCheckSubWay_96">
	<input type="checkbox" id="checkSubway96" name="checkSubway" onclick="f_checkStaArea(this, '서동탄');" value="11000-1-96">
	<label for="checkSubway96">서동탄</label>
</span>

<span id="listCheckSubWay_39">
	<input type="checkbox" id="checkSubway39" name="checkSubway" onclick="f_checkStaArea(this, '서울역');" value="11000-1-39">
	<label for="checkSubway39">서울역</label>
</span>

<span id="listCheckSubWay_40">
	<input type="checkbox" id="checkSubway40" name="checkSubway" onclick="f_checkStaArea(this, '서정리');" value="11000-1-40">
	<label for="checkSubway40">서정리</label>
</span>

<span id="listCheckSubWay_41">
	<input type="checkbox" id="checkSubway41" name="checkSubway" onclick="f_checkStaArea(this, '석계');" value="11000-1-41">
	<label for="checkSubway41">석계</label>
</span>

<span id="listCheckSubWay_42">
	<input type="checkbox" id="checkSubway42" name="checkSubway" onclick="f_checkStaArea(this, '석수');" value="11000-1-42">
	<label for="checkSubway42">석수</label>
</span>

<span id="listCheckSubWay_43">
	<input type="checkbox" id="checkSubway43" name="checkSubway" onclick="f_checkStaArea(this, '성균관대');" value="11000-1-43">
	<label for="checkSubway43">성균관대</label>
</span>

<span id="listCheckSubWay_45">
	<input type="checkbox" id="checkSubway45" name="checkSubway" onclick="f_checkStaArea(this, '성환');" value="11000-1-45">
	<label for="checkSubway45">성환</label>
</span>

<span id="listCheckSubWay_46">
	<input type="checkbox" id="checkSubway46" name="checkSubway" onclick="f_checkStaArea(this, '세류');" value="11000-1-46">
	<label for="checkSubway46">세류</label>
</span>

<span id="listCheckSubWay_47">
	<input type="checkbox" id="checkSubway47" name="checkSubway" onclick="f_checkStaArea(this, '세마');" value="11000-1-47">
	<label for="checkSubway47">세마</label>
</span>

<span id="listCheckSubWay_48">
	<input type="checkbox" id="checkSubway48" name="checkSubway" onclick="f_checkStaArea(this, '소사');" value="11000-1-48">
	<label for="checkSubway48">소사</label>
</span>

<span id="listCheckSubWay_49">
	<input type="checkbox" id="checkSubway49" name="checkSubway" onclick="f_checkStaArea(this, '소요산');" value="11000-1-49">
	<label for="checkSubway49">소요산</label>
</span>

<span id="listCheckSubWay_50">
	<input type="checkbox" id="checkSubway50" name="checkSubway" onclick="f_checkStaArea(this, '송내');" value="11000-1-50">
	<label for="checkSubway50">송내</label>
</span>

<span id="listCheckSubWay_51">
	<input type="checkbox" id="checkSubway51" name="checkSubway" onclick="f_checkStaArea(this, '송탄');" value="11000-1-51">
	<label for="checkSubway51">송탄</label>
</span>

<span id="listCheckSubWay_52">
	<input type="checkbox" id="checkSubway52" name="checkSubway" onclick="f_checkStaArea(this, '수원');" value="11000-1-52">
	<label for="checkSubway52">수원</label>
</span>

<span id="listCheckSubWay_53">
	<input type="checkbox" id="checkSubway53" name="checkSubway" onclick="f_checkStaArea(this, '시청');" value="11000-1-53">
	<label for="checkSubway53">시청</label>
</span>

<span id="listCheckSubWay_55">
	<input type="checkbox" id="checkSubway55" name="checkSubway" onclick="f_checkStaArea(this, '신길');" value="11000-1-55">
	<label for="checkSubway55">신길</label>
</span>

<span id="listCheckSubWay_56">
	<input type="checkbox" id="checkSubway56" name="checkSubway" onclick="f_checkStaArea(this, '신도림');" value="11000-1-56">
	<label for="checkSubway56">신도림</label>
</span>

<span id="listCheckSubWay_57">
	<input type="checkbox" id="checkSubway57" name="checkSubway" onclick="f_checkStaArea(this, '신설동');" value="11000-1-57">
	<label for="checkSubway57">신설동</label>
</span>

<span id="listCheckSubWay_58">
	<input type="checkbox" id="checkSubway58" name="checkSubway" onclick="f_checkStaArea(this, '신이문');" value="11000-1-58">
	<label for="checkSubway58">신이문</label>
</span>

<span id="listCheckSubWay_92">
	<input type="checkbox" id="checkSubway92" name="checkSubway" onclick="f_checkStaArea(this, '신창(순천향대)');" value="11000-1-92">
	<label for="checkSubway92">신창(순천향대)</label>
</span>

<span id="listCheckSubWay_93">
	<input type="checkbox" id="checkSubway93" name="checkSubway" onclick="f_checkStaArea(this, '쌍용(나사렛대)');" value="11000-1-93">
	<label for="checkSubway93">쌍용(나사렛대)</label>
</span>

<span id="listCheckSubWay_94">
	<input type="checkbox" id="checkSubway94" name="checkSubway" onclick="f_checkStaArea(this, '아산');" value="11000-1-94">
	<label for="checkSubway94">아산</label>
</span>

<span id="listCheckSubWay_59">
	<input type="checkbox" id="checkSubway59" name="checkSubway" onclick="f_checkStaArea(this, '안양');" value="11000-1-59">
	<label for="checkSubway59">안양</label>
</span>

<span id="listCheckSubWay_60">
	<input type="checkbox" id="checkSubway60" name="checkSubway" onclick="f_checkStaArea(this, '양주');" value="11000-1-60">
	<label for="checkSubway60">양주</label>
</span>

<span id="listCheckSubWay_61">
	<input type="checkbox" id="checkSubway61" name="checkSubway" onclick="f_checkStaArea(this, '역곡');" value="11000-1-61">
	<label for="checkSubway61">역곡</label>
</span>

<span id="listCheckSubWay_62">
	<input type="checkbox" id="checkSubway62" name="checkSubway" onclick="f_checkStaArea(this, '영등포');" value="11000-1-62">
	<label for="checkSubway62">영등포</label>
</span>

<span id="listCheckSubWay_63">
	<input type="checkbox" id="checkSubway63" name="checkSubway" onclick="f_checkStaArea(this, '오류동');" value="11000-1-63">
	<label for="checkSubway63">오류동</label>
</span>

<span id="listCheckSubWay_64">
	<input type="checkbox" id="checkSubway64" name="checkSubway" onclick="f_checkStaArea(this, '오산');" value="11000-1-64">
	<label for="checkSubway64">오산</label>
</span>

<span id="listCheckSubWay_65">
	<input type="checkbox" id="checkSubway65" name="checkSubway" onclick="f_checkStaArea(this, '오산대');" value="11000-1-65">
	<label for="checkSubway65">오산대</label>
</span>

<span id="listCheckSubWay_66">
	<input type="checkbox" id="checkSubway66" name="checkSubway" onclick="f_checkStaArea(this, '온수');" value="11000-1-66">
	<label for="checkSubway66">온수</label>
</span>

<span id="listCheckSubWay_91">
	<input type="checkbox" id="checkSubway91" name="checkSubway" onclick="f_checkStaArea(this, '온양온천');" value="11000-1-91">
	<label for="checkSubway91">온양온천</label>
</span>

<span id="listCheckSubWay_67">
	<input type="checkbox" id="checkSubway67" name="checkSubway" onclick="f_checkStaArea(this, '외대앞');" value="11000-1-67">
	<label for="checkSubway67">외대앞</label>
</span>

<span id="listCheckSubWay_68">
	<input type="checkbox" id="checkSubway68" name="checkSubway" onclick="f_checkStaArea(this, '용산');" value="11000-1-68">
	<label for="checkSubway68">용산</label>
</span>

<span id="listCheckSubWay_69">
	<input type="checkbox" id="checkSubway69" name="checkSubway" onclick="f_checkStaArea(this, '월계');" value="11000-1-69">
	<label for="checkSubway69">월계</label>
</span>

<span id="listCheckSubWay_70">
	<input type="checkbox" id="checkSubway70" name="checkSubway" onclick="f_checkStaArea(this, '의왕');" value="11000-1-70">
	<label for="checkSubway70">의왕</label>
</span>

<span id="listCheckSubWay_71">
	<input type="checkbox" id="checkSubway71" name="checkSubway" onclick="f_checkStaArea(this, '의정부');" value="11000-1-71">
	<label for="checkSubway71">의정부</label>
</span>

<span id="listCheckSubWay_72">
	<input type="checkbox" id="checkSubway72" name="checkSubway" onclick="f_checkStaArea(this, '인천');" value="11000-1-72">
	<label for="checkSubway72">인천</label>
</span>

<span id="listCheckSubWay_73">
	<input type="checkbox" id="checkSubway73" name="checkSubway" onclick="f_checkStaArea(this, '제기동');" value="11000-1-73">
	<label for="checkSubway73">제기동</label>
</span>

<span id="listCheckSubWay_74">
	<input type="checkbox" id="checkSubway74" name="checkSubway" onclick="f_checkStaArea(this, '제물포');" value="11000-1-74">
	<label for="checkSubway74">제물포</label>
</span>

<span id="listCheckSubWay_75">
	<input type="checkbox" id="checkSubway75" name="checkSubway" onclick="f_checkStaArea(this, '종각');" value="11000-1-75">
	<label for="checkSubway75">종각</label>
</span>

<span id="listCheckSubWay_76">
	<input type="checkbox" id="checkSubway76" name="checkSubway" onclick="f_checkStaArea(this, '종로3가');" value="11000-1-76">
	<label for="checkSubway76">종로3가</label>
</span>

<span id="listCheckSubWay_77">
	<input type="checkbox" id="checkSubway77" name="checkSubway" onclick="f_checkStaArea(this, '종로5가');" value="11000-1-77">
	<label for="checkSubway77">종로5가</label>
</span>

<span id="listCheckSubWay_78">
	<input type="checkbox" id="checkSubway78" name="checkSubway" onclick="f_checkStaArea(this, '주안');" value="11000-1-78">
	<label for="checkSubway78">주안</label>
</span>

<span id="listCheckSubWay_79">
	<input type="checkbox" id="checkSubway79" name="checkSubway" onclick="f_checkStaArea(this, '중동');" value="11000-1-79">
	<label for="checkSubway79">중동</label>
</span>

<span id="listCheckSubWay_80">
	<input type="checkbox" id="checkSubway80" name="checkSubway" onclick="f_checkStaArea(this, '지제');" value="11000-1-80">
	<label for="checkSubway80">지제</label>
</span>

<span id="listCheckSubWay_81">
	<input type="checkbox" id="checkSubway81" name="checkSubway" onclick="f_checkStaArea(this, '지행');" value="11000-1-81">
	<label for="checkSubway81">지행</label>
</span>

<span id="listCheckSubWay_82">
	<input type="checkbox" id="checkSubway82" name="checkSubway" onclick="f_checkStaArea(this, '직산');" value="11000-1-82">
	<label for="checkSubway82">직산</label>
</span>

<span id="listCheckSubWay_83">
	<input type="checkbox" id="checkSubway83" name="checkSubway" onclick="f_checkStaArea(this, '진위');" value="11000-1-83">
	<label for="checkSubway83">진위</label>
</span>

<span id="listCheckSubWay_84">
	<input type="checkbox" id="checkSubway84" name="checkSubway" onclick="f_checkStaArea(this, '창동');" value="11000-1-84">
	<label for="checkSubway84">창동</label>
</span>

<span id="listCheckSubWay_85">
	<input type="checkbox" id="checkSubway85" name="checkSubway" onclick="f_checkStaArea(this, '천안');" value="11000-1-85">
	<label for="checkSubway85">천안</label>
</span>

<span id="listCheckSubWay_86">
	<input type="checkbox" id="checkSubway86" name="checkSubway" onclick="f_checkStaArea(this, '청량리');" value="11000-1-86">
	<label for="checkSubway86">청량리</label>
</span>

<span id="listCheckSubWay_87">
	<input type="checkbox" id="checkSubway87" name="checkSubway" onclick="f_checkStaArea(this, '평택');" value="11000-1-87">
	<label for="checkSubway87">평택</label>
</span>

<span id="listCheckSubWay_88">
	<input type="checkbox" id="checkSubway88" name="checkSubway" onclick="f_checkStaArea(this, '화서');" value="11000-1-88">
	<label for="checkSubway88">화서</label>
</span>

<span id="listCheckSubWay_89">
	<input type="checkbox" id="checkSubway89" name="checkSubway" onclick="f_checkStaArea(this, '회기');" value="11000-1-89">
	<label for="checkSubway89">회기</label>
</span>

<span id="listCheckSubWay_90">
	<input type="checkbox" id="checkSubway90" name="checkSubway" onclick="f_checkStaArea(this, '회룡');" value="11000-1-90">
	<label for="checkSubway90">회룡</label>
</span>
</div>
								</div>
							</div>

							<button type="button" class="btn-close-block">역세권별 닫기</button>
						</div>

						
					</div>
					<!--// layer-group -->
				</td>
			</tr>

			
			<tr>
				<!-- 20210303 추가 -->
				<th scope="row">
					<span class="label">재택근무 가능 여부</span>
				</th>
				<td>
					<div class="label-wrap line-0">
						<span>
							<input type="checkbox" id="tlmgYnParamY" name="tlmgYnParam" value="Y" title="재택근무" onclick="resultCheckBoxTemplate('tlmgYnParam');">
							<label for="tlmgYnParamY">재택근무</label>
						</span>
					</div>
				</td>
				<!-- 고용형태 위치 이동 -->
				<th scope="row" rowspan="2">
					<span class="label">고용형태</span>
					<div class="tooltip">
						<a href="#layerTool_03" class="tooltip"><i class="iconset ico-tooltip">툴팁</i></a>
						<div id="layerTool_03" class="layer-tooltip w760px">
							<dl class="dl">
								<dt>기간의 정함이 없는 근로계약</dt>
								<dd>: 근로계약을 명시하지 않고 계약하는 일자리, 무기계약직 혹은 정규직 일자리 등</dd>

								<dt>기간의 정함이 있는 근로계약</dt>
								<dd>: 근로기간을 정하여 계약하는 일자리, 계약직 등</dd>

								<dt>시간선택제 일자리</dt>
								<dd>: 전일제 근로자보다 짧게 일하지만, 근로조건 등은 차별이 없는 일자리<!--  <a href="#" target="_blank" title="새창 열림" class="a-link">[자세히보기]</a>--></dd>

								<dt>파견근로</dt>
								<dd>: 파견사업주(A)에게 고용되었으나, 사용사업주(B)의 사업체에 파견하여 근로하는 것으로, 임금이나 신분상의 고용관계는 파견사업주(A)의 관리를 받지만, 업무상 지휘, 명령은 사용업체(B)로부터 받게되는 근로형태</dd>

								<dt>대체인력</dt>
								<dd>: 출산전후휴가, 육아휴직 등에 있는 근로자를 대신하여 한정된 기간 동안 근무하는 자 <!--   <a href="#" target="_blank" title="새창 열림" class="a-link">[자세히보기]</a>--></dd>
							</dl>
						</div>
					</div>
				</th>
				<td rowspan="2">
					<div class="label-wrap line-0">
						
							
									
										<span class="full">
											<input type="checkbox" id="employGbnParam10" title="기간의 정함이 없는 근로계약" name="employGbnParam" value="10" onclick="resultCheckBoxTemplate('employGbnParam');f_empTypeChecked(this);">
											
												
												
												
												<label for="employGbnParam10">기간의 정함이 없는 근로계약</label>
												
											
											</span>
								
							
									
										<span class="full">
											<input type="checkbox" id="employGbnParam11" title="기간의 정함이 없는 근로계약(시간(선택)제)" name="employGbnParam" value="11" onclick="resultCheckBoxTemplate('employGbnParam');f_empTypeChecked(this);">
											
												
												
												
												<label for="employGbnParam11">기간의 정함이 없는 근로계약(시간(선택)제)</label>
												
											
											</span>
								
							
									
										<span class="full">
											<input type="checkbox" id="employGbnParam20" title="기간의 정함이 있는 근로계약" name="employGbnParam" value="20" onclick="resultCheckBoxTemplate('employGbnParam');f_empTypeChecked(this);">
											
												
												
												
												<label for="employGbnParam20">기간의 정함이 있는 근로계약</label>
												
											
											</span>
								
							
									
										<span class="full">
											<input type="checkbox" id="employGbnParam21" title="기간의 정함이 있는 근로계약(시간(선택)제)" name="employGbnParam" value="21" onclick="resultCheckBoxTemplate('employGbnParam');f_empTypeChecked(this);">
											
												
												
												
												<label for="employGbnParam21">기간의 정함이 있는 근로계약(시간(선택)제)</label>
												
											
											</span>
								
							
									
										<span class="full">
											<input type="checkbox" id="employGbnParam4" title="파견근로" name="employGbnParam" value="4" onclick="resultCheckBoxTemplate('employGbnParam');f_empTypeChecked(this);">
											
												
												
												
												<label for="employGbnParam4">파견근로</label>
												
											
											</span>
								
							
								
							
								
							
						

						<!-- 청년채용정보 -->
						
						
								<span>
									<input type="checkbox" id="subEmpHopeYnParamY" name="subEmpHopeYnParam" onclick="resultCheckBoxTemplate('subEmpHopeYnParam');" title="대체인력채용" value="Y">
									<label for="subEmpHopeYnParamY">대체인력채용</label>
								</span>
						
					</div>

					<div class="mt10" id="termContractMmcntSpan" style="display: none">
						<p class="reset"><strong class="font-black">근무기간</strong></p>

						<div class="label-wrap line-0">

							<span>
								<input type="checkbox" class="input_chk" id="termContractMmcntParam1" title="근무기간 1~3개월" onclick="resultCheckBoxTemplate('termContractMmcntParam');" name="termContractMmcntParam" value="1"> <label for="termContractMmcntParam1">1~3개월</label>
							</span>

							<span>
								<input type="checkbox" class="input_chk" id="termContractMmcntParam3" title="근무기간 3~6개월" onclick="resultCheckBoxTemplate('termContractMmcntParam');" name="termContractMmcntParam" value="3"> <label for="termContractMmcntParam3">3~6개월</label>
							</span>

							<span>
								<input type="checkbox" class="input_chk" id="termContractMmcntParam6" title="근무기간 6~12개월" onclick="resultCheckBoxTemplate('termContractMmcntParam');" name="termContractMmcntParam" value="6"> <label for="termContractMmcntParam6">6~12개월</label>
							</span>

							<span>
								<input type="checkbox" class="input_chk" id="termContractMmcntParam12" title="근무기간 12개월 이상" onclick="resultCheckBoxTemplate('termContractMmcntParam');" name="termContractMmcntParam" value="12"> <label for="termContractMmcntParam12">12개월 이상</label>
							</span>

						</div>
					</div>
				</td>
				<!-- //20210303 추가 -->
			</tr>

			<tr>
				<th scope="row">
					<span class="label">경력</span>
				</th>
				<td>
					<ul class="chk-list">
						<li>
							<input type="checkbox" id="careerTypeA" name="careerType" value="" title="경력전체" onclick="fnCareerCheck('A');" checked="checked">
							<label for="careerTypeA">전체</label>
						</li>
						<li>
							<input type="checkbox" id="careerTypeN" name="careerType" value="N" title="신입" onclick="fnCareerCheck('N');">
							<label for="careerTypeN">신입</label>
						</li>
						<li>
							<input type="checkbox" id="careerTypeE" name="careerType" value="E" title="경력" onclick="fnCareerCheck('E');">
							<label for="careerTypeE">경력</label>

							<div class="input-year">
								(
								<input type="text" id="careerFromParam" onkeyup="input_limit_string(this,'/d');" onblur="input_limit_string(this,'/d');" name="careerFromParam" maxlength="3" value="" disabled="disabled" title="경력 시작 년도 마지막 두자리 입력" class="input-text w80px">
								년 ~
								<input type="text" id="careerToParam" onkeyup="input_limit_string(this,'/d');" onblur="input_limit_string(this,'/d');" name="careerToParam" maxlength="3" value="" disabled="disabled" title="경력 마지막 년도 마지막 두자리 입력" class="input-text w80px">
								년 )
							</div>
							<!-- 20210204 추가 -->
							<!-- <div class="must">
								<span class="mr10">
									<input type="checkbox" id="carrEssYnY" name="carrEssYn" title="필수" value="Y" disabled="disabled" />
									<label for="carrEssYnY">필수</label>
								</span>
								<span>
									<input type="checkbox" id="carrEssYnN" name="carrEssYn" title="우대" value="N" disabled="disabled" />
									<label for="carrEssYnN">우대</label>
								</span>
							</div> -->
							<!-- //20210204 추가 -->
						</li>
						<li>
							<input type="checkbox" id="careerTypeZ" name="careerType" value="Z" title="경력 관계없음" onclick="fnCareerCheck('Z');">
							<label for="careerTypeZ">관계없음</label>
						</li>
					</ul>
				</td>
			</tr>
			<tr>
				<th scope="rowgroup" rowspan="2">
					<span class="label">학력</span>
				</th>
				<td rowspan="2">
					<div class="label-wrap line-3">
						<span>
								<input type="checkbox" id="b_academicGbnoEdu" name="b_academicGbnoEdu" value="noEdu" onclick="fn_academicGbn('b_academicGbnoEdu');">
								<label for="b_academicGbnoEdu">전체</label>
							</span>

							<span>
								<input type="checkbox" id="b_academicGbn02" name="b_academicGbn" value="01,02" title="중졸이하" onclick="fn_academicGbn('b_academicGbn02');">
								<label for="b_academicGbn02">중졸이하</label>
							</span>

							<span>
								<input type="checkbox" id="b_academicGbn03" name="b_academicGbn" value="03" title="고졸" onclick="fn_academicGbn('b_academicGbn03');">
								<label for="b_academicGbn03">고졸</label>
							</span>

							<span>
								<input type="checkbox" id="b_academicGbn04" name="b_academicGbn" value="04" title="대졸(2~3년)" onclick="fn_academicGbn('b_academicGbn04');">
								<label for="b_academicGbn04">대졸(2~3년)</label>
							</span>

							<span>
								<input type="checkbox" id="b_academicGbn05" name="b_academicGbn" value="05" title="대졸(4년)" onclick="fn_academicGbn('b_academicGbn05');">
								<label for="b_academicGbn05">대졸(4년)</label>
							</span>

							<span>
								<input type="checkbox" id="b_academicGbn06" name="b_academicGbn" value="06" title="석사" onclick="fn_academicGbn('b_academicGbn06');">
								<label for="b_academicGbn06">석사</label>
							</span>

							<span>
								<input type="checkbox" id="b_academicGbn07" name="b_academicGbn" value="07" title="박사" onclick="fn_academicGbn('b_academicGbn07');">
								<label for="b_academicGbn07">박사</label>
							</span>

							<span>
								<input type="checkbox" id="b_academicGbn00" name="b_academicGbn" value="00" title="학력무관" onclick="fn_academicGbn('b_academicGbn00');">
								<label for="b_academicGbn00">학력무관</label>
							</span>
					</div>
				</td>

				<th scope="row">
					<span class="label">희망임금</span>
				</th>
				<td>
					<div class="careers-money inline-block va-m">
							<div class="select-box medium" data-list-name="희망임금">
								<button type="button" class="btn" id="payTypebutton" title="희망임금 선택목록 열기">선택</button>

								<ul class="list">
									<li>
										<button type="button" onclick="fnPayType('');">선택</button>
									</li>
								
									<li>
										<button type="button" onclick="fnPayType('Y');" title="연봉">연봉</button>
									</li>
								
									<li>
										<button type="button" onclick="fnPayType('M');" title="월급">월급</button>
									</li>
								
									<li>
										<button type="button" onclick="fnPayType('D');" title="일급">일급</button>
									</li>
								
									<li>
										<button type="button" onclick="fnPayType('H');" title="시급">시급</button>
									</li>
								

								</ul>
							</div>

							<input type="text" id="b_minPay" name="b_minPay" onkeyup="input_limit_string(this,'/d');" onblur="input_limit_string(this,'/d');" maxlength="6" disabled="" value="" title="희망임금 최저가 입력" class="input-text w80px">
							<span id="minPayTitle">만원이상 ~</span>
							<!--
							<span>원이상 ~</span>
							 -->

							<input type="text" id="b_maxPay" name="b_maxPay" onkeyup="input_limit_string(this,'/d');" onblur="input_limit_string(this,'/d');" maxlength="6" value="" disabled="" title="희망임금 최고가 입력" class="input-text w80px">
							<span id="maxPayTitle">만원이하</span>
							<!--
							<span>원이하</span>
							 -->
						</div>

						<div class="inline-block va-m ml10">
							<input type="checkbox" id="noPayType" onclick="fnPayType('');">
							<label for="noPayType">관계없음</label>
						</div>
				</td>
			</tr>

			<tr>
				<th scope="row">
					<span class="label">워크넷 입사지원</span>
				</th>
				<td>
					<div class="label-wrap line-0">
						<span>
							<input type="checkbox" id="emailApplyYnParamY" name="emailApplyYnParam" value="Y" title="워크넷 입사지원 가능" onclick="resultCheckBoxTemplate('emailApplyYnParam');">
							<label for="emailApplyYnParamY">워크넷 입사지원 가능</label>
						</span>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<span class="acc-link-careers-search">아래는 채용정보 상세검색 조건 추가 표 영역입니다</span><div class="careers-search-table add-table-wrap">
	<table>
		<caption>채용정보 상세검색 조건 추가 표</caption>
		<colgroup>
			<col style="width:126px;">
			<col>
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">
					<span class="label">기업형태</span>
				</th>
				<td>
					<div class="label-wrap line-5">
						<span>
							<input type="checkbox" id="enterPriseGbnParamall" name="enterPriseGbnParam" value="all" onclick="fnEnterPriseGbnAllChk('all');" checked="checked">
							<label for="enterPriseGbnParamall">전체</label>
						</span>

						
							
								<span>
									<input type="checkbox" id="enterPriseGbnParam01" title="대기업" name="enterPriseGbnParam" value="01" onclick="fnEnterPriseGbnAll('1');">
									<label for="enterPriseGbnParam01">대기업</label>
								</span>
							
							
							
						
							
								<span>
									<input type="checkbox" id="enterPriseGbnParam04" title="공무원/공기업/공공기관" name="enterPriseGbnParam" value="04" onclick="fnEnterPriseGbnAll('2');">
									<label for="enterPriseGbnParam04">공무원/공기업/공공기관</label>
								</span>
							
							
							
						
							
							
							
								<span>
									<input type="checkbox" id="enterPriseGbnParam08" title="강소기업" name="enterPriseGbnParam" value="08" onclick="fnEnterPriseGbnAll('3');">
									<label for="enterPriseGbnParam08">강소기업</label>
								</span>
							
						
							
							
							
						
							
							
							
						
							
							
								<span>
									<input type="checkbox" id="enterPriseGbnParam06" title="코스피 / 코스닥" name="enterPriseGbnParam" value="06|07" onclick="fnEnterPriseGbnAll('6');">
									<label for="enterPriseGbnParam06">코스피 / 코스닥</label>
								</span>
							
							
						
							
							
							
						
							
							
							
						
							
							
							
						
							
							
							
						
							
								<span>
									<input type="checkbox" id="enterPriseGbnParam20" title="중견기업" name="enterPriseGbnParam" value="20" onclick="fnEnterPriseGbnAll('11');">
									<label for="enterPriseGbnParam20">중견기업</label>
								</span>
							
							
							
						
						
							
							
						
							
							
						
							
							
						
							
								<span>
									<input type="checkbox" id="enterPriseGbnParam05" title="외국계기업" name="enterPriseGbnParam" value="05" onclick="fnEnterPriseGbnAll('4');">
									<label for="enterPriseGbnParam05">외국계기업</label>
								</span>
							
							
						
							
							
						
							
							
						
							
							
						
							
							
								<span>
									<input type="checkbox" id="enterPriseGbnParam09" title="일학습병행기업" name="enterPriseGbnParam" value="09" onclick="fnEnterPriseGbnAll('8');">
									<label for="enterPriseGbnParam09">일학습병행기업</label>
								</span>
								
							
						
							
							
						
							
							
						
							
							
						
						
							
							
						
							
							
						
							
							
						
							
							
						
							
								<span>
									<input type="checkbox" id="enterPriseGbnParam03" title="벤처기업" name="enterPriseGbnParam" value="03" onclick="fnEnterPriseGbnAll('5');">
									<label for="enterPriseGbnParam03">벤처기업</label>
								</span>
							
							
						
							
							
						
							
							
						
							
							
						
							
							
								<span>
									<input type="checkbox" id="enterPriseGbnParam10" title="청년친화강소기업" name="enterPriseGbnParam" value="10" onclick="fnEnterPriseGbnAll('9');">
									<label for="enterPriseGbnParam10">청년친화강소기업</label>
								</span>
							
						
							
							
						
							
							
						
						
							

						
							

						
							

						
							

						
							

						
							

						
							

						
							

						
							

						
							
								<span>
									<input type="checkbox" id="enterPriseGbnParam11" title="가족친화인증기업" name="enterPriseGbnParam" value="11" onclick="fnEnterPriseGbnAll('10');">
									<label for="enterPriseGbnParam11">가족친화인증기업</label>
								</span>
							

						
							

						

					</div>
				</td>
			</tr>
			
			<tr>
					<th scope="row">
						<span class="label">채용구분</span>
					</th>
					<td>
						<div class="label-wrap line-0">
							<span>
								<input type="checkbox" id="empTpGbcdParam1" name="empTpGbcdParam" value="1" title="상용직" onclick="resultCheckBoxTemplate('empTpGbcdParam');">
								<label for="empTpGbcdParam1">상용직</label>
							</span>

							<span>
								<input type="checkbox" id="empTpGbcdParam2" name="empTpGbcdParam" value="2" title="일용직" onclick="resultCheckBoxTemplate('empTpGbcdParam');">
								<label for="empTpGbcdParam2">일용직</label>
							</span>
						</div>
					</td>
				</tr>
			
			<tr>
				<th scope="row">
					<span class="label">근무형태</span>
				</th>
				<td>
					<div class="label-wrap line-0">
						
							<span>
								<input type="checkbox" id="holidayGbnParam1" onclick="resultCheckBoxTemplate('holidayGbnParam')" name="holidayGbnParam" value="1" title="주 5일 ">
								<label for="holidayGbnParam1">주 5일 </label>
							</span>
						
							<span>
								<input type="checkbox" id="holidayGbnParam2" onclick="resultCheckBoxTemplate('holidayGbnParam')" name="holidayGbnParam" value="2" title="주 6일 ">
								<label for="holidayGbnParam2">주 6일 </label>
							</span>
						
							<span>
								<input type="checkbox" id="holidayGbnParam4" onclick="resultCheckBoxTemplate('holidayGbnParam')" name="holidayGbnParam" value="4" title="주 4일 ">
								<label for="holidayGbnParam4">주 4일 </label>
							</span>
						
							<span>
								<input type="checkbox" id="holidayGbnParam5" onclick="resultCheckBoxTemplate('holidayGbnParam')" name="holidayGbnParam" value="5" title="주 3일 ">
								<label for="holidayGbnParam5">주 3일 </label>
							</span>
						
							<span>
								<input type="checkbox" id="holidayGbnParam6" onclick="resultCheckBoxTemplate('holidayGbnParam')" name="holidayGbnParam" value="6" title="주 2일 ">
								<label for="holidayGbnParam6">주 2일 </label>
							</span>
						
							<span>
								<input type="checkbox" id="holidayGbnParam7" onclick="resultCheckBoxTemplate('holidayGbnParam')" name="holidayGbnParam" value="7" title="주 1일 ">
								<label for="holidayGbnParam7">주 1일 </label>
							</span>
						
							<span>
								<input type="checkbox" id="holidayGbnParamA" onclick="resultCheckBoxTemplate('holidayGbnParam')" name="holidayGbnParam" value="A" title="주 7일 ">
								<label for="holidayGbnParamA">주 7일 </label>
							</span>
						
					</div>
				</td>
			</tr>
			<!-- 20210204 추가 -->
			<tr>
				<th scope="row">
					<span class="label">격일근무 여부</span>
				</th>
				<td>
					<div class="label-wrap line-0">
						<span>
							<input type="checkbox" id="eodwYnParam" name="eodwYnParam" title="격일근무" value="Y" onclick="resultCheckBoxTemplate('eodwYnParam');">
							<label for="eodwYnParam">격일근무</label>
						</span>
					</div>
				</td>
			</tr>
			<!-- //20210204 추가 -->
			
			 <tr>
					<th scope="row">
						<span class="label">근로시간단축</span>
					</th>
					<td>
						<div class="label-wrap line-0">
							<span>
								<input type="checkbox" name="laborHrShortYnParam" title="근로시간단축여부" id="laborHrShortYnParamY" value="Y" onclick="resultCheckBoxTemplate('laborHrShortYnParam');">
								<label for="laborHrShortYnParamY">근로시간단축여부</label>
							</span>
						</div>
					</td>
				</tr>
			
			
			<!-- 20210204 추가 -->
			<tr>
				<th scope="row">
					<span class="label">교대근무여부</span>
				</th>
				<td>
					<!-- 20210204 수정 -->
					<div class="label-wrap line-0">
						<span>
							<input type="checkbox" id="shsyWorkSecdParamY" name="shsyWorkSecdParam" title="교대근무가능여부" value="Y" onclick="resultCheckBoxTemplate('shsyWorkSecdParam');">
							<label for="shsyWorkSecdParamY">교대근무가능여부</label>
						</span>
					</div>
				</td>
			</tr>
			<!-- //20210204 추가 -->
			
			<tr>
				<th scope="row">
					<span class="label">식사(비)제공</span>
				</th>
				<td>
					<div class="label-wrap line-0">
					
						
							<span>
								<input type="checkbox" id="mealOfferClcdParam1" name="mealOfferClcdParam" title="1식" value="1" onclick="resultCheckBoxTemplate('mealOfferClcdParam')">
								<label for="mealOfferClcdParam1">1식</label>
							</span>
						
					
						
							<span>
								<input type="checkbox" id="mealOfferClcdParam2" name="mealOfferClcdParam" title="2식" value="2" onclick="resultCheckBoxTemplate('mealOfferClcdParam')">
								<label for="mealOfferClcdParam2">2식</label>
							</span>
						
					
						
							<span>
								<input type="checkbox" id="mealOfferClcdParam3" name="mealOfferClcdParam" title="3식" value="3" onclick="resultCheckBoxTemplate('mealOfferClcdParam')">
								<label for="mealOfferClcdParam3">3식</label>
							</span>
						
					
						
							<span>
								<input type="checkbox" id="mealOfferClcdParam5" name="mealOfferClcdParam" title="중식비지급" value="5" onclick="resultCheckBoxTemplate('mealOfferClcdParam')">
								<label for="mealOfferClcdParam5">중식비지급</label>
							</span>
						
					
						
					
					</div>
				</td>
			</tr>

			<tr>
				<th scope="row">
					<span class="label">기타 복리후생</span>

					
						
						
							<div class="btn-and-or">
							<button type="button" onclick="javascript:document.getElementById('benefitSrchAndOr').value='A';f_requestSearchListCnt();">AND</button>
							<button type="button" class="on" title="선택됨" onclick="javascript:document.getElementById('benefitSrchAndOr').value='O';f_requestSearchListCnt();">OR</button>
						   </div>
						
					

					<div class="tooltip">
						<a href="#layerTool_04" class="tooltip"><i class="iconset ico-tooltip">툴팁</i></a>
						<div id="layerTool_04" class="layer-tooltip">
							<strong class="font-black">AND</strong> : 선택된 항목이 모두 포함된 결과값을 검색<br>
							<strong class="font-black">OR</strong> : 선택된 항목 중 하나 이상 포함된 결과값을 검색
						</div>
					</div>
				</th>
				<td>
				   <div class="label-wrap line-0">
						
								<span>
									<input type="checkbox" id="b_benefitGbn02" name="b_benefitGbn" value="02" title="통근버스" onclick="resultCheckBoxTemplate('b_benefitGbn');">
									<label for="b_benefitGbn02">통근버스</label>
								</span>
						
								<span>
									<input type="checkbox" id="b_benefitGbn01" name="b_benefitGbn" value="01" title="기숙사" onclick="resultCheckBoxTemplate('b_benefitGbn');">
									<label for="b_benefitGbn01">기숙사</label>
								</span>
						
								<span>
									<input type="checkbox" id="b_benefitGbn11" name="b_benefitGbn" value="11" title="차량유지비" onclick="resultCheckBoxTemplate('b_benefitGbn');">
									<label for="b_benefitGbn11">차량유지비</label>
								</span>
						
								<span>
									<input type="checkbox" id="b_benefitGbn12" name="b_benefitGbn" value="12" title="교육비 지원" onclick="resultCheckBoxTemplate('b_benefitGbn');">
									<label for="b_benefitGbn12">교육비 지원</label>
								</span>
						
								<span>
									<input type="checkbox" id="b_benefitGbn13" name="b_benefitGbn" value="13" title="자녀 학자금 지원" onclick="resultCheckBoxTemplate('b_benefitGbn');">
									<label for="b_benefitGbn13">자녀 학자금 지원</label>
								</span>
						
								<span>
									<input type="checkbox" id="b_benefitGbn06" name="b_benefitGbn" value="06" title="주택자금 지원" onclick="resultCheckBoxTemplate('b_benefitGbn');">
									<label for="b_benefitGbn06">주택자금 지원</label>
								</span>
						
								<span>
									<input type="checkbox" id="b_benefitGbn09" name="b_benefitGbn" value="09" title="기타" onclick="resultCheckBoxTemplate('b_benefitGbn');">
									<label for="b_benefitGbn09">기타</label>
								</span>
						
								<span>
									<input type="checkbox" id="b_benefitGbn14" name="b_benefitGbn" value="14" title="모성보호시설" onclick="resultCheckBoxTemplate('b_benefitGbn');">
									<label for="b_benefitGbn14">모성보호시설</label>
								</span>
						
					</div>
				</td>
			</tr>
			

			

			
			<tr>
				<th scope="row">
					<span class="label">장애인 희망채용</span>
				</th>
				<td>
					<div class="label-wrap line-0">
						<span>
							<input type="checkbox" id="disableEmpHopeGbnParamY" name="disableEmpHopeGbnParam" title="장애인 병행채용" value="Y" onclick="f_disableEmpHopeANDEtcDisable('1');resultCheckBoxTemplate('disableEmpHopeGbnParam');">
							<label for="disableEmpHopeGbnParamY">장애인 병행채용</label>
						</span>

						

						<span>
							<input type="checkbox" id="disableEmpHopeGbnParamD" name="disableEmpHopeGbnParam" title="장애인만 채용" value="D" onclick="resultCheckBoxTemplate('disableEmpHopeGbnParam');">
							<label for="disableEmpHopeGbnParamD">장애인만 채용</label>
						</span>
					</div>
				</td>
			</tr>
			
			
			<tr>
				<th scope="row">
					<span class="label">병역 특례</span>
				</th>
				<td>
					<div class="label-wrap line-0">
						<span>
							<input type="checkbox" name="actServExcYnParam" title="현역병 입영대상자" id="actServExcYnParamY" value="Y" onclick="resultCheckBoxTemplate('actServExcYnParam');">
							<label for="actServExcYnParamY">현역병 입영대상자</label>
						</span>
						<span>
							<input type="checkbox" name="resrDutyExcYnParam" title="보충역 대상자" id="resrDutyExcYnParamY" value="Y" onclick="resultCheckBoxTemplate('resrDutyExcYnParam');">
							<label for="resrDutyExcYnParamY">보충역 대상자</label>
						</span>
						<span>
							<input type="checkbox" name="infaYnParam" title="산업기능 요원" id="infaYnParamY" value="Y" onclick="resultCheckBoxTemplate('infaYnParam');">
							<label for="infaYnParamY">산업기능 요원</label>
						</span>
						<span>
							<input type="checkbox" name="publDutyExcYnParam" title="전문연구 요원" id="publDutyExcYnParamY" value="Y" onclick="resultCheckBoxTemplate('publDutyExcYnParam');">
							<label for="publDutyExcYnParamY">전문연구 요원</label>
						</span>
					</div>
				</td>
			</tr>

			<tr>
				<th scope="row">
					<span class="label">자격면허</span>
				</th>
				<td>
					<!-- layer-group -->
					<div class="layer-group">
						<div class="btn-block">
							<a href="#jobLicense" class="button btn-open-block">자격증 선택</a>

							<div class="must">
								<input type="checkbox" name="b_essCertChk" id="b_essCertChkY" value="Y" onclick="onEssCertlabelChk();resultCheckBoxTemplate('b_essCertChk');" title="필수자격만 검색">
								<label for="b_essCertChkY">필수자격만 검색</label>
							</div>
						</div>

						<div id="jobLicense" class="layer-block h380px">
							<div class="job-license-select">
								<div class="search-area">
									<div class="mb10">
											<input style="ime-mode:active;" type="search" id="licSearchTxt" onkeypress="if(event.keyCode==13) fnLicSearch();" title="자격증 검색어 입력" placeholder="자격증 관련 키워드를 입력하세요. 예) 영업, 운전, 사무직" class="input-text w520px">
											<button type="button" onclick="fnLicSearch();" class="button">검색</button>
									</div>
								</div>

								<div class="license-button">
									<button type="button" onclick="fnSelLicMain(0, '50000')" class="on" title="선택됨">국가기술자격</button>
									<button type="button" onclick="fnSelLicMain(1, '60000');">국가전문자격</button>
								</div>

								<div class="initial-select">
									<h3 class="ir" id="selLicName">국가기술자격</h3>
									
										
											<button onclick="fnSelLicMain(0, '50001');" type="button" class="on" title="선택됨">ㄱ</button>
										
									
										
											<button onclick="fnSelLicMain(1, '50002');" type="button" title="">ㄴ</button>
										
									
										
											<button onclick="fnSelLicMain(2, '50003');" type="button" title="">ㄷ</button>
										
									
										
											<button onclick="fnSelLicMain(3, '50004');" type="button" title="">ㄹ</button>
										
									
										
											<button onclick="fnSelLicMain(4, '50005');" type="button" title="">ㅁ</button>
										
									
										
											<button onclick="fnSelLicMain(5, '50006');" type="button" title="">ㅂ</button>
										
									
										
											<button onclick="fnSelLicMain(6, '50007');" type="button" title="">ㅅ</button>
										
									
										
											<button onclick="fnSelLicMain(7, '50008');" type="button" title="">ㅇ</button>
										
									
										
											<button onclick="fnSelLicMain(8, '50009');" type="button" title="">ㅈ</button>
										
									
										
											<button onclick="fnSelLicMain(9, '50010');" type="button" title="">ㅊ</button>
										
									
										
											<button onclick="fnSelLicMain(10, '50011');" type="button" title="">ㅋ</button>
										
									
										
											<button onclick="fnSelLicMain(11, '50012');" type="button" title="">ㅌ</button>
										
									
										
											<button onclick="fnSelLicMain(12, '50013');" type="button" title="">ㅍ</button>
										
									
										
											<button onclick="fnSelLicMain(13, '50014');" type="button" title="">ㅎ</button>
										
									
										
											<button onclick="fnSelLicMain(14, '50090');" type="button" title="">기타</button>
										
									
										
									
										
									
								</div>

								<div class="result-license">
									<h3 class="ir" id="selLicName">국가전문자격</h3>
									<div class="label-wrap line-3" id="licResult1">
<span>
	<input type="checkbox" id="licItem5009434" name="licItem" value="5009434" onclick="fnCheckItem('5009434', '가구도장기능사보', 'lic', this)"> <label for="licItem5009434">가구도장기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5005776" name="licItem" value="5005776" onclick="fnCheckItem('5005776', '가구도장산업기사', 'lic', this)"> <label for="licItem5005776">가구도장산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5007140" name="licItem" value="5007140" onclick="fnCheckItem('5007140', '가구제작기능사', 'lic', this)"> <label for="licItem5007140">가구제작기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5008900" name="licItem" value="5008900" onclick="fnCheckItem('5008900', '가구제작기능사보', 'lic', this)"> <label for="licItem5008900">가구제작기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5002142" name="licItem" value="5002142" onclick="fnCheckItem('5002142', '가구제작산업기사', 'lic', this)"> <label for="licItem5002142">가구제작산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5007909" name="licItem" value="5007909" onclick="fnCheckItem('5007909', '가눈섭기능사', 'lic', this)"> <label for="licItem5007909">가눈섭기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5009459" name="licItem" value="5009459" onclick="fnCheckItem('5009459', '가눈섭기능사보', 'lic', this)"> <label for="licItem5009459">가눈섭기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5009458" name="licItem" value="5009458" onclick="fnCheckItem('5009458', '가발기능사보', 'lic', this)"> <label for="licItem5009458">가발기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5006335" name="licItem" value="5006335" onclick="fnCheckItem('5006335', '가스기능사', 'lic', this)"> <label for="licItem5006335">가스기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5003375" name="licItem" value="5003375" onclick="fnCheckItem('5003375', '가스기능장', 'lic', this)"> <label for="licItem5003375">가스기능장</label>
</span>

<span>
	<input type="checkbox" id="licItem5001471" name="licItem" value="5001471" onclick="fnCheckItem('5001471', '가스기사', 'lic', this)"> <label for="licItem5001471">가스기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5000752" name="licItem" value="5000752" onclick="fnCheckItem('5000752', '가스기술사', 'lic', this)"> <label for="licItem5000752">가스기술사</label>
</span>

<span>
	<input type="checkbox" id="licItem5002471" name="licItem" value="5002471" onclick="fnCheckItem('5002471', '가스산업기사', 'lic', this)"> <label for="licItem5002471">가스산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5008190" name="licItem" value="5008190" onclick="fnCheckItem('5008190', '가스용접기능사보', 'lic', this)"> <label for="licItem5008190">가스용접기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5006670" name="licItem" value="5006670" onclick="fnCheckItem('5006670', '가죽처리기능사', 'lic', this)"> <label for="licItem5006670">가죽처리기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5008560" name="licItem" value="5008560" onclick="fnCheckItem('5008560', '가죽처리기능사보', 'lic', this)"> <label for="licItem5008560">가죽처리기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5003350" name="licItem" value="5003350" onclick="fnCheckItem('5003350', '가죽처리기능장', 'lic', this)"> <label for="licItem5003350">가죽처리기능장</label>
</span>

<span>
	<input type="checkbox" id="licItem5004670" name="licItem" value="5004670" onclick="fnCheckItem('5004670', '가죽처리산업기사', 'lic', this)"> <label for="licItem5004670">가죽처리산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5008310" name="licItem" value="5008310" onclick="fnCheckItem('5008310', '객화차정비기능사보', 'lic', this)"> <label for="licItem5008310">객화차정비기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5007050" name="licItem" value="5007050" onclick="fnCheckItem('5007050', '갱부기능사', 'lic', this)"> <label for="licItem5007050">갱부기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5008820" name="licItem" value="5008820" onclick="fnCheckItem('5008820', '갱부기능사보', 'lic', this)"> <label for="licItem5008820">갱부기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5003540" name="licItem" value="5003540" onclick="fnCheckItem('5003540', '갱부기능장', 'lic', this)"> <label for="licItem5003540">갱부기능장</label>
</span>

<span>
	<input type="checkbox" id="licItem5007170" name="licItem" value="5007170" onclick="fnCheckItem('5007170', '거푸집기능사', 'lic', this)"> <label for="licItem5007170">거푸집기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5008930" name="licItem" value="5008930" onclick="fnCheckItem('5008930', '거푸집기능사보', 'lic', this)"> <label for="licItem5008930">거푸집기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5008242" name="licItem" value="5008242" onclick="fnCheckItem('5008242', '건설기계기관정비기능사보', 'lic', this)"> <label for="licItem5008242">건설기계기관정비기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5000080" name="licItem" value="5000080" onclick="fnCheckItem('5000080', '건설기계기술사', 'lic', this)"> <label for="licItem5000080">건설기계기술사</label>
</span>

<span>
	<input type="checkbox" id="licItem5010030" name="licItem" value="5010030" onclick="fnCheckItem('5010030', '건설기계설비기사', 'lic', this)"> <label for="licItem5010030">건설기계설비기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5010071" name="licItem" value="5010071" onclick="fnCheckItem('5010071', '건설기계설비산업기사', 'lic', this)"> <label for="licItem5010071">건설기계설비산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5006298" name="licItem" value="5006298" onclick="fnCheckItem('5006298', '건설기계정비기능사', 'lic', this)"> <label for="licItem5006298">건설기계정비기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5003120" name="licItem" value="5003120" onclick="fnCheckItem('5003120', '건설기계정비기능장', 'lic', this)"> <label for="licItem5003120">건설기계정비기능장</label>
</span>

<span>
	<input type="checkbox" id="licItem5001050" name="licItem" value="5001050" onclick="fnCheckItem('5001050', '건설기계정비기사', 'lic', this)"> <label for="licItem5001050">건설기계정비기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5002050" name="licItem" value="5002050" onclick="fnCheckItem('5002050', '건설기계정비산업기사', 'lic', this)"> <label for="licItem5002050">건설기계정비산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5008241" name="licItem" value="5008241" onclick="fnCheckItem('5008241', '건설기계차체정비기능사보', 'lic', this)"> <label for="licItem5008241">건설기계차체정비기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5001440" name="licItem" value="5001440" onclick="fnCheckItem('5001440', '건설안전기사', 'lic', this)"> <label for="licItem5001440">건설안전기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5000740" name="licItem" value="5000740" onclick="fnCheckItem('5000740', '건설안전기술사', 'lic', this)"> <label for="licItem5000740">건설안전기술사</label>
</span>

<span>
	<input type="checkbox" id="licItem5002390" name="licItem" value="5002390" onclick="fnCheckItem('5002390', '건설안전산업기사', 'lic', this)"> <label for="licItem5002390">건설안전산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5007132" name="licItem" value="5007132" onclick="fnCheckItem('5007132', '건설재료시험기능사', 'lic', this)"> <label for="licItem5007132">건설재료시험기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5001750" name="licItem" value="5001750" onclick="fnCheckItem('5001750', '건설재료시험기사', 'lic', this)"> <label for="licItem5001750">건설재료시험기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5002600" name="licItem" value="5002600" onclick="fnCheckItem('5002600', '건설재료시험산업기사', 'lic', this)"> <label for="licItem5002600">건설재료시험산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5000490" name="licItem" value="5000490" onclick="fnCheckItem('5000490', '건축구조기술사', 'lic', this)"> <label for="licItem5000490">건축구조기술사</label>
</span>

<span>
	<input type="checkbox" id="licItem5000501" name="licItem" value="5000501" onclick="fnCheckItem('5000501', '건축기계설비기술사', 'lic', this)"> <label for="licItem5000501">건축기계설비기술사</label>
</span>

<span>
	<input type="checkbox" id="licItem5001630" name="licItem" value="5001630" onclick="fnCheckItem('5001630', '건축기사', 'lic', this)"> <label for="licItem5001630">건축기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5007150" name="licItem" value="5007150" onclick="fnCheckItem('5007150', '건축도장기능사', 'lic', this)"> <label for="licItem5007150">건축도장기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5008910" name="licItem" value="5008910" onclick="fnCheckItem('5008910', '건축도장기능사보', 'lic', this)"> <label for="licItem5008910">건축도장기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5005090" name="licItem" value="5005090" onclick="fnCheckItem('5005090', '건축도장산업기사', 'lic', this)"> <label for="licItem5005090">건축도장산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5007130" name="licItem" value="5007130" onclick="fnCheckItem('5007130', '건축목공기능사', 'lic', this)"> <label for="licItem5007130">건축목공기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5008890" name="licItem" value="5008890" onclick="fnCheckItem('5008890', '건축목공기능사보', 'lic', this)"> <label for="licItem5008890">건축목공기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5002253" name="licItem" value="5002253" onclick="fnCheckItem('5002253', '건축목공산업기사', 'lic', this)"> <label for="licItem5002253">건축목공산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5003611" name="licItem" value="5003611" onclick="fnCheckItem('5003611', '건축목재시공기능장', 'lic', this)"> <label for="licItem5003611">건축목재시공기능장</label>
</span>

<span>
	<input type="checkbox" id="licItem5008173" name="licItem" value="5008173" onclick="fnCheckItem('5008173', '건축배관기능사보', 'lic', this)"> <label for="licItem5008173">건축배관기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5002530" name="licItem" value="5002530" onclick="fnCheckItem('5002530', '건축산업기사', 'lic', this)"> <label for="licItem5002530">건축산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5001632" name="licItem" value="5001632" onclick="fnCheckItem('5001632', '건축설비기사', 'lic', this)"> <label for="licItem5001632">건축설비기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5002531" name="licItem" value="5002531" onclick="fnCheckItem('5002531', '건축설비산업기사', 'lic', this)"> <label for="licItem5002531">건축설비산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5000510" name="licItem" value="5000510" onclick="fnCheckItem('5000510', '건축시공기술사', 'lic', this)"> <label for="licItem5000510">건축시공기술사</label>
</span>

<span>
	<input type="checkbox" id="licItem5003621" name="licItem" value="5003621" onclick="fnCheckItem('5003621', '건축일반시공기능장', 'lic', this)"> <label for="licItem5003621">건축일반시공기능장</label>
</span>

<span>
	<input type="checkbox" id="licItem5002251" name="licItem" value="5002251" onclick="fnCheckItem('5002251', '건축일반시공산업기사', 'lic', this)"> <label for="licItem5002251">건축일반시공산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5008131" name="licItem" value="5008131" onclick="fnCheckItem('5008131', '건축재료시험기능사보', 'lic', this)"> <label for="licItem5008131">건축재료시험기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5000502" name="licItem" value="5000502" onclick="fnCheckItem('5000502', '건축전기설비기술사', 'lic', this)"> <label for="licItem5000502">건축전기설비기술사</label>
</span>

<span>
	<input type="checkbox" id="licItem5003550" name="licItem" value="5003550" onclick="fnCheckItem('5003550', '건축제도기능장', 'lic', this)"> <label for="licItem5003550">건축제도기능장</label>
</span>

<span>
	<input type="checkbox" id="licItem5005000" name="licItem" value="5005000" onclick="fnCheckItem('5005000', '건축제도산업기사', 'lic', this)"> <label for="licItem5005000">건축제도산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5000511" name="licItem" value="5000511" onclick="fnCheckItem('5000511', '건축품질시험기술사', 'lic', this)"> <label for="licItem5000511">건축품질시험기술사</label>
</span>

<span>
	<input type="checkbox" id="licItem5009543" name="licItem" value="5009543" onclick="fnCheckItem('5009543', '게임그래픽전문가', 'lic', this)"> <label for="licItem5009543">게임그래픽전문가</label>
</span>

<span>
	<input type="checkbox" id="licItem5009544" name="licItem" value="5009544" onclick="fnCheckItem('5009544', '게임기획전문가', 'lic', this)"> <label for="licItem5009544">게임기획전문가</label>
</span>

<span>
	<input type="checkbox" id="licItem5009542" name="licItem" value="5009542" onclick="fnCheckItem('5009542', '게임프로그래밍전문가', 'lic', this)"> <label for="licItem5009542">게임프로그래밍전문가</label>
</span>

<span>
	<input type="checkbox" id="licItem5001713" name="licItem" value="5001713" onclick="fnCheckItem('5001713', '계량기사', 'lic', this)"> <label for="licItem5001713">계량기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5001703" name="licItem" value="5001703" onclick="fnCheckItem('5001703', '계량기사', 'lic', this)"> <label for="licItem5001703">계량기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5001720" name="licItem" value="5001720" onclick="fnCheckItem('5001720', '계량기사', 'lic', this)"> <label for="licItem5001720">계량기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5006640" name="licItem" value="5006640" onclick="fnCheckItem('5006640', '고무제품제조기능사', 'lic', this)"> <label for="licItem5006640">고무제품제조기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5008530" name="licItem" value="5008530" onclick="fnCheckItem('5008530', '고무제품제조기능사보', 'lic', this)"> <label for="licItem5008530">고무제품제조기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5003320" name="licItem" value="5003320" onclick="fnCheckItem('5003320', '고무제품제조기능장', 'lic', this)"> <label for="licItem5003320">고무제품제조기능장</label>
</span>

<span>
	<input type="checkbox" id="licItem5004640" name="licItem" value="5004640" onclick="fnCheckItem('5004640', '고무제품제조산업기사', 'lic', this)"> <label for="licItem5004640">고무제품제조산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5006642" name="licItem" value="5006642" onclick="fnCheckItem('5006642', '고분자제품제조기능사', 'lic', this)"> <label for="licItem5006642">고분자제품제조기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5008260" name="licItem" value="5008260" onclick="fnCheckItem('5008260', '고압가스기계기능사보', 'lic', this)"> <label for="licItem5008260">고압가스기계기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5008270" name="licItem" value="5008270" onclick="fnCheckItem('5008270', '고압가스냉동기계기능사보', 'lic', this)"> <label for="licItem5008270">고압가스냉동기계기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5008280" name="licItem" value="5008280" onclick="fnCheckItem('5008280', '고압가스취급기능사보', 'lic', this)"> <label for="licItem5008280">고압가스취급기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5008570" name="licItem" value="5008570" onclick="fnCheckItem('5008570', '고압가스화학기능사보', 'lic', this)"> <label for="licItem5008570">고압가스화학기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5007882" name="licItem" value="5007882" onclick="fnCheckItem('5007882', '고압합성기능사', 'lic', this)"> <label for="licItem5007882">고압합성기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5009432" name="licItem" value="5009432" onclick="fnCheckItem('5009432', '고압합성기능사보', 'lic', this)"> <label for="licItem5009432">고압합성기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5006090" name="licItem" value="5006090" onclick="fnCheckItem('5006090', '공구제작기능사', 'lic', this)"> <label for="licItem5006090">공구제작기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5008070" name="licItem" value="5008070" onclick="fnCheckItem('5008070', '공구제작기능사보', 'lic', this)"> <label for="licItem5008070">공구제작기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5005764" name="licItem" value="5005764" onclick="fnCheckItem('5005764', '공기압축기산업기사', 'lic', this)"> <label for="licItem5005764">공기압축기산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5007876" name="licItem" value="5007876" onclick="fnCheckItem('5007876', '공기압축기운전기능사', 'lic', this)"> <label for="licItem5007876">공기압축기운전기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5006380" name="licItem" value="5006380" onclick="fnCheckItem('5006380', '공기조화기능사', 'lic', this)"> <label for="licItem5006380">공기조화기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5008320" name="licItem" value="5008320" onclick="fnCheckItem('5008320', '공기조화기능사보', 'lic', this)"> <label for="licItem5008320">공기조화기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5003160" name="licItem" value="5003160" onclick="fnCheckItem('5003160', '공기조화기능장', 'lic', this)"> <label for="licItem5003160">공기조화기능장</label>
</span>

<span>
	<input type="checkbox" id="licItem5007790" name="licItem" value="5007790" onclick="fnCheckItem('5007790', '공업계측제어기능사', 'lic', this)"> <label for="licItem5007790">공업계측제어기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5001640" name="licItem" value="5001640" onclick="fnCheckItem('5001640', '공업계측제어기사', 'lic', this)"> <label for="licItem5001640">공업계측제어기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5005700" name="licItem" value="5005700" onclick="fnCheckItem('5005700', '공업계측제어산업기사', 'lic', this)"> <label for="licItem5005700">공업계측제어산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5008174" name="licItem" value="5008174" onclick="fnCheckItem('5008174', '공업배관기능사보', 'lic', this)"> <label for="licItem5008174">공업배관기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5006251" name="licItem" value="5006251" onclick="fnCheckItem('5006251', '공유압기능사', 'lic', this)"> <label for="licItem5006251">공유압기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5000760" name="licItem" value="5000760" onclick="fnCheckItem('5000760', '공장관리기술사', 'lic', this)"> <label for="licItem5000760">공장관리기술사</label>
</span>

<span>
	<input type="checkbox" id="licItem5002080" name="licItem" value="5002080" onclick="fnCheckItem('5002080', '공정설계산업기사', 'lic', this)"> <label for="licItem5002080">공정설계산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5006320" name="licItem" value="5006320" onclick="fnCheckItem('5006320', '공조냉동기계기능사', 'lic', this)"> <label for="licItem5006320">공조냉동기계기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5001730" name="licItem" value="5001730" onclick="fnCheckItem('5001730', '공조냉동기계기사', 'lic', this)"> <label for="licItem5001730">공조냉동기계기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5000071" name="licItem" value="5000071" onclick="fnCheckItem('5000071', '공조냉동기계기술사', 'lic', this)"> <label for="licItem5000071">공조냉동기계기술사</label>
</span>

<span>
	<input type="checkbox" id="licItem5002590" name="licItem" value="5002590" onclick="fnCheckItem('5002590', '공조냉동기계산업기사', 'lic', this)"> <label for="licItem5002590">공조냉동기계산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5009448" name="licItem" value="5009448" onclick="fnCheckItem('5009448', '과수재배기능사보', 'lic', this)"> <label for="licItem5009448">과수재배기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5007888" name="licItem" value="5007888" onclick="fnCheckItem('5007888', '광고도장기능사', 'lic', this)"> <label for="licItem5007888">광고도장기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5009435" name="licItem" value="5009435" onclick="fnCheckItem('5009435', '광고도장기능사보', 'lic', this)"> <label for="licItem5009435">광고도장기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5005777" name="licItem" value="5005777" onclick="fnCheckItem('5005777', '광고도장산업기사', 'lic', this)"> <label for="licItem5005777">광고도장산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5007361" name="licItem" value="5007361" onclick="fnCheckItem('5007361', '광산기계기능사', 'lic', this)"> <label for="licItem5007361">광산기계기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5008361" name="licItem" value="5008361" onclick="fnCheckItem('5008361', '광산기계기능사보', 'lic', this)"> <label for="licItem5008361">광산기계기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5007360" name="licItem" value="5007360" onclick="fnCheckItem('5007360', '광산기계설치기능사', 'lic', this)"> <label for="licItem5007360">광산기계설치기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5009120" name="licItem" value="5009120" onclick="fnCheckItem('5009120', '광산기계설치기능사보', 'lic', this)"> <label for="licItem5009120">광산기계설치기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5007370" name="licItem" value="5007370" onclick="fnCheckItem('5007370', '광산기계운전및수리기능사', 'lic', this)"> <label for="licItem5007370">광산기계운전및수리기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5003710" name="licItem" value="5003710" onclick="fnCheckItem('5003710', '광산기계운전및수리기능장', 'lic', this)"> <label for="licItem5003710">광산기계운전및수리기능장</label>
</span>

<span>
	<input type="checkbox" id="licItem5010149" name="licItem" value="5010149" onclick="fnCheckItem('5010149', '광산보안기능사', 'lic', this)"> <label for="licItem5010149">광산보안기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5001450" name="licItem" value="5001450" onclick="fnCheckItem('5001450', '광산보안기사', 'lic', this)"> <label for="licItem5001450">광산보안기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5002135" name="licItem" value="5002135" onclick="fnCheckItem('5002135', '광산보안산업기사', 'lic', this)"> <label for="licItem5002135">광산보안산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5002108" name="licItem" value="5002108" onclick="fnCheckItem('5002108', '광학기기산업기사', 'lic', this)"> <label for="licItem5002108">광학기기산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5007671" name="licItem" value="5007671" onclick="fnCheckItem('5007671', '광학기능사', 'lic', this)"> <label for="licItem5007671">광학기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5001513" name="licItem" value="5001513" onclick="fnCheckItem('5001513', '광학기사', 'lic', this)"> <label for="licItem5001513">광학기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5002433" name="licItem" value="5002433" onclick="fnCheckItem('5002433', '광학산업기사', 'lic', this)"> <label for="licItem5002433">광학산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5001575" name="licItem" value="5001575" onclick="fnCheckItem('5001575', '광해방지기사', 'lic', this)"> <label for="licItem5001575">광해방지기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5000575" name="licItem" value="5000575" onclick="fnCheckItem('5000575', '광해방지기술사', 'lic', this)"> <label for="licItem5000575">광해방지기술사</label>
</span>

<span>
	<input type="checkbox" id="licItem5001751" name="licItem" value="5001751" onclick="fnCheckItem('5001751', '교통기사', 'lic', this)"> <label for="licItem5001751">교통기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5000951" name="licItem" value="5000951" onclick="fnCheckItem('5000951', '교통기술사', 'lic', this)"> <label for="licItem5000951">교통기술사</label>
</span>

<span>
	<input type="checkbox" id="licItem5002751" name="licItem" value="5002751" onclick="fnCheckItem('5002751', '교통산업기사', 'lic', this)"> <label for="licItem5002751">교통산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5009371" name="licItem" value="5009371" onclick="fnCheckItem('5009371', '교환설비기능사보', 'lic', this)"> <label for="licItem5009371">교환설비기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5008921" name="licItem" value="5008921" onclick="fnCheckItem('5008921', '구들온돌기능사보', 'lic', this)"> <label for="licItem5008921">구들온돌기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5010012" name="licItem" value="5010012" onclick="fnCheckItem('5010012', '국제의료관광코디네이터', 'lic', this)"> <label for="licItem5010012">국제의료관광코디네이터</label>
</span>

<span>
	<input type="checkbox" id="licItem5009090" name="licItem" value="5009090" onclick="fnCheckItem('5009090', '굴진기능사보', 'lic', this)"> <label for="licItem5009090">굴진기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5009080" name="licItem" value="5009080" onclick="fnCheckItem('5009080', '굴착기능사보', 'lic', this)"> <label for="licItem5009080">굴착기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5007862" name="licItem" value="5007862" onclick="fnCheckItem('5007862', '굴착기운전기능사', 'lic', this)"> <label for="licItem5007862">굴착기운전기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5002279" name="licItem" value="5002279" onclick="fnCheckItem('5002279', '굴착산업기사', 'lic', this)"> <label for="licItem5002279">굴착산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5007692" name="licItem" value="5007692" onclick="fnCheckItem('5007692', '궐련제조기계정비기능사', 'lic', this)"> <label for="licItem5007692">궐련제조기계정비기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5006412" name="licItem" value="5006412" onclick="fnCheckItem('5006412', '궐련제조기능사', 'lic', this)"> <label for="licItem5006412">궐련제조기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5008332" name="licItem" value="5008332" onclick="fnCheckItem('5008332', '궐련제조기능사보', 'lic', this)"> <label for="licItem5008332">궐련제조기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5006051" name="licItem" value="5006051" onclick="fnCheckItem('5006051', '궤도장비정비기능사', 'lic', this)"> <label for="licItem5006051">궤도장비정비기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5001051" name="licItem" value="5001051" onclick="fnCheckItem('5001051', '궤도장비정비기사', 'lic', this)"> <label for="licItem5001051">궤도장비정비기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5002051" name="licItem" value="5002051" onclick="fnCheckItem('5002051', '궤도장비정비산업기사', 'lic', this)"> <label for="licItem5002051">궤도장비정비산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5007460" name="licItem" value="5007460" onclick="fnCheckItem('5007460', '귀금속가공기능사', 'lic', this)"> <label for="licItem5007460">귀금속가공기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5009200" name="licItem" value="5009200" onclick="fnCheckItem('5009200', '귀금속가공기능사보', 'lic', this)"> <label for="licItem5009200">귀금속가공기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5003770" name="licItem" value="5003770" onclick="fnCheckItem('5003770', '귀금속가공기능장', 'lic', this)"> <label for="licItem5003770">귀금속가공기능장</label>
</span>

<span>
	<input type="checkbox" id="licItem5002760" name="licItem" value="5002760" onclick="fnCheckItem('5002760', '귀금속가공산업기사', 'lic', this)"> <label for="licItem5002760">귀금속가공산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5009480" name="licItem" value="5009480" onclick="fnCheckItem('5009480', '그라비아인쇄기능사보', 'lic', this)"> <label for="licItem5009480">그라비아인쇄기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5000041" name="licItem" value="5000041" onclick="fnCheckItem('5000041', '그린전동자동차기사', 'lic', this)"> <label for="licItem5000041">그린전동자동차기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5000130" name="licItem" value="5000130" onclick="fnCheckItem('5000130', '금속가공기술사', 'lic', this)"> <label for="licItem5000130">금속가공기술사</label>
</span>

<span>
	<input type="checkbox" id="licItem5007440" name="licItem" value="5007440" onclick="fnCheckItem('5007440', '금속공예기능사', 'lic', this)"> <label for="licItem5007440">금속공예기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5009180" name="licItem" value="5009180" onclick="fnCheckItem('5009180', '금속공예기능사보', 'lic', this)"> <label for="licItem5009180">금속공예기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5003750" name="licItem" value="5003750" onclick="fnCheckItem('5003750', '금속공예기능장', 'lic', this)"> <label for="licItem5003750">금속공예기능장</label>
</span>

<span>
	<input type="checkbox" id="licItem5006009" name="licItem" value="5006009" onclick="fnCheckItem('5006009', '금속기사(제련분야)', 'lic', this)"> <label for="licItem5006009">금속기사(제련분야)</label>
</span>

<span>
	<input type="checkbox" id="licItem5007450" name="licItem" value="5007450" onclick="fnCheckItem('5007450', '금속도장기능사', 'lic', this)"> <label for="licItem5007450">금속도장기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5009190" name="licItem" value="5009190" onclick="fnCheckItem('5009190', '금속도장기능사보', 'lic', this)"> <label for="licItem5009190">금속도장기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5003760" name="licItem" value="5003760" onclick="fnCheckItem('5003760', '금속도장기능장', 'lic', this)"> <label for="licItem5003760">금속도장기능장</label>
</span>

<span>
	<input type="checkbox" id="licItem5005380" name="licItem" value="5005380" onclick="fnCheckItem('5005380', '금속도장산업기사', 'lic', this)"> <label for="licItem5005380">금속도장산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5003221" name="licItem" value="5003221" onclick="fnCheckItem('5003221', '금속재료기능장', 'lic', this)"> <label for="licItem5003221">금속재료기능장</label>
</span>

<span>
	<input type="checkbox" id="licItem5010032" name="licItem" value="5010032" onclick="fnCheckItem('5010032', '금속재료기사', 'lic', this)"> <label for="licItem5010032">금속재료기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5000110" name="licItem" value="5000110" onclick="fnCheckItem('5000110', '금속재료기술사', 'lic', this)"> <label for="licItem5000110">금속재료기술사</label>
</span>

<span>
	<input type="checkbox" id="licItem5002101" name="licItem" value="5002101" onclick="fnCheckItem('5002101', '금속재료산업기사', 'lic', this)"> <label for="licItem5002101">금속재료산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5006490" name="licItem" value="5006490" onclick="fnCheckItem('5006490', '금속재료시험기능사', 'lic', this)"> <label for="licItem5006490">금속재료시험기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5007102" name="licItem" value="5007102" onclick="fnCheckItem('5007102', '금속재창호기능사', 'lic', this)"> <label for="licItem5007102">금속재창호기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5008862" name="licItem" value="5008862" onclick="fnCheckItem('5008862', '금속재창호기능사보', 'lic', this)"> <label for="licItem5008862">금속재창호기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5000094" name="licItem" value="5000094" onclick="fnCheckItem('5000094', '금속제련기술사', 'lic', this)"> <label for="licItem5000094">금속제련기술사</label>
</span>

<span>
	<input type="checkbox" id="licItem5002102" name="licItem" value="5002102" onclick="fnCheckItem('5002102', '금속제련산업기사', 'lic', this)"> <label for="licItem5002102">금속제련산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5006105" name="licItem" value="5006105" onclick="fnCheckItem('5006105', '금형기능사', 'lic', this)"> <label for="licItem5006105">금형기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5000012" name="licItem" value="5000012" onclick="fnCheckItem('5000012', '금형기술사', 'lic', this)"> <label for="licItem5000012">금형기술사</label>
</span>

<span>
	<input type="checkbox" id="licItem5003061" name="licItem" value="5003061" onclick="fnCheckItem('5003061', '금형제작기능장', 'lic', this)"> <label for="licItem5003061">금형제작기능장</label>
</span>

<span>
	<input type="checkbox" id="licItem5003021" name="licItem" value="5003021" onclick="fnCheckItem('5003021', '기계가공기능장', 'lic', this)"> <label for="licItem5003021">기계가공기능장</label>
</span>

<span>
	<input type="checkbox" id="licItem5010010" name="licItem" value="5010010" onclick="fnCheckItem('5010010', '기계가공조립기능사', 'lic', this)"> <label for="licItem5010010">기계가공조립기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5003030" name="licItem" value="5003030" onclick="fnCheckItem('5003030', '기계검사및설치기능장', 'lic', this)"> <label for="licItem5003030">기계검사및설치기능장</label>
</span>

<span>
	<input type="checkbox" id="licItem5000872" name="licItem" value="5000872" onclick="fnCheckItem('5000872', '기계기술사', 'lic', this)"> <label for="licItem5000872">기계기술사</label>
</span>

<span>
	<input type="checkbox" id="licItem5000871" name="licItem" value="5000871" onclick="fnCheckItem('5000871', '기계기술사(정밀측정)', 'lic', this)"> <label for="licItem5000871">기계기술사(정밀측정)</label>
</span>

<span>
	<input type="checkbox" id="licItem5001080" name="licItem" value="5001080" onclick="fnCheckItem('5001080', '기계설계기사', 'lic', this)"> <label for="licItem5001080">기계설계기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5002031" name="licItem" value="5002031" onclick="fnCheckItem('5002031', '기계설계산업기사', 'lic', this)"> <label for="licItem5002031">기계설계산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5000710" name="licItem" value="5000710" onclick="fnCheckItem('5000710', '기계안전기술사', 'lic', this)"> <label for="licItem5000710">기계안전기술사</label>
</span>

<span>
	<input type="checkbox" id="licItem5009402" name="licItem" value="5009402" onclick="fnCheckItem('5009402', '기계자수공예기능사보', 'lic', this)"> <label for="licItem5009402">기계자수공예기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5007121" name="licItem" value="5007121" onclick="fnCheckItem('5007121', '기계정비기능사', 'lic', this)"> <label for="licItem5007121">기계정비기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5003121" name="licItem" value="5003121" onclick="fnCheckItem('5003121', '기계정비기능장', 'lic', this)"> <label for="licItem5003121">기계정비기능장</label>
</span>

<span>
	<input type="checkbox" id="licItem5002035" name="licItem" value="5002035" onclick="fnCheckItem('5002035', '기계정비산업기사', 'lic', this)"> <label for="licItem5002035">기계정비산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5003070" name="licItem" value="5003070" onclick="fnCheckItem('5003070', '기계제도기능장', 'lic', this)"> <label for="licItem5003070">기계제도기능장</label>
</span>

<span>
	<input type="checkbox" id="licItem5004150" name="licItem" value="5004150" onclick="fnCheckItem('5004150', '기계제도산업기사', 'lic', this)"> <label for="licItem5004150">기계제도산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5010011" name="licItem" value="5010011" onclick="fnCheckItem('5010011', '기계조립산업기사', 'lic', this)"> <label for="licItem5010011">기계조립산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5009392" name="licItem" value="5009392" onclick="fnCheckItem('5009392', '기계편물기능사보', 'lic', this)"> <label for="licItem5009392">기계편물기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5001601" name="licItem" value="5001601" onclick="fnCheckItem('5001601', '기상감정기사', 'lic', this)"> <label for="licItem5001601">기상감정기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5001600" name="licItem" value="5001600" onclick="fnCheckItem('5001600', '기상기사', 'lic', this)"> <label for="licItem5001600">기상기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5002510" name="licItem" value="5002510" onclick="fnCheckItem('5002510', '기상산업기사', 'lic', this)"> <label for="licItem5002510">기상산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5000891" name="licItem" value="5000891" onclick="fnCheckItem('5000891', '기상예보기술사', 'lic', this)"> <label for="licItem5000891">기상예보기술사</label>
</span>

<span>
	<input type="checkbox" id="licItem5006070" name="licItem" value="5006070" onclick="fnCheckItem('5006070', '기어절삭기능사', 'lic', this)"> <label for="licItem5006070">기어절삭기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5008061" name="licItem" value="5008061" onclick="fnCheckItem('5008061', '기어절삭기능사보', 'lic', this)"> <label for="licItem5008061">기어절삭기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5004070" name="licItem" value="5004070" onclick="fnCheckItem('5004070', '기어절삭산업기사', 'lic', this)"> <label for="licItem5004070">기어절삭산업기사</label>
</span>

<span>
	<input type="checkbox" id="licItem5007190" name="licItem" value="5007190" onclick="fnCheckItem('5007190', '기와기능사', 'lic', this)"> <label for="licItem5007190">기와기능사</label>
</span>

<span>
	<input type="checkbox" id="licItem5008950" name="licItem" value="5008950" onclick="fnCheckItem('5008950', '기와기능사보', 'lic', this)"> <label for="licItem5008950">기와기능사보</label>
</span>

<span>
	<input type="checkbox" id="licItem5007861" name="licItem" value="5007861" onclick="fnCheckItem('5007861', '기중기운전기능사', 'lic', this)"> <label for="licItem5007861">기중기운전기능사</label>
</span>
</div>
								</div>

								<!-- 키워드 검색시 나오는 div -->
								<div class="job-license-search" id="licSearch2" style="display:none;">
									<div class="scroll">
										<div class="label-wrap line-3" id="licResult2"></div>
									</div>

									<p class="txt">※ 분류 리스트로 검색하려면 [분류별보기] 버튼을 클릭하세요. <button type="button" class="button small btn-close-license-search" onclick="fnSelLicMain(0, '50000')">분류별보기</button></p>
								</div>
							</div>

							<button type="button" class="btn-close-block">자격증선택 닫기</button>
						</div>
					</div>
				</td>
			</tr>

			<tr>
				<th scope="row">
					<span class="label">전공</span>
				</th>
				<td>
					<!-- layer-group -->
					<div class="layer-group">
						<div class="btn-block">
							<a href="#jobMajor" class="button btn-open-block">전공 선택</a>
						</div>

						<div id="jobMajor" class="layer-block">
							<div class="job-major-select">
								<div class="search-area">
									<!-- 2018-11-02 문구 추가 -->
									<p class="reset mb10">전공은 최대 5개까지 선택할 수 있습니다.</p>

									<div class="mb10">
										<input style="ime-mode:active;" type="search" id="majorSearchTxt" onkeypress="if(event.keyCode==13) fnMajorSearch();" title="전공 검색어 입력" placeholder="전공 관련 키워드를 입력하세요. 예) 법학, 철학" class="input-text w560px">
										<button type="button" class="button" onclick="fnMajorSearch();">검색</button>
									</div>
								</div>

								<!-- 카테고리 선택 -->
								<!--
									<div class="cate"> 의 갯수에 따라서 다중 클래스 처리

									1개 : <div class="category-select">
									2개 : <div class="category-select col-2">
									3개 : <div class="category-select col-3">
									4개 : <div class="category-select col-4">
									5개 : <div class="category-select col-5">
								-->
								<div class="category-select col-3">
									<div class="cate">
										<p class="tit bg01">1차 계열</p>

										<ul>
											
												<li>
													<button type="button" onclick="fnGetMajor('2', '01','3');" class="chk">인문계열</button>
												</li>
											
												<li>
													<button type="button" onclick="fnGetMajor('2', '02','3');" class="chk">사회계열</button>
												</li>
											
												<li>
													<button type="button" onclick="fnGetMajor('2', '03','3');" class="chk">교육계열</button>
												</li>
											
												<li>
													<button type="button" onclick="fnGetMajor('2', '04','3');" class="chk">공학계열</button>
												</li>
											
												<li>
													<button type="button" onclick="fnGetMajor('2', '05','3');" class="chk">자연계열</button>
												</li>
											
												<li>
													<button type="button" onclick="fnGetMajor('2', '06','3');" class="chk">의약계열</button>
												</li>
											
												<li>
													<button type="button" onclick="fnGetMajor('2', '07','3');" class="chk">예체능계열</button>
												</li>
											
										</ul>
									</div>
									<div class="cate">
										<p class="tit bg02">2차 계열</p>
											<p class="txt" id="major2NoData">1차 계열을 선택하세요</p>
											<ul id="majorUl2" class="major2Data" style="display:none;"></ul>
<!--										</ul>--> <!-- markup 오류 삭제 -->
										<!--// 1차 분류 선택시 -->
									</div>
									<div class="cate">
										    <p class="tit bg03">3차 계열</p>
											<p class="txt" id="major3NoData">2차 계열을 선택하세요</p>
											<ul id="majorUl3" class="major3Data" style="display:none;"></ul>
<!--										</ul>--> <!-- markup 오류 삭제 -->
										<!--// 2차 분류 선택시 -->
									</div>
								</div>
								<!--// 카테고리 선택 -->

								<!-- 검색결과 레이어 -->
								<!--
									display : none,
									display : block 처리
								 -->
								<div class="job-major-search" style="display:none;">

									<p class="count">검색건수 : 총 <strong class="font-orange" id="majorCnt">185</strong>건</p>

									<!--
										2018-11-02

										4번째 p태그 삭제
									 -->
									<div class="scroll">
										<ul id="majorUl">

										</ul>
									</div>

									<p class="txt">※ 분류 리스트로 검색하려면 [분류별보기] 버튼을 클릭하세요. <button type="button" class="button small btn-close-major-search">분류별보기</button></p>
								</div>
								<!--// 검색결과 레이어 -->
							</div>

							<button type="button" class="btn-close-block">전공선택 닫기</button>
						</div>
					</div>
				</td>
			</tr>

			<tr>
				<th scope="row">
					<span class="label">외국어</span>
				</th>
				<td>
					<!-- layer-group -->
					<div class="layer-group">
						<div class="btn-block">
							<a href="#jobForeignLang" class="button btn-open-block">외국어 선택</a>
						</div>

						<div id="jobForeignLang" class="layer-block">
							<div class="careers-foreign-lang">
								<div class="label-wrap line-6">
									
										<span>
											<input type="checkbox" name="forItem" id="forItem01" title="영어" value="01" onclick="fnCheckItem('01', '영어', 'for', this)">
											<label for="forItem01">영어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem02" title="일어" value="02" onclick="fnCheckItem('02', '일어', 'for', this)">
											<label for="forItem02">일어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem07" title="중국어" value="07" onclick="fnCheckItem('07', '중국어', 'for', this)">
											<label for="forItem07">중국어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem09" title="아랍어" value="09" onclick="fnCheckItem('09', '아랍어', 'for', this)">
											<label for="forItem09">아랍어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem05" title="서반어" value="05" onclick="fnCheckItem('05', '서반어', 'for', this)">
											<label for="forItem05">서반어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem40" title="인도네시아어" value="40" onclick="fnCheckItem('40', '인도네시아어', 'for', this)">
											<label for="forItem40">인도네시아어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem39" title="말레이어" value="39" onclick="fnCheckItem('39', '말레이어', 'for', this)">
											<label for="forItem39">말레이어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem10" title="베트남어" value="10" onclick="fnCheckItem('10', '베트남어', 'for', this)">
											<label for="forItem10">베트남어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem16" title="타이어" value="16" onclick="fnCheckItem('16', '타이어', 'for', this)">
											<label for="forItem16">타이어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem03" title="독일어" value="03" onclick="fnCheckItem('03', '독일어', 'for', this)">
											<label for="forItem03">독일어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem04" title="불어" value="04" onclick="fnCheckItem('04', '불어', 'for', this)">
											<label for="forItem04">불어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem08" title="러시아어" value="08" onclick="fnCheckItem('08', '러시아어', 'for', this)">
											<label for="forItem08">러시아어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem11" title="이태리어" value="11" onclick="fnCheckItem('11', '이태리어', 'for', this)">
											<label for="forItem11">이태리어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem18" title="터키어" value="18" onclick="fnCheckItem('18', '터키어', 'for', this)">
											<label for="forItem18">터키어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem06" title="라틴어" value="06" onclick="fnCheckItem('06', '라틴어', 'for', this)">
											<label for="forItem06">라틴어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem12" title="포르투갈어" value="12" onclick="fnCheckItem('12', '포르투갈어', 'for', this)">
											<label for="forItem12">포르투갈어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem13" title="화란어" value="13" onclick="fnCheckItem('13', '화란어', 'for', this)">
											<label for="forItem13">화란어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem14" title="힌디어(북부인도어)" value="14" onclick="fnCheckItem('14', '힌디어(북부인도어)', 'for', this)">
											<label for="forItem14">힌디어(북부인도어)</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem15" title="이란어" value="15" onclick="fnCheckItem('15', '이란어', 'for', this)">
											<label for="forItem15">이란어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem17" title="스와힐리어" value="17" onclick="fnCheckItem('17', '스와힐리어', 'for', this)">
											<label for="forItem17">스와힐리어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem19" title="마이인도네이사어" value="19" onclick="fnCheckItem('19', '마이인도네이사어', 'for', this)">
											<label for="forItem19">마이인도네이사어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem20" title="한국어" value="20" onclick="fnCheckItem('20', '한국어', 'for', this)">
											<label for="forItem20">한국어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem21" title="만주어" value="21" onclick="fnCheckItem('21', '만주어', 'for', this)">
											<label for="forItem21">만주어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem22" title="몽고어" value="22" onclick="fnCheckItem('22', '몽고어', 'for', this)">
											<label for="forItem22">몽고어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem23" title="스페인어" value="23" onclick="fnCheckItem('23', '스페인어', 'for', this)">
											<label for="forItem23">스페인어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem24" title="스웨덴어" value="24" onclick="fnCheckItem('24', '스웨덴어', 'for', this)">
											<label for="forItem24">스웨덴어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem25" title="체코어" value="25" onclick="fnCheckItem('25', '체코어', 'for', this)">
											<label for="forItem25">체코어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem26" title="덴마크어" value="26" onclick="fnCheckItem('26', '덴마크어', 'for', this)">
											<label for="forItem26">덴마크어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem27" title="네덜란드어" value="27" onclick="fnCheckItem('27', '네덜란드어', 'for', this)">
											<label for="forItem27">네덜란드어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem28" title="에스토니아어" value="28" onclick="fnCheckItem('28', '에스토니아어', 'for', this)">
											<label for="forItem28">에스토니아어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem29" title="핀란드어" value="29" onclick="fnCheckItem('29', '핀란드어', 'for', this)">
											<label for="forItem29">핀란드어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem30" title="그리스어" value="30" onclick="fnCheckItem('30', '그리스어', 'for', this)">
											<label for="forItem30">그리스어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem31" title="헤브루어" value="31" onclick="fnCheckItem('31', '헤브루어', 'for', this)">
											<label for="forItem31">헤브루어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem32" title="헝가리어" value="32" onclick="fnCheckItem('32', '헝가리어', 'for', this)">
											<label for="forItem32">헝가리어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem33" title="아이슬란드어" value="33" onclick="fnCheckItem('33', '아이슬란드어', 'for', this)">
											<label for="forItem33">아이슬란드어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem34" title="라트비아어" value="34" onclick="fnCheckItem('34', '라트비아어', 'for', this)">
											<label for="forItem34">라트비아어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem35" title="리투아니아어" value="35" onclick="fnCheckItem('35', '리투아니아어', 'for', this)">
											<label for="forItem35">리투아니아어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem36" title="노르웨이어" value="36" onclick="fnCheckItem('36', '노르웨이어', 'for', this)">
											<label for="forItem36">노르웨이어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem37" title="폴란드어" value="37" onclick="fnCheckItem('37', '폴란드어', 'for', this)">
											<label for="forItem37">폴란드어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem38" title="루마니아어" value="38" onclick="fnCheckItem('38', '루마니아어', 'for', this)">
											<label for="forItem38">루마니아어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem41" title="방글라데시어" value="41" onclick="fnCheckItem('41', '방글라데시어', 'for', this)">
											<label for="forItem41">방글라데시어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem42" title="바스크어" value="42" onclick="fnCheckItem('42', '바스크어', 'for', this)">
											<label for="forItem42">바스크어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem43" title="벨로루시어 " value="43" onclick="fnCheckItem('43', '벨로루시어 ', 'for', this)">
											<label for="forItem43">벨로루시어 </label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem44" title="카탈로니아어" value="44" onclick="fnCheckItem('44', '카탈로니아어', 'for', this)">
											<label for="forItem44">카탈로니아어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem45" title="크로아티아어" value="45" onclick="fnCheckItem('45', '크로아티아어', 'for', this)">
											<label for="forItem45">크로아티아어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem46" title="페로스어" value="46" onclick="fnCheckItem('46', '페로스어', 'for', this)">
											<label for="forItem46">페로스어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem47" title="페르시아어" value="47" onclick="fnCheckItem('47', '페르시아어', 'for', this)">
											<label for="forItem47">페르시아어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem48" title="게일어" value="48" onclick="fnCheckItem('48', '게일어', 'for', this)">
											<label for="forItem48">게일어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem49" title="마세도니아어" value="49" onclick="fnCheckItem('49', '마세도니아어', 'for', this)">
											<label for="forItem49">마세도니아어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem50" title="말타어" value="50" onclick="fnCheckItem('50', '말타어', 'for', this)">
											<label for="forItem50">말타어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem51" title="레토로만어" value="51" onclick="fnCheckItem('51', '레토로만어', 'for', this)">
											<label for="forItem51">레토로만어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem52" title="라플란드어" value="52" onclick="fnCheckItem('52', '라플란드어', 'for', this)">
											<label for="forItem52">라플란드어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem53" title="세르비아어" value="53" onclick="fnCheckItem('53', '세르비아어', 'for', this)">
											<label for="forItem53">세르비아어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem54" title="슬로바키아어" value="54" onclick="fnCheckItem('54', '슬로바키아어', 'for', this)">
											<label for="forItem54">슬로바키아어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem55" title="슬로베니아어" value="55" onclick="fnCheckItem('55', '슬로베니아어', 'for', this)">
											<label for="forItem55">슬로베니아어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem56" title="소르비아어" value="56" onclick="fnCheckItem('56', '소르비아어', 'for', this)">
											<label for="forItem56">소르비아어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem57" title="수투어" value="57" onclick="fnCheckItem('57', '수투어', 'for', this)">
											<label for="forItem57">수투어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem58" title="총가어" value="58" onclick="fnCheckItem('58', '총가어', 'for', this)">
											<label for="forItem58">총가어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem59" title="츠와나어" value="59" onclick="fnCheckItem('59', '츠와나어', 'for', this)">
											<label for="forItem59">츠와나어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem60" title="우크라이나어" value="60" onclick="fnCheckItem('60', '우크라이나어', 'for', this)">
											<label for="forItem60">우크라이나어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem61" title="우르두어" value="61" onclick="fnCheckItem('61', '우르두어', 'for', this)">
											<label for="forItem61">우르두어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem62" title="벤다어" value="62" onclick="fnCheckItem('62', '벤다어', 'for', this)">
											<label for="forItem62">벤다어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem63" title="트란스카이어" value="63" onclick="fnCheckItem('63', '트란스카이어', 'for', this)">
											<label for="forItem63">트란스카이어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem64" title="이디시어" value="64" onclick="fnCheckItem('64', '이디시어', 'for', this)">
											<label for="forItem64">이디시어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem65" title="줄루어" value="65" onclick="fnCheckItem('65', '줄루어', 'for', this)">
											<label for="forItem65">줄루어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem66" title="미얀마어" value="66" onclick="fnCheckItem('66', '미얀마어', 'for', this)">
											<label for="forItem66">미얀마어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem67" title="라다크어" value="67" onclick="fnCheckItem('67', '라다크어', 'for', this)">
											<label for="forItem67">라다크어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem68" title="우즈베키스탄어" value="68" onclick="fnCheckItem('68', '우즈베키스탄어', 'for', this)">
											<label for="forItem68">우즈베키스탄어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem69" title="크메르어" value="69" onclick="fnCheckItem('69', '크메르어', 'for', this)">
											<label for="forItem69">크메르어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem70" title="카자흐어" value="70" onclick="fnCheckItem('70', '카자흐어', 'for', this)">
											<label for="forItem70">카자흐어</label>
										</span>
									
										<span>
											<input type="checkbox" name="forItem" id="forItem71" title="네팔어" value="71" onclick="fnCheckItem('71', '네팔어', 'for', this)">
											<label for="forItem71">네팔어</label>
										</span>
									
								</div>
							</div>

							<button type="button" class="btn-close-block">외국어 선택 닫기</button>
						</div>
					</div>
				</td>
			</tr>

			<tr>
				<th scope="row">
					<span class="label">기타 우대사항</span>
				</th>
				<td>
					<div class="label-wrap line-4">
						
							<span>
								<input type="checkbox" name="computerPreferentialParam" id="computerPreferentialParam1" title="문서작성 (워드프로세스 활용)" value="1" onclick="resultCheckBoxTemplate('computerPreferentialParam');">
								<label for="computerPreferentialParam1">
									
											
											
												문서작성 (워드프로세스 활용)
											
										

								</label>
							</span>
						
							<span>
								<input type="checkbox" name="computerPreferentialParam" id="computerPreferentialParam2" title="표계산 (스프레드시트 활용)  " value="2" onclick="resultCheckBoxTemplate('computerPreferentialParam');">
								<label for="computerPreferentialParam2">
									
											
											      스프레드시트(엑셀)
											
											
										

								</label>
							</span>
						
							<span>
								<input type="checkbox" name="computerPreferentialParam" id="computerPreferentialParam4" title="프레젠테이션 프로그램 활용" value="4" onclick="resultCheckBoxTemplate('computerPreferentialParam');">
								<label for="computerPreferentialParam4">
									
											
											
												프레젠테이션 프로그램 활용
											
										

								</label>
							</span>
						
							<span>
								<input type="checkbox" name="computerPreferentialParam" id="computerPreferentialParam6" title="회계프로그램" value="6" onclick="resultCheckBoxTemplate('computerPreferentialParam');">
								<label for="computerPreferentialParam6">
									
											
											
												회계프로그램
											
										

								</label>
							</span>
						
							<span>
								<input type="checkbox" name="computerPreferentialParam" id="computerPreferentialParam9" title="기타" value="9" onclick="resultCheckBoxTemplate('computerPreferentialParam');">
								<label for="computerPreferentialParam9">
									
											
											
												기타
											
										

								</label>
							</span>
						
						<span>
							<input type="checkbox" name="pfMatterPreferentialParam" id="pfMatterPreferentialParamA" title="장애인" value="A" onclick="f_disableEmpHopeANDEtcDisable('2');resultCheckBoxTemplate('pfMatterPreferentialParam');">
							<label for="pfMatterPreferentialParamA">장애인</label>
						</span>
						<span>
							<input type="checkbox" name="pfMatterPreferentialParam" id="pfMatterPreferentialParamB" title="(준)고령자(50세이상)" value="B" onclick="resultCheckBoxTemplate('pfMatterPreferentialParam');">
							<label for="pfMatterPreferentialParamB">(준)고령자(50세이상)</label>
						</span>

						
							
								<span>
									<input type="checkbox" name="pfMatterPreferentialParam" id="pfMatterPreferentialParam05" title="차량소지자" value="05" onclick="resultCheckBoxTemplate('pfMatterPreferentialParam');">
									<label for="pfMatterPreferentialParam05">
									차량소지자
									</label>
								</span>
							
						
							
								<span>
									<input type="checkbox" name="pfMatterPreferentialParam" id="pfMatterPreferentialParam14" title="운전면허증" value="14" onclick="resultCheckBoxTemplate('pfMatterPreferentialParam');">
									<label for="pfMatterPreferentialParam14">
									운전면허증
									</label>
								</span>
							
						
							
								<span>
									<input type="checkbox" name="pfMatterPreferentialParam" id="pfMatterPreferentialParam10" title="북한이탈주민" value="10" onclick="resultCheckBoxTemplate('pfMatterPreferentialParam');">
									<label for="pfMatterPreferentialParam10">
									북한이탈주민
									</label>
								</span>
							
						
							
								<span>
									<input type="checkbox" name="pfMatterPreferentialParam" id="pfMatterPreferentialParam09" title="장기복무 제대군인" value="09" onclick="resultCheckBoxTemplate('pfMatterPreferentialParam');">
									<label for="pfMatterPreferentialParam09">
									장기복무 제대군인
									</label>
								</span>
							
						
							
								<span>
									<input type="checkbox" name="pfMatterPreferentialParam" id="pfMatterPreferentialParam07" title="고용촉진장려금대상자" value="07" onclick="resultCheckBoxTemplate('pfMatterPreferentialParam');">
									<label for="pfMatterPreferentialParam07">
									고용촉진장려금대상자
									</label>
								</span>
							
						
							
								<span>
									<input type="checkbox" name="pfMatterPreferentialParam" id="pfMatterPreferentialParam08" title="보훈취업지원대상자" value="08" onclick="resultCheckBoxTemplate('pfMatterPreferentialParam');">
									<label for="pfMatterPreferentialParam08">
									보훈취업지원대상자
									</label>
								</span>
							
						
					</div>
				</td>
			</tr>
			

			<tr>
				<th scope="row">
					<span class="label">마감일</span>
				</th>
				<td>
					<input type="text" class="datepicker hasDatepicker" name="cloDateStdtParam" id="cloDateStdt" readonly="readonly" title="마감일 시작 날짜 선택" placeholder="yyyy.mm.dd" maxlength="10"><button type="button" class="ui-datepicker-trigger">마감일 시작 날짜 선택 버튼</button> ~
					<input type="text" class="datepicker hasDatepicker" name="cloDateEndtParam" id="cloDateEndt" readonly="readonly" title="마감일 마지막 날짜 선택" placeholder="yyyy.mm.dd" maxlength="10"><button type="button" class="ui-datepicker-trigger">마감일 마지막 날짜 선택 버튼</button>

					<div class="label-wrap line-0 inline-block ml20">
						<span>
							<input type="radio" id="cloTermSearchGbn0" name="cloTermSearchGbnParam" onclick="changeCloDateNew(this.id);fnRemoveDate('cloDateStdt','cloDateEndt','cloTermSearchGbn0');" value="all" checked="checked">
							<label for="cloTermSearchGbn0">전체</label>
						</span>

						
							<span>
								<input type="radio" onclick="changeCloDateNew(this.id);resultDateTemplate('마감일','cloDateStdt','cloDateEndt','cloTermSearchGbn0');" id="cloTermSearchGbn1" name="cloTermSearchGbnParam" value="D-0">
								<label for="cloTermSearchGbn1">오늘</label>
							</span>
						
							<span>
								<input type="radio" onclick="changeCloDateNew(this.id);resultDateTemplate('마감일','cloDateStdt','cloDateEndt','cloTermSearchGbn0');" id="cloTermSearchGbn2" name="cloTermSearchGbnParam" value="D-1">
								<label for="cloTermSearchGbn2">내일</label>
							</span>
						
							<span>
								<input type="radio" onclick="changeCloDateNew(this.id);resultDateTemplate('마감일','cloDateStdt','cloDateEndt','cloTermSearchGbn0');" id="cloTermSearchGbn3" name="cloTermSearchGbnParam" value="D-3">
								<label for="cloTermSearchGbn3">3일</label>
							</span>
						
							<span>
								<input type="radio" onclick="changeCloDateNew(this.id);resultDateTemplate('마감일','cloDateStdt','cloDateEndt','cloTermSearchGbn0');" id="cloTermSearchGbn4" name="cloTermSearchGbnParam" value="W-1">
								<label for="cloTermSearchGbn4">1주 이내</label>
							</span>
						
							<span>
								<input type="radio" onclick="changeCloDateNew(this.id);resultDateTemplate('마감일','cloDateStdt','cloDateEndt','cloTermSearchGbn0');" id="cloTermSearchGbn5" name="cloTermSearchGbnParam" value="W-2">
								<label for="cloTermSearchGbn5">2주 이내</label>
							</span>
						
							<span>
								<input type="radio" onclick="changeCloDateNew(this.id);resultDateTemplate('마감일','cloDateStdt','cloDateEndt','cloTermSearchGbn0');" id="cloTermSearchGbn6" name="cloTermSearchGbnParam" value="M-1">
								<label for="cloTermSearchGbn6">한달</label>
							</span>
						

					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">
					<span class="label">등록일</span>
				</th>
				<td>
					<input type="text" name="regDateStdtParam" id="regDateStdt" class="datepicker hasDatepicker" readonly="readonly" title="등록일 시작 날짜 선택" placeholder="yyyy.mm.dd" maxlength="10"><button type="button" class="ui-datepicker-trigger">등록일 시작 날짜 선택 버튼</button> ~
					<input type="text" name="regDateEndtParam" id="regDateEndt" class="datepicker hasDatepicker" readonly="readonly" title="등록일 끝 날짜 선택" placeholder="yyyy.mm.dd" maxlength="10"><button type="button" class="ui-datepicker-trigger">등록일 끝 날짜 선택 버튼</button>

					<div class="label-wrap line-0 inline-block ml20">
						<span>
							<input type="radio" id="termSearchGbn0" name="termSearchGbnParam" onclick="changeDateNew(this.id);fnRemoveDate('regDateStdt','regDateEndt','termSearchGbn0');" value="all" checked="checked">
							<label for="termSearchGbn0">전체</label>
						</span>
						
							<span>
								<input type="radio" onclick="changeDateNew(this.id);resultDateTemplate('등록일','regDateStdt','regDateEndt','termSearchGbn0');" id="termSearchGbn1" name="termSearchGbnParam" value="D-0">
								<label for="termSearchGbn1">오늘</label>
							</span>
						
							<span>
								<input type="radio" onclick="changeDateNew(this.id);resultDateTemplate('등록일','regDateStdt','regDateEndt','termSearchGbn0');" id="termSearchGbn2" name="termSearchGbnParam" value="D-3">
								<label for="termSearchGbn2">3일</label>
							</span>
						
							<span>
								<input type="radio" onclick="changeDateNew(this.id);resultDateTemplate('등록일','regDateStdt','regDateEndt','termSearchGbn0');" id="termSearchGbn3" name="termSearchGbnParam" value="W-1">
								<label for="termSearchGbn3">1주 이내</label>
							</span>
						
							<span>
								<input type="radio" onclick="changeDateNew(this.id);resultDateTemplate('등록일','regDateStdt','regDateEndt','termSearchGbn0');" id="termSearchGbn4" name="termSearchGbnParam" value="W-2">
								<label for="termSearchGbn4">2주 이내</label>
							</span>
						
							<span>
								<input type="radio" onclick="changeDateNew(this.id);resultDateTemplate('등록일','regDateStdt','regDateEndt','termSearchGbn0');" id="termSearchGbn5" name="termSearchGbnParam" value="M-1">
								<label for="termSearchGbn5">한달</label>
							</span>
						
					</div>
				</td>
			</tr>
			
			<tr>
				<th scope="row">
					<span class="label">정보제공처</span>
				</th>
				<td>
					<div class="label-wrap line-6">
						<span>
							<input type="checkbox" id="b_siteClcdall" name="b_siteClcd" value="all" onclick="fn_siteClcdGbn('all')" checked="checked">
							<label for="b_siteClcdall">전체</label>
						</span>

						
							<span>
								<input type="checkbox" id="b_siteClcdWORK" name="b_siteClcd" value="WORK" title="워크넷" onclick="fn_siteClcdGbn('WORK')">
								<label for="b_siteClcdWORK">워크넷</label>
							</span>
						
							<span>
								<input type="checkbox" id="b_siteClcdGOJ" name="b_siteClcd" value="GOJ" title="나라일터" onclick="fn_siteClcdGbn('GOJ')">
								<label for="b_siteClcdGOJ">나라일터</label>
							</span>
						
							<span>
								<input type="checkbox" id="b_siteClcdALI" name="b_siteClcd" value="ALI" title="알리오" onclick="fn_siteClcdGbn('ALI')">
								<label for="b_siteClcdALI">알리오</label>
							</span>
						
							<span>
								<input type="checkbox" id="b_siteClcdWIH" name="b_siteClcd" value="WIH" title="여성기업일자리허브" onclick="fn_siteClcdGbn('WIH')">
								<label for="b_siteClcdWIH">여성기업일자리허브</label>
							</span>
						
							<span>
								<input type="checkbox" id="b_siteClcdCLE" name="b_siteClcd" value="CLE" title="클린아이" onclick="fn_siteClcdGbn('CLE')">
								<label for="b_siteClcdCLE">클린아이</label>
							</span>
						
							<span>
								<input type="checkbox" id="b_siteClcdMMA" name="b_siteClcd" value="MMA" title="병역일터" onclick="fn_siteClcdGbn('MMA')">
								<label for="b_siteClcdMMA">병역일터</label>
							</span>
						
							<span>
								<input type="checkbox" id="b_siteClcdP" name="b_siteClcd" value="P" title="서울시" onclick="fn_siteClcdGbn('P')">
								<label for="b_siteClcdP">서울시</label>
							</span>
						
							<span>
								<input type="checkbox" id="b_siteClcdCJK" name="b_siteClcd" value="CJK" title="잡코리아" onclick="fn_siteClcdGbn('CJK')">
								<label for="b_siteClcdCJK">잡코리아</label>
							</span>
						
							<span>
								<input type="checkbox" id="b_siteClcdCSI" name="b_siteClcd" value="CSI" title="사람인" onclick="fn_siteClcdGbn('CSI')">
								<label for="b_siteClcdCSI">사람인</label>
							</span>
						
							<span>
								<input type="checkbox" id="b_siteClcdCIN" name="b_siteClcd" value="CIN" title="인크루트" onclick="fn_siteClcdGbn('CIN')">
								<label for="b_siteClcdCIN">인크루트</label>
							</span>
						
							<span>
								<input type="checkbox" id="b_siteClcdCCN" name="b_siteClcd" value="CCN" title="커리어" onclick="fn_siteClcdGbn('CCN')">
								<label for="b_siteClcdCCN">커리어</label>
							</span>
						
							<span>
								<input type="checkbox" id="b_siteClcdOEW" name="b_siteClcd" value="OEW" title="공채속보" onclick="fn_siteClcdGbn('OEW')">
								<label for="b_siteClcdOEW">공채속보</label>
							</span>
						
							<span>
								<input type="checkbox" id="b_siteClcdCIT" name="b_siteClcd" value="CIT" title="ITnJOB" onclick="fn_siteClcdGbn('CIT')">
								<label for="b_siteClcdCIT">ITnJOB</label>
							</span>
						
							<span>
								<input type="checkbox" id="b_siteClcdMIT" name="b_siteClcd" value="MIT" title="마이다스인" onclick="fn_siteClcdGbn('MIT')">
								<label for="b_siteClcdMIT">마이다스인</label>
							</span>
						
							<span>
								<input type="checkbox" id="b_siteClcdCPR" name="b_siteClcd" value="CPR" title="팜리크루트" onclick="fn_siteClcdGbn('CPR')">
								<label for="b_siteClcdCPR">팜리크루트</label>
							</span>
						
							<span>
								<input type="checkbox" id="b_siteClcdWFC" name="b_siteClcd" value="WFC" title="한국사회보장정보원" onclick="fn_siteClcdGbn('WFC')">
								<label for="b_siteClcdWFC">한국사회보장정보원</label>
							</span>
						
							<span>
								<input type="checkbox" id="b_siteClcdIBK" name="b_siteClcd" value="IBK" title="i-ONE JOB" onclick="fn_siteClcdGbn('IBK')">
								<label for="b_siteClcdIBK">i-ONE JOB</label>
							</span>
						
							<span>
								<input type="checkbox" id="b_siteClcdPRD" name="b_siteClcd" value="PRD" title="알앤디잡" onclick="fn_siteClcdGbn('PRD')">
								<label for="b_siteClcdPRD">알앤디잡</label>
							</span>
						
							<span>
								<input type="checkbox" id="b_siteClcdKOS" name="b_siteClcd" value="KOS" title="중소벤처기업진흥공단" onclick="fn_siteClcdGbn('KOS')">
								<label for="b_siteClcdKOS">중소벤처기업진흥공단</label>
							</span>
						
					</div>
				</td>
			</tr>
			
		</tbody>
	</table>

	<ul class="dot-star-list">
		<li><strong class="font-black">『고용상 연령차별금지 및 고령자 고용촉진에 관한 법률』 이 시행됨에 따라 <span class="font-orange">채용정보에서 연령이 삭제</span>되었습니다.</strong></li>
		<li>
			<strong><span class="font-orange">취업사기 방지</span>를 위한 특별안내</strong>
			<!--
				팝업창 사이즈 및 파일명은 추후 변경 가능
			 -->
<!-- 			<button onclick="keis.window.newWindow('/contentsPopUp.do?relAddr=/common/popup/PopPreventEmpSwinGuide', null, 500, 770, 'yes','no','no','no','no');return false;" class="button">자세히보기</button> -->
			<a href="javscript:void(0);" onclick="keis.window.newWindow('/contentsPopUp.do?relAddr=/common/popup/PopPreventEmpSwinGuide', null, 500, 770, 'yes','no','no','no','no');return false;" title="새창 열림" class="button">자세히보기</a>
		</li>
	</ul>
</div>

	<!--
		2018-11-01 마크업 수정
		버튼 태그 안의 i 태그 class 변경 및 위치 이동
	-->
	<div class="search-condition-toggle">
		<button type="button" class="button open" onclick="fn_moreButton('Y')">검색조건 더보기 <i class="iconset ico-arr-down-small"></i></button>
		<button type="button" class="button close" onclick="fn_moreButton('N')">검색조건 접기 <i class="iconset ico-arr-up-small"></i></button>
	</div>
</div>

<!--
	2018-11-19 신규 추가

	class 주의!!!!

	직종 키워드 검색은 class 가 careers-search type2 입니다.
 -->
<div class="careers-search type2 on" id="jobsKeywordLine" style="display:none">
	<div class="tit-bg">
		<strong>직종 키워드 재검색</strong>
		<span>키워드를 클릭하시면 해당 채용공고를 검색하실 수 있습니다.</span>
	</div>

	<span class="acc-link-careers-search">아래는 채용정보 상세검색 조건 추가 표 영역입니다</span><div class="careers-search-table add-table-wrap">
		<table>
			<caption>채용정보 상세검색 조건 추가 표</caption>
			<colgroup>
				<col style="width:300px;">
				<col>
			</colgroup>
			<thead>
				<tr>
					<th scope="col">직종</th>
					<th scope="col">키워드</th>
				</tr>
			</thead>
			<tbody id="jobsKeywordList">
			</tbody>
		</table>
	</div>

	<div class="search-condition-toggle">
		<button type="button" class="button open">직종 키워드 더보기 <i class="iconset ico-arr-down-small"></i></button>
		<button type="button" class="button close">직종 키워드 접기 <i class="iconset ico-arr-up-small"></i></button>
	</div>
</div>
<!--// 2018-11-19 신규 추가 -->

<!--
	검색결과 보일때
	<div class="search-result-tag on">

	검색결과 안보일때
	<div class="search-result-tag">
 -->


<div class="search-result-tag on">

	<div class="left">
		<p class="tit">검색결과</p>
		<p class="count">
			<em class="futura">141,174</em>
			<span>건</span>
		</p>

	</div>

	<div class="list" id="selectedId">

	
<p id="empTpGbcdParamNm1" class="_templListInfo">[<span>상용직</span>
<button type="button" class="btn-del" id="btn_del" onclick="fnRemoveCheckNm('1', 'empTpGbcdParam');f_requestSearchListCnt(); return false">상용직 삭제</button>]
</p>
</div>

	<div class="btn">
			<button type="button" onclick="fnSearchReset();"><i class="iconset ico-reset"></i> 초기화</button>

			
			<button type="button" onclick="f_popCondCustmadeInfo();" title="새창"><i class="iconset ico-save"></i> 맞춤채용 저장</button>
				
			
		</div>

	<div class="right">
		<button type="button" onclick="goSubmit();">검색</button>
	</div>
</div>




<script type="text/template" id="resultTemplate">
<p id="_keyNo_" class="_templListInfo">[<span>_keyNm_</span>
<input type="hidden" id="_keyNoId_" name="_kayNmParam_" value="_kayNoParam_" />
<button type="button" class="btn-del" id="btn_del" onclick="fnRemoveRegionNm('_keyNoVal_', '_keyParam_');f_requestSearchListCnt(); return false">_keyNm_ 삭제</button>]
</p>
</script>


<script type="text/template" id="payTypeTemplate">
<p id="_keyNo_" class="_templListInfo">[<span>_keyNm_</span>
<button type="button" class="btn-del" onclick="fnPayType('');f_requestSearchListCnt(); return false">_keyNm_ 삭제</button>]
</p>
</script>


<script type="text/template" id="buttonTemplate">
<p id="_keyNo_" class="_templListInfo">[<span>_keyNm_</span>
<button type="button" class="btn-del" onclick="fnRemoveButtonNm('_keyNoVal_', '_keyParam_');f_requestSearchListCnt(); return false">_keyNm_ 삭제</button>]
</p>
</script>


<script type="text/template" id="dateTemplate">
<p id="_keyNo_" class="_templListInfo">[<span>_keyNm_</span>
<button type="button" class="btn-del" onclick="fnRemoveDate('_keyNoVal1_', '_keyNoVal2_', '_keyNoVal3_');f_requestSearchListCnt(); return false">_keyNm_ 삭제</button>]
</p>
</script>


<script type="text/template" id="checkboxTemplate">
<p id="_keyNo_" class="_templListInfo">[<span>_keyNm_</span>
<button type="button" class="btn-del" id="btn_del" onclick="fnRemoveCheckNm('_keyNoVal_', '_keyParam_');f_requestSearchListCnt(); return false">_keyNm_ 삭제</button>]
</p>
</script>


<script type="text/template" id="keywordTemplate">
<p id="_keyNo_" class="_templListInfo">[<span>_keyNm_</span>
<button type="button" class="btn-del" onclick="fnRemoveKeywordNm('_keyNoVal_', '_keyParam_');f_requestSearchListCnt(); return false">_keyNm_ 삭제</button>]
</p>
</script>


<script type="text/template" id="notKeywordTemplate">
<p id="_keyNo_" class="_templListInfo">[<span>_keyNm_</span>
<button type="button" class="btn-del" onclick="fnRemoveNotKeywordNm('_keyNoVal_', '_keyParam_');f_requestSearchListCnt(); return false">_keyNm_ 삭제</button>]
</p>
</script>



<script type="text/template" id="smallGiantsTypeTemplate">
<li id="smallGiantsType2__smallGiantsTypeKey_">
	<button type="button" onclick="fnSmallGiantsType2('_smallGiantsTypeValue_','_smallGiantsTypeName1_')">_smallGiantsTypeName2_</button>
</li>
</script>



<script type="text/template" id="staAreaTemplate">
	<li id="listStaArea__staAreaKey_">
		<button type="button"  id="area__staAreaId_" onclick="fnRequestStaAreaCodeList2('_staAreaValue_')" title="_staAreaName_ 선택">_staAreaName_</button>
	</li>
</script>



<script type="text/template" id="checkSubwayTemplate">
<span id="listCheckSubWay__checkSubwayNo0_">
	<input type="checkbox" id="checkSubway_checkSubwayNo1_" name="checkSubway"  onclick="f_checkStaArea(this, '_checkSubwayNmVal_');" value="_checkSubwayValue_" checked=""/>
	<label for="checkSubway_checkSubwayNo2_">_checkSubwayNm_</label>
</span>
</script>



<script type="text/template" id="subwayDepth3Template">
<p id="subwayDepth3__codeCd1_" class="_templListInfo">[<span>_codeNm_</span>
<input type="hidden" id="stationParam" name="stationParam" value="_codeValue_" />
<input type="hidden" name="stationNmParam" value="_codeValueNm_" />
<button type="button" class="btn-del" onclick="fnDepthDelete('_codeCd2_');f_requestSearchListCnt();">_codeNm_ 삭제</button>]
</p>
</script>


<!-- <script type="text/template" id="depth1SelCodeListTemplate">
<li id="selCodeList1_codeCd1_">
<button type="button" onclick="fnRequestRegionSubList('_codeCd2_')" id="selCodeTitle_codeCd3_" title="_codeNm_ 선택">_codeNm_</button>
</li>
</script> -->


<!-- <script type="text/template" id="depth2SelCodeListTemplate">
<span id="selCodeList2_codeCd1_">
	<input type="checkbox" id="region_codeCd2_" name="checkRegion" value="_codeCd3_" onclick="fnDepth3View(this, '_codeValueNm_')" checked="" />
	<label for="region_codeCd4_">_codeNm_</label>
</span>
</script> -->



<!-- <script type="text/template" id="depth3SelCodeTemplate">
<p id="selCodeList3_codeCd1_" class="_templListInfo">[<span id="codeValueNm3_codeCd3_">_codeNm_</span>
<input type="hidden" name="Depth2SelCodeVal" id="Depth2SelCodeVal" value="_codeValue_"/>
<button type="button" class="btn-del" onclick="fnDepth3Delete('_codeCd2_');f_requestSearchListCnt();">_codeNm_ 삭제</button>]
</p>
</script>-->



<script type="text/template" id="licItemTemplate">
<span>
	<input type="checkbox" id="licItem@cd1@" name="licItem" value="@cd2@" onclick="fnCheckItem('@cd2@', '@nm@', '@type@', this)" checked=""/> <label for="licItem@cd1@">@nm@</label>
</span>
</script>

<script type="text/template" id="majorItemTemplate">
<li>
	<p>@nm1@</p>
	<p>@nm2@</p>
	<p><input type="checkbox" id="majorItem@cd1@" name="majorItem" onclick="fnCheckItem('@cd2@', '@nm3@', '@type@', this);" checked="" /> <label for="majorItem@cd1@">@nm3@</label></p>
	<p>@nm4@</p>
</li>
</script>

<script type="text/template" id="majorItemTemplate2">
<li>
	<button type="button" onclick="fnGetMajor('3', '@cd1@','3')" class="chk">@nm@</button>
</li>
</script>

<script type="text/template" id="majorItemTemplate3">
<li>
	<button type="button" onclick="fnClickItem('@cd1@', '@nm@', '@type@');f_requestSearchListCnt();" class="chk">@nm@</button>
</li>
</script>
	<div>
<input type="hidden" name="_csrf" value="0f3805e8-752c-4f43-9d2c-4bbf8f1ddd4b">
</div></form>
</body>
</html>