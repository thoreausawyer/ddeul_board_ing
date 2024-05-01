<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>To Do List</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>
$(function(){
    $("input#inputlg").keypress(function(e){
    var setup=$("input#inputlg").val();
        if(e.keyCode == 13){ // 13은 enter 키 코드
            $("ul.list-group").append('<li class="list-group-item">'+'&nbsp;&nbsp;'+setup+'</li>');
            $("input#inputlg").val('');
        }
    });
    
    $(document).on("click", ".list-group-item", function(){
        //$('#radioD').remove($(this).unwrap().val());
        //unwrap은 상위 태그 삭제
        $(this).fadeOut(1000, function(){
            $(this).remove();
        });
    });
});
</script>
<style type="text/css">
    h4{
        margin:20px 0px;
    }
</style>
</head>

<body>
<div>
    <div class="container">
        <h2>TO DO LIST</h2>
        
        <br>
        <ul class="list-group">
        </ul>
    
        <h4>오늘 당신이 해야 할 일은 무엇인가요?</h4>
        <input type="text" class="form-control input-lg" id="inputlg">
        
    </div>
</div>
</body>
</html>
