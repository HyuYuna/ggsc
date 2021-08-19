<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
	
  <script>
	
	function fn_agree_check() {
		if($("input:checkbox[name='agree']").is(":checked") == false || $("input:checkbox[name='agree2']").is(":checked") == false) {
			alert("이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.");
			return false;
		}
		location.href = "/gnoincoun/join.do";
	}
	
</script>
<style>
	#wrap {width: 50%; margin: auto;}
</style>
<section class="service-2 section">
	<div id="wrap">
        <h2 class="title">이용약관</h2>
	  			<form class="form-wrap" id="frm" name="frm" method="post">
          <div class="form-group line bt bb pt15 pb10" style="width: 100%; height: 300px; overflow: hidden; overflow-y: auto; white-space: pre">
제 1 조 (목적)
이 약관은 현재 홈페이지에서 제공하는 서비스의 이용과 관련하여 기관과 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.

제 2 조 (정의)
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
"서비스"라 함은 "회원"이 이용할 수 있는 서비스를 의미합니다.
"회원"이라 함은 "서비스"에 접속하여 이 약관에 따라 가입을 하고 "서비스"를 이용하는 고객을 말합니다.
"아이디(ID)"라 함은 "회원"의 식별과 "서비스" 이용을 위하여 "회원"이 정하고 위 기관과 승인하는 문자와 숫자의 조합을 의미합니다.
"비밀번호"라 함은 "회원"이 부여 받은 "아이디와 일치되는 "회원"임을 확인하고 비밀보호를 위해 "회원" 자신이 정한 문자 또는 숫자의 조합을 의미합니다.
"게시물"이라 함은 "회원"이 "서비스"를 이용함에 있어 "서비스상"에 게시한 내용을 의미합니다.

제 3 조 (약관의 게시와 개정)
기관이 전항에 따라 개정약관을 공지 또는 통지하면서 회원에게 30일 기간 내에 의사표시를 하지 않으면 의사표시가 표명된 것으로 본다는 뜻을 명확하게 공지 또는 통지하였음에도 회원이 명시적으로 거부의 의사표시를 하지 아니한 경우 회원이 개정약관에 동의한 것으로 봅니다.
회원이 개정약관의 적용에 동의하지 않는 경우 기관은 개정 약관의 내용을 적용할 수 없으며, 이 경우 회원은 이용계약을 해지할 수 있습니다. 다만, 기존 약관을 적용할 수 없는 특별한 사정이 있는 경우에는 기관은 이용계약을 해지할 수 있습니다.

제 4 조 (약관의 해석)
위 기관은 별도의 이용약관 및 정책을 둘 수 있습니다.
이 약관에서 정하지 아니한 사항이나 해석에 대해서는 관계법령 또는 상관례에 따릅니다.

제 5 조 (이용계약 체결)
이용계약은 "회원"이 되고자 하는 자(이하 "가입신청자")가 약관의 내용에 대하여 동의를 한 다음 회원가입신청을 하고 위 기관과 이러한 신청에 대하여 승낙함으로써 체결됩니다.
위 기관은 "가입신청자"의 신청에 대하여 "서비스" 이용을 승낙함을 원칙으로 합니다. 다만, 여러가지 실격사항에 대하여 승낙을 하지 않거나 사후에 이용계약을 해지할 수 있습니다.
제1항에 따른 신청에 있어 위 기관은 "회원"의 종류에 따라 전문기관을 통한 실명확인 및 본인인증을 요청할 수 있습니다.
위 기관은 서비스관련설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다.
제2항과 제4항에 따라 회원가입신청의 승낙을 하지 아니하거나 유보한 경우, 위 기관은 원칙적으로 이를 가입신청자에게 알리도록 합니다.
이용계약의 성립 시기는 위 기관과 가입완료를 신청절차 상에서 표시한 시점으로 합니다.
위 기관은 "회원"에 대해 기관정책에 따라 등급별로 구분하여 이용시간, 이용횟수, 서비스 메뉴 등을 세분하여 이용에 차등을 둘 수 있습니다.
위 기관은 "회원"에 대하여 "영화및비디오물의진흥에관한법률" 및 "청소년보호법"등에 따른 등급 및 연령 준수를 위해 이용제한이나 등급별 제한을 할 수 있습니다.

제 6 조 (회원정보의 변경)
"회원"은 개인정보관리화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다. 다만, 서비스 관리를 위해 필요한 실명, 주민등록번호, 아이디 등은 수정이 불가능합니다.
"회원"은 회원가입신청 시 기재한 사항이 변경되었을 경우 온라인으로 수정을 하거나 전자우편 기타 방법으로 위 기관에 대하여 그 변경사항을 알려야 합니다.
제2항의 변경사항을 위 기관에 알리지 않아 발생한 불이익에 대하여 위 기관은 책임지지 않습니다.

제 7 조 (개인정보보호 의무)
위 기관은 "정보통신망법" 등 관계 법령이 정하는 바에 따라 "회원"의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및 사용에 대해서는 관련법 및 위 기관의 개인정보취급방침이 적용됩니다. 다만, 위 기관의 공식 사이트 이외의 링크된 사이트에서는 위 기관의 개인정보취급방침이 적용되지 않습니다.
제 8 조 ("회원"의 "아이디" 및 "비밀번호"의 관리에 대한 의무)
"회원"의 "아이디"와 "비밀번호"에 관한 관리책임은 "회원"에게 있으며, 이를 제3자가 이용하도록 하여서는 안 됩니다.
위 기관은 "회원"의 "아이디"가 개인정보 유출 우려가 있거나, 반사회적 또는 미풍양속에 어긋나거나 위 기관 및 위 기관의 운영자로 오인한 우려가 있는 경우, 해당 "아이디"의 이용을 제한할 수 있습니다.
"회원"은 "아이디" 및 "비밀번호"가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 위 기관에 통지하고 위 기관의 안내에 따라야 합니다.
제3항의 경우에 해당 "회원"이 위 기관에 그 사실을 통지하지 않거나, 통지한 경우에도 위 기관의 안내에 따르지 않아 발생한 불이익에 대하여 위 기관은 책임지지 않습니다.

제 9 조 ("회원"에 대한 통지)
위 기관과 "회원"에 대한 통지를 하는 경우 이 약관에 별도 규정이 없는 한 서비스 내 전자우편주소, 전자쪽지 등으로 할 수 있습니다.
위 기관은 "회원" 전체에 대한 통지의 경우 7일 이상 위 기관의 게시판에 게시함으로써 제1항의 통지에 갈음할 수 있습니다.

제 10 조 (위 기관의 의무)
위 기관은 관련법과 이 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적이고 안정적으로 "서비스"를 제공하기 위하여 최선을 다하여 노력합니다.
위 기관은 "회원"이 안전하게 "서비스"를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위해 보안시스템을 갖추어야 하며 개인정보취급방침을 공시하고 준수합니다.
위 기관은 서비스이용과 관련하여 "회원"으로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 처리하여야 합니다. "회원"이 제기한 의견이나 불만사항에 대해서는 게시판을 활용하거나 전자우편 등을 통하여 "회원"에게 처리과정 및 결과를 전달합니다.

제 11 조 ("회원"의 의무)
"회원"은 관계법, 이 약관의 규정, 이용안내 및 "서비스"와 관련하여 공지한 주의사항, 위 기관과 통지하는 사항 등을 준수하여야 하며, 기타 위 기관의 업무에 방해되는 행위를 하여서는 안 됩니다.
"회원"은 다음 행위를 하여서는 안 됩니다.
신청 또는 변경 시 허위내용의 등록
타인의 정보도용
위 기관과 게시한 정보의 변경
위 기관과 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
위 기관과 기타 제3자의 저작권 등 지적재산권에 대한 침해
위 기관 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 "서비스"에 공개 또는 게시하는 행위
기관의 동의 없이 영리를 목적으로 "서비스"를 사용하는 행위
기타 불법적이거나 부당한 행위

제 12 조 ("서비스"의 제공 등)
기관은 회원에게 홈페이지의 모든 서비스를 제공합니다.
기관은 "서비스"를 일정범위로 분할하여 각 범위 별로 이용가능시간을 별도로 지정할 수 있습니다. 다만, 이러한 경우에는 그 내용을 사전에 공지합니다.
"서비스"는 연중무휴, 1일 24시간 제공함을 원칙으로 합니다.
위 기관은 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 "서비스"의 제공을 일시적으로 중단할 수 있습니다. 이 경우 위 기관은 제9조["회원"에 대한 통지]에 정한 방법으로 "회원"에게 통지합니다. 다만, 위 기관과 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다.
위 기관은 서비스의 제공에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검시간은 서비스제공화면에 공지한 바에 따릅니다.

제 13 조 ("서비스"의 변경)
위 기관은 상당한 이유가 있는 경우에 운영상, 기술상의 필요에 따라 제공하고 있는 전부 또는 일부 "서비스"를 변경할 수 있습니다.
"서비스"의 내용, 이용방법, 이용시간에 대하여 변경이 있는 경우에는 변경사유, 변경될 서비스의 내용 및 제공일자 등은 그 변경 전 7일 이상 해당 서비스 초기화면에 게시하여야 합니다.
위 기관은 무료로 제공되는 서비스의 일부 또는 전부를 기관의 정책 및 운영의 필요상 수정, 중단, 변경할 수 있으며, 이에 대하여 관련법에 특별한 규정이 없는 한 "회원"에게 별도의 보상을 하지 않습니다.

제 14 조 (정보의 제공 및 광고의 게재)
위 기관은 "회원"이 "서비스" 이용 중 필요하다고 인정되는 다양한 정보를 공지사항이나 전자우편 등의 방법으로 "회원"에게 제공할 수 있습니다. 다만, "회원"은 관련법에 따른 거래관련 정보 및 고객문의 등에 대한 답변 등을 제외하고는 언제든지 전자우편 등에 대해서 수신 거절을 할 수 있습니다.
제1항의 정보를 전화 및 모사전송기기에 의하여 전송하려고 하는 경우에는 "회원"의 사전 동의를 받아서 전송합니다. 다만, "회원"의 거래관련 정보 및 고객문의 등에 대한 회신에 있어서는 제외됩니다.
위 기관은 "서비스"의 운영과 관련하여 서비스 화면, 홈페이지, 전자우편 등에 광고를 게재할 수 있습니다. 광고가 게재된 전자우편 등을 수신한 "회원"은 수신거절을 위 기관에게 할 수 있습니다.

제 15 조 ("게시물"의 저작권)
"회원"이 "서비스" 내에 게시한 "게시물"의 저작권은 해당 게시물의 저작자에게 귀속됩니다.
"회원"이 "서비스" 내에 게시하는 "게시물"은 검색결과 내지 "서비스" 및 관련 프로모션 등에 노출될 수 있으며, 해당 노출을 위해 필요한 범위 내에서는 일부 수정, 복제, 편집되어 게시될 수 있습니다. 이 경우, 기관는 저작권법 규정을 준수하며, "회원"은 언제든지 고객센터 또는 "서비스" 내 관리기능을 통해 해당 게시물에 대해 삭제, 검색결과 제외, 비공개 등의 조치를 취할 수 있습니다.
위 기관은 제2항 이외의 방법으로 "회원"의 "게시물"을 이용하고자 하는 경우에는 전화, 팩스, 전자우편 등을 통해 사전에 "회원"의 동의를 얻어야 합니다.

제 16 조 ("게시물"의 관리)
"회원"의 "게시물"이 "정보통신망법" 및 "저작권법"등 관련법에 위반되는 내용을 포함하는 경우, 권리자는 관련법이 정한 절차에 따라 해당 "게시물"의 게시중단 및 삭제 등을 요청할 수 있으며, 위 기관은 관련법에 따라 조치를 취하여야 합니다.
위 기관은 전항에 따른 권리자의 요청이 없는 경우라도 권리침해가 인정될 만한 사유가 있거나 기타 기관 정책 및 관련법에 위반되는 경우에는 관련법에 따라 해당 "게시물"에 대해 임시조치 등을 취할 수 있습니다.
본 조에 따른 세부절차는 "정보통신망법" 및 "저작권법"이 규정한 범위 내에서 위 기관과 정한 "게시중단요청서비스"에 따릅니다.

제 17 조 (권리의 귀속)
"서비스"에 대한 저작권 및 지적재산권은 위 기관에 귀속됩니다. 단, "회원"의 "게시물" 및 제휴계약에 따라 제공된 저작물 등은 제외합니다.
위 기관은 서비스와 관련하여 "회원"에게 위 기관과 정한 이용조건에 따라 홈페이지 이용할 수 있는 이용권만을 부여하며, "회원"은 이를 양도, 판매, 담보제공 등의 처분행위를 할 수 없습니다.

제 18 조 (계약해제, 해지 등)
"회원"은 언제든지 서비스초기화면의 고객센터 또는 내 정보 관리 메뉴 등을 통하여 이용계약 해지 신청을 할 수 있으며, 위 기관은 관련법 등이 정하는 바에 따라 이를 즉시 처리하여야 합니다.
"회원"이 계약을 해지할 경우, 관련법 및 개인정보취급방침에 따라 위 기관과 회원정보를 보유하는 경우를 제외하고는 해지 즉시 "회원"의 모든 데이터는 소멸됩니다.
"회원"이 계약을 해지하는 경우, "회원"이 작성한 "게시물" 중 메일, 블로그 등과 같이 본인 계정에 등록된 게시물 일체는 삭제됩니다. 다만, 타인에 의해 담기, 스크랩 등이 되어 재게시되거나, 공용게시판에 등록된 "게시물" 등은 삭제되지 않으니 사전에 삭제 후 탈퇴하시기 바랍니다.

제 19 조 (이용제한 등)
위 기관은 "회원"이 이 약관의 의무를 위반하거나 "서비스"의 정상적인 운영을 방해한 경우, 경고, 일시정지, 영구이용정지 등으로 "서비스" 이용을 단계적으로 제한할 수 있습니다.
위 기관은 전항에도 불구하고, "주민등록법"을 위반한 명의도용 및 결제도용, "저작권법" 및 "컴퓨터프로그램보호법"을 위반한 불법프로그램의 제공 및 운영방해, "정보통신망법"을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과 같이 관련법을 위반한 경우에는 즉시 영구이용정지를 할 수 있습니다. 위반시 언제든지 삭제 할수 있으며 위 기관은 이에 대해 별도로 보상하지 않습니다.
위 기관은 "회원"이 계속해서 3개월 이상 로그인하지 않는 경우, 회원정보의 보호 및 운영의 효율성을 위해 이용을 제한할 수 있습니다.
위 기관은 본 조의 이용제한 범위 내에서 제한의 조건 및 세부내용은 이용제한정책 및 개별 서비스상의 운영정책에서 정하는 바에 의합니다.
본 조에 따라 "서비스" 이용을 제한하거나 계약을 해지하는 경우에는 위 기관은 제9조["회원"에 대한 통지]에 따라 통지합니다.
"회원"은 본 조에 따른 이용제한 등에 대해 위 기관과 정한 절차에 따라 이의신청을 할 수 있습니다. 이 때 이의가 정당하다고 위 기관과 인정하는 경우 위 기관은 즉시 "서비스"의 이용을 재개합니다.

제 20 조 (책임제한)
위 기관은 천재지변 또는 이에 준하는 불가항력으로 인하여 "서비스"를 제공할 수 없는 경우에는 "서비스" 제공에 관한 책임이 면제됩니다.
위 기관은 "회원"의 귀책사유로 인한 "서비스" 이용의 장애에 대하여는 책임을 지지 않습니다.
위 기관은 "회원"이 "서비스"와 관련하여 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 책임을 지지 않습니다.
위 기관은 "회원" 간 또는 "회원"과 제3자 상호간에 "서비스"를 매개로 하여 거래 등을 한 경우에는 책임이 면제됩니다.
위 기관은 무료로 제공되는 서비스 이용과 관련하여 관련법에 특별한 규정이 없는 한 책임을 지지 않습니다.

제 21 조 (준거법 및 재판관할)
위 기관과 "회원" 간 제기된 소송은 대한민국법을 준거법으로 합니다.
위 기관과 "회원"간 발생한 분쟁에 관한 소송은 민사소송법 상의 관할법원에 제소합니다.

부칙
이 약관은 2009년 1월 1부터 적용됩니다.
          </div>
          <div style="width: 100%;">
	          	<span class="checkbox-custom"><input type="checkbox" id="agree" name="agree" value="Y"><label for="agree"><i></i><span>약관 동의</span></label></span>
          	</div>
          <h3>개인정보취급방침</h3>
          <div class="form-group line bt bb pt15 pb10" style="width: 100%; height: 300px; overflow: hidden; overflow-y: auto; white-space: pre">
수집하는 개인정보의 항목
회원가입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 성명, 아이디, 비밀번호, 이메일 주소, 휴대폰 번호 와 같은 개인정보를 수집하고 있습니다.
서비스 이용과정에서 IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록과 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
부가 서비스 및 맞춤식 서비스 이용 과정에서 해당 서비스의 이용자에 한해서만 주소, 연락처, 사용 이동통신사, 계좌번호와 같은 정보들이 수집될 수 있습니다.
개인정보 수집방법 : 홈페이지(회원가입)

개인정보의 수집 및 이용 목적
서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
컨텐츠 제공, 특정 맞춤 서비스 제공, 물품배송 또는 청구서 등 발송, 본인인증, 구매 및 요금 결제, 요금추심
회원관리
회원제 서비스 이용 및 제한적 본인 확인제에 따른 본인확인, 개인식별, 불량회원의 부정 이용방지와 비인가 사용방지, 가입의사 확인, 가입 및 가입횟수 제한, 추후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달
신규 서비스 개발 및 마케팅
신규 서비스 개발 및 맞춤 서비스 제공, 통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 접속빈도 파악, 회원의 서비스 이용에 대한 통계

개인정보의 보유 및 이용기간
이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.
기관 내부 방침에 의해 부정이용자를 방지 하기 위해 부정이용기록을 하기 위해 1년간 보존합니다.
상법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 본 기관은 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다. 이 경우 본 기관은 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.
- 보존 근거
계약 또는 청약철회 등에 관한 기록
- 방문에 관한 기록
보존 이유 : 통신비밀보호법
보존 기간 : 3개월 (전자상거래등에서의 소비자보호에 관한 법률)
- 본인확인에 관한 기록
보존 이유 : 정보통신 이용촉진 및 정보보호 등에 관한 법률
보존 기간 : 6개월 (전자상거래등에서의 소비자보호에 관한 법률)
- 소비자의 불만 또는 분쟁처리에 관한 기록
보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률
보존 기간 : 3년 (전자상거래등에서의 소비자보호에 관한 법률)
- 계약 또는 청약철회 등에 관한 기록
보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률
보존 기간 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)
- 대금결제 및 재화 등의 공급에 관한 기록
보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률
보존 기간 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)

개인정보의 파기절차 및 방법
본 기관은 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.
파기절차
회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다.
별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다.

파기방법
전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.

개인정보 제공
본 기관은 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.
이용자들이 사전에 동의한 경우
법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우
수집한 개인정보의 위탁
본 기관은 서비스 이행을 위해 아래와 같이 외부 전문업체에 위탁하여 운영하고 있습니다.
위탁 대상자 : (주)샤우트코리아
위탁업무 내용 : 웹사이트 및 시스템 관리

이용자 및 법정대리인의 권리와 그 행사방법
이용자는 언제든지 등록되어 있는 자신의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니다.
이용자들의 개인정보 조회,수정을 위해서는 '개인정보변경'(또는 '회원정보수정' 등)을 가입해지(동의철회)를 위해서는 "회원탈퇴"를 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다.
혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체없이 조치하겠습니다.
귀하가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하여 정정이 이루어지도록 하겠습니다.
본 기관은 이용자의 요청에 의해 해지 또는 삭제된 개인정보는 "본 기관이 수집하는 개인정보의 보유 및 이용기간"에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.
개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항
본 기관은 귀하의 정보를 수시로 저장하고 찾아내는 '쿠키(cookie)' 등을 운용합니다. 쿠키란 웹사이트를 운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터 하드디스크에 저장됩니다.
본 기관은 다음과 같은 목적을 위해 쿠키를 사용합니다.
- 쿠키 등 사용 목적
회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공
귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 귀하는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.
- 쿠키 설정 거부 방법
쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.
설정방법 예(인터넷 익스플로어의 경우) : 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보
단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.

개인정보에 관한 민원서비스
본 기관은 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보관리책임자를 지정하고 있습니다.
귀하께서는 본 기관의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다.
본 기관은 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.
기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.
개인분쟁조정위원회 (www.1336.or.kr/1336)
정보보호마크인증위원회 (www.eprivacy.or.kr/02-580-0533~4)
대검찰청 인터넷범죄수사센터 (http://icic.sppo.go.kr/02-3480-3600)
경찰청 사이버테러대응센터 (www.ctrc.go.kr/02-392-0330)         
          </div>
          <div class="btn-wrap line bt pt20">
          	<div style="width: 100%;">
	          	<span class="checkbox-custom"><input type="checkbox" id="agree2" name="agree2" value="Y"><label for="agree2"><i></i><span>개인정보취급방침 유지</span></label></span>
          	</div>
            <button type="button" class="btn btn-primary btn-lg w50p" style="display: inline-block;" onclick="javascript:fn_agree_check();">확인</button>
            <button type="button" class="btn btn-primary btn-lg w50p" onclick="location.href='/gnoincoun/login.do'" style="color: #fff; background-color: #78849E; border-color: #78849E; float: left;">취소</button>
          </div>
        </form>
	</div>
</section> <!-- End section -->