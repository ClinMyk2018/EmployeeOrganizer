<%@ page import="dao.DaoFactory" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: johndeleon
  Date: 2019-06-20
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="partials/head.jsp" %>
</head>
<body>
<%@include file="partials/navbar.jsp" %>


<div class="container" id="empcontainer">
    <%--    <div class="row">--%>
    <div class="col-4 float-left">
        <div class="card ">
            <img src="https://robohash.org/${emp.first_name}?set=set5" alt="${emp.first_name}">
            <div class="card-body">
                <h1>${emp.first_name} ${emp.last_name}</h1>
                <p>Employee No.: ${emp.id}</p>
            </div>
        </div>
    </div>
</div>
<div class="col-6 float-left">
    <div class="card ">
        <div class="card-body">

            <nav>
                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab"
                       href="#nav-info" role="tab" aria-controls="nav-info"
                       aria-selected="true">Employee Info
                    </a>
                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
                       href="#nav-bio" role="tab" aria-controls="nav-bio" aria-selected="false">
                        Personal Info</a>
                    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab"
                       href="#nav-contact" role="tab" aria-controls="nav-contact"
                       aria-selected="false">Team Members
                    </a>
                </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active" id="nav-info" role="tabpanel"
                     aria-labelledby="nav-home-tab">
                    <div class="card">
                        <div class="card-body">
                            <h4>Hire date:</h4> ${emp.hire_date}
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <h4>Title:</h4> ${emp.job_title}
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <h4>Department:</h4>
                            <p>${emp.dept_name}</p>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <h4>Manager:</h4> ${emp.manager}
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <h4>Email:</h4> ${emp.email}
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="nav-bio" role="tabpanel"
                     aria-labelledby="nav-profile-tab">
                    <h4>Career Goal: </h4>

                    <p>${emp.goals}</p>
                    <hr class="my-2">
                    <h4>Bio: </h4>
                    <p>${emp.bio}</p>

                    <c:if test="${emp.id == user.emp_id}">
                        <form action="/employee-goals-bio-form" method="get">
                            <input type="text" name="id" value="${emp.id}" hidden>


                            <button>
                                Update bio and career goals
                            </button>
                        </form>

                    </c:if>
                </div>
                <div class="tab-pane fade" id="nav-contact" role="tabpanel"
                     aria-labelledby="nav-contact-tab">
                    <div>
                        <h3>Team Manager: </h3>
                        <h6>${emp.manager}</h6>
                        <hr class="my-2">
                        <h4>Team: </h4>
                        <c:forEach var="member" items="${emp.team}">
                            <h6>${member}</h6>
                        </c:forEach>
                    </div>

                </div>
            </div>


        </div>
    </div>
</div>
<%--</div>--%>


<%@include file="partials/leghand.jsp" %>

</body>
</html>
