<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Insert title here</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body style="margin: 0; padding: 0">
<div class="container">
    <nav>
        <div class="logo">
            <a href="Untitled-2.css">team6</a>
        </div>
        <div class="list_main">
            <ul>
                <li><a href="Untitled-2.css">영화</a></li>
                <li><a href="Untitled-2.css">순위</a></li>
                <li><a href="Untitled-2.css">장바구니</a></li>
                <li><a href="Untitled-2.css">마이페이지</a></li>
                <li>
                    <form
                            id="search"
                            name="search"
                            method="POST"
                            action="Untitled-2.css"
                    >
                        <input type="search" /><button type="button" type="submit">
                        검색
                    </button>
                    </form>
                </li>
            </ul>
        </div>
    </nav>
</div>
<div class="container mt-5 mb-5 border">
    <div class="row">
        <div class="col-12">나의 장바구니</div>
        <div class="col-12">
            <div class="row mt-4 mb-4">
                <div class="col-3">
                    <div class="col-9 border">
                        <img src="./tempImg.png" alt="" class="img-fluid" />
                        <div class="border">영화제목</div>
                        <button type="button" class="btn-primary">평생 소장</button>
                        <button type="button" class="btn-success">대여하기</button>
                        <button
                                type="button"
                                class="btn-danger"
                                data-bs-toggle="modal"
                                data-bs-target="#myModal"
                        >
                            제거
                        </button>
                    </div>
                </div>
                <div class="col-3">
                    <div class="col-9 border">
                        <img src="./tempImg.png" alt="" class="img-fluid" />
                        <div class="border">영화제목</div>
                        <button type="button" class="btn-primary">평생 소장</button>
                        <button type="button" class="btn-success">대여하기</button>
                        <button
                                type="button"
                                class="btn-danger"
                                data-bs-toggle="modal"
                                data-bs-target="#myModal"
                        >
                            제거
                        </button>
                    </div>
                </div>
                <div class="col-3">
                    <div class="col-9 border">
                        <img src="./tempImg.png" alt="" class="img-fluid" />
                        <div class="border">영화제목</div>
                        <button type="button" class="btn-primary">평생 소장</button>
                        <button type="button" class="btn-success">대여하기</button>
                        <button
                                type="button"
                                class="btn-danger"
                                data-bs-toggle="modal"
                                data-bs-target="#myModal"
                        >
                            제거
                        </button>
                    </div>
                </div>
                <div class="col-3">
                    <div class="col-9 border">
                        <img src="./tempImg.png" alt="" class="img-fluid" />
                        <div class="border">영화제목</div>
                        <button type="button" class="btn-primary">평생 소장</button>
                        <button type="button" class="btn-success">대여하기</button>
                        <button
                                type="button"
                                class="btn-danger"
                                data-bs-toggle="modal"
                                data-bs-target="#myModal"
                        >
                            제거
                        </button>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <div class="col-9 border">
                        <img src="./tempImg.png" alt="" class="img-fluid" />
                        <div class="border">영화제목</div>
                        <button type="button" class="btn-primary">평생 소장</button>
                        <button type="button" class="btn-success">대여하기</button>
                        <button
                                type="button"
                                class="btn-danger"
                                data-bs-toggle="modal"
                                data-bs-target="#myModal"
                        >
                            제거
                        </button>
                    </div>
                </div>
                <div class="col-3">
                    <div class="col-9 border">
                        <img src="./tempImg.png" alt="" class="img-fluid" />
                        <div class="border">영화제목</div>
                        <button type="button" class="btn-primary">평생 소장</button>
                        <button type="button" class="btn-success">대여하기</button>
                        <button
                                type="button"
                                class="btn-danger"
                                data-bs-toggle="modal"
                                data-bs-target="#myModal"
                        >
                            제거
                        </button>
                    </div>
                </div>
                <div class="col-3">
                    <div class="col-9 border">
                        <img src="./tempImg.png" alt="" class="img-fluid" />
                        <div class="border">영화제목</div>
                        <button type="button" class="btn-primary">평생 소장</button>
                        <button type="button" class="btn-success">대여하기</button>
                        <button
                                type="button"
                                class="btn-danger"
                                data-bs-toggle="modal"
                                data-bs-target="#myModal"
                        >
                            제거
                        </button>
                    </div>
                </div>
                <div class="col-3">
                    <div class="col-9 border">
                        <img src="./tempImg.png" alt="" class="img-fluid" />
                        <div class="border">영화제목</div>
                        <button type="button" class="btn-primary">평생 소장</button>
                        <button type="button" class="btn-success">대여하기</button>
                        <button
                                type="button"
                                class="btn-danger"
                                data-bs-toggle="modal"
                                data-bs-target="#myModal"
                        >
                            제거
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <button class="btn-primary mt-5">전체 구매하러 가기</button>
    </div>
</div>

<div class="modal" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">영화 제거</h4>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                ></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">장바구니에서 영화를 제거하시겠습니까?</div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button
                        type="button"
                        class="btn btn-danger"
                        data-bs-dismiss="modal"
                >
                    확인
                </button>
            </div>
        </div>
    </div>
</div>
</body>
</html>

 
 
 