<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<c:import url="../headerFooterForm/headerFooterForm_adminHeader.jsp" />

<!-- 메인 컨텐츠 -->
<div class="container">
    <div class="row justify-content-center align-items-center" style="height: 100vh;">
        <div class="col-md-8">
            <div class="card">
                <div class="card-body text-center">
                    <input type="hidden" value="${id}" name="id">
                    <h2 class="card-title">회원목록</h2>
                    <div class="text-right">
                        <input type="text" placeholder="아이디 검색하기" id="username" name="id">
                    </div>
                    <hr>
                    <table class="table">
                        <thead>
                        <tr style="background-color: lightblue;">
                            <th>번호</th>
                            <th>전화번호</th>
                            <th>아이디</th>
                            <%--<th>등록일</th>--%>
                        </tr>
                        </thead>
                        <c:forEach items="${list}" var="member">
                        <tr id="${member.id}" onclick="showMemberDetails(this)" class="getMember">
                            <td>${member.id}</td>
                            <td>${member.phoneNumber}</td>
                            <td>${member.username}</td>
                            <%--<td>2023-07-01</td>--%>
                        </tr>
                        </c:forEach>
                    </table>
                    <br>
                    <div>
                        <c:if test="${ph.showPrev}">
                            <a href="<c:url value='/admin/adminmember?page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>"><</a>
                        </c:if>
                        <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                            <a href="<c:url value='/admin/adminmember?page=${i}&pageSize=${ph.pageSize}'/>">${i}</a>
                        </c:forEach>
                        <c:if test="${ph.showNext}">
                            <a href="<c:url value='/admin/adminmember?page=${ph.endPage+1}&pageSize=${ph.pageSize}'/>">></a>
                        </c:if>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 모달 창 -->
<div id="memberModal" class="modal" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">회원 정보</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table">
                    <tr>
                        <th>회원번호:</th>
                        <td id="memberId"></td>
                    </tr>
                    <tr>
                        <th>아이디:</th>
                        <td id="memberName"></td>
                    </tr>
                    <tr>
                        <th>전화번호:</th>
                        <td id="memberPhone"></td>
                    </tr>
                    <tr>
                        <th>사용권:</th>
                        <td id="memberSubscription"></td>
                    </tr>
                    <tr>
                        <th>남은 시간:</th>
                        <td id="memberRemainTime"></td>
                    </tr>
                    <tr>
                        <th>사용중인 사물함 번호:</th>
                        <td id="memberLockerStatus"></td>
                    </tr>
                    <tr>
                        <th>참여중인 챌린지:</th>
                        <td id="memberChallengeProgress"></td>
                    </tr>
                    <tr>
                        <th>포인트:</th>
                        <td id="memberPoint"></td>
                    </tr>
                    <tr>
                        <td><button type="button" id="edit" class="float-right updateMember">수정</button></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- 부트스트랩 및 jQuery 스크립트 -->
<script src="<c:url value="/js/jquery-3.7.0.min.js"/>"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>

    function showMemberDetails(button) {
        const memberID = button.id;

        $.ajax({
            type : "POST",
            url : "../ajax/getMember",
            data : JSON.stringify({
                "memberID" : memberID
            }),
            dataType : "json",
            async : false,
            contentType : "application/json; charset=utf-8",
            success: function (response){
                if(response.result==="success"){
                    $("#memberName").text(response.memberName);
                    $("#memberId").text(response.memberId);
                    $("#memberPhone").text(response.memberPhone);
                    $("#memberSubscription").text(response.memberSubscription);
                    $("#memberRemainTime").text(response.memberRemainTime);
                    $("#memberLockerStatus").text(response.memberLockerStatus);
                    $("#memberChallengeProgress").text(response.memberChallengeProgress);
                    $("#memberPoint").text(response.memberPoint);

                    // 모달 창을 띄웁니다.
                    $("#memberModal").modal("show");
                }
            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }

        })
        $('#edit').on("click", function (){
            location.href = "<c:url value='/admin/adminmemberedit'/>?id="+memberID;
        });
    }

</script>
</body>
</html>