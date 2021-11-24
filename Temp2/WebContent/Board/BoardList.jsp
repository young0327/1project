<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<style>
    li{
        width: 50px;
        height: 34px;
        background-color: white;
        border: solid 1px black;
        text-align: center;
        color: rgb(53, 159, 246);
    }
    .text-center{
        position: absolute;
        width: 170px;
        left: 50%;
        right: 50%;
    }
    btn{
        text-align: right;
    }
</style>
<body>
    <div class="container">
        <table class="table table-hover">
            <thead>
                <tr>
                    <td>번호</td>
                    <td>제목</td>
                    <td>작성자</td>
                    <td>날짜</td>
                    <td>조회수</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>제목제목</td>
                    <td>작성자작성자</td>
                    <td>2021.11.23</td>
                    <td>조회수는10</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>제목제목</td>
                    <td>작성자작성자</td>
                    <td>2021.11.23</td>
                    <td>조회수는10</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>제목제목</td>
                    <td>작성자작성자</td>
                    <td>2021.11.23</td>
                    <td>조회수는10</td>
                </tr>
            </tbody>
        </table>

        <hr/>
        <div>
        <a class="btn btn-default pull-right">글쓰기</a>
        </div>
        <div class="text-center">
            <ul class="pagination">
                <li type="button" href="#">1</li>
                <li type="button" href="#">2</li>
                <li type="button" href="#">3</li>
                <li type="button" href="#">4</li>
                <li type="button" href="#">5</li>
            </ul>
        </div>




    </div>




    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</body>
</html>

</body>
</html>