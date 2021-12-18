<%--
  Created by IntelliJ IDEA.
  User: kacper
  Date: 05.12.2021
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/fragment/header.jsp" %>

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-600">Endpoints</h1>
</div>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h4 class="m-0 font-weight-bold text-primary">Event</h4>
    </div>
    <div class="card-body">
        <table>
            <tr>
                <th>Method</th>
                <th></th>
                <th></th>
                <th>URL</th>
                <th></th>
                <th></th>
                <th>Action(JSON)</th>
            </tr>
            <tr>
                <td>
                    <a href="/api/event" class="btn btn-primary" target="_blank" rel="noopener noreferrer">
                        <span class="text">GET</span>
                        <span class="icon text-white-50">(try)</span>

                    </a>
                </td>
                <td></td>
                <td></td>
                <td>/api/event</td>
                <td></td>
                <td></td>
                <td>Find All</td>
            </tr>

            <tr>
                <td>
                    <a href="#" class="btn btn-primary ">
                        <span class="icon text-white-50"></span>
                        <span class="text">GET</span>
                    </a>
                </td>
                <td></td>
                <td></td>
                <td>/api/event/{id}</td>
                <td></td>
                <td></td>
                <td>Find by id</td>
            </tr>

            <tr>
                <td>
                    <a href="#" class="btn btn-success">
                      <span class="icon text-white-50"></span>
                        <span class="text">POST</span>
                    </a>
                </td>
                <td></td>
                <td></td>
                <td>/api/event</td>
                <td></td>
                <td></td>
                <td>Create</td>
            </tr>

            <tr>
                <td>
                    <a href="#" class="btn btn-warning">
                        <span class="icon text-white-50"></span>
                        <span class="text">PUT</span>
                    </a>
                </td>
                <td></td>
                <td></td>
                <td>/api/event/{id}</td>
                <td></td>
                <td></td>
                <td>Update with id</td>
            </tr>

            <tr>
                <td>
                    <a href="#" class="btn btn-danger">
                        <span class="icon text-white-50"></span>
                        <span class="text">DELETE</span>
                    </a>
                </td>
                <td></td>
                <td></td>
                <td>/api/event/{id}</td>
                <td></td>
                <td></td>
                <td>Delete by id</td>
            </tr>

        </table>
    </div>
</div>

<%--Fighter--%>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h4 class="m-0 font-weight-bold text-primary">Fighter</h4>
    </div>
    <div class="card-body">
        <table>
            <tr>
                <th>Method</th>
                <th></th>
                <th>URL</th>
                <th></th>
                <th></th>
                <th>Action(JSON)</th>
            </tr>
            <tr>
                <td>
                    <a href="/api/fighter" class="btn btn-primary" target="_blank" rel="noopener noreferrer">
                        <span class="text">GET</span>
                        <span class="icon text-white-50">(try)</span>
                    </a>
                </td>
                <td></td>
                <td>/api/fighter</td>
                <td></td>
                <td></td>
                <td>Find All</td>
            </tr>

            <tr>
                <td>
                    <a href="#" class="btn btn-primary ">
                        <span class="icon text-white-50"></span>
                        <span class="text">GET</span>
                    </a>
                </td>
                <td></td>
                <td>/api/fighter/{id}</td>
                <td></td>
                <td></td>
                <td>Find by id</td>
            </tr>

            <tr>
                <td>
                    <a href="#" class="btn btn-success ">
                        <span class="icon text-white-50"></span>
                        <span class="text">POST</span>
                    </a>
                </td>
                <td></td>
                <td>/api/fighter</td>
                <td></td>
                <td></td>
                <td>Create</td>
            </tr>

            <tr>
                <td>
                    <a href="#" class="btn btn-warning ">
                        <span class="icon text-white-50"></span>
                        <span class="text">PUT</span>
                    </a>
                </td>
                <td></td>
                <td>/api/fighter/{id}</td>
                <td></td>
                <td></td>
                <td>Update with id</td>
            </tr>

            <tr>
                <td>
                    <a href="#" class="btn btn-danger ">
                        <span class="icon text-white-50"></span>
                        <span class="text">DELETE</span>
                    </a>
                </td>
                <td></td>
                <td>/api/fighter/{id}</td>
                <td></td>
                <td></td>
                <td>Delete by id</td>
            </tr>

        </table>
    </div>
</div>
<%--Fight--%>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h4 class="m-0 font-weight-bold text-primary">Fight</h4>
    </div>
    <div class="card-body">
        <table>
            <tr>
                <th>Method</th>
                <th></th>
                <th>URL</th>
                <th></th>
                <th></th>
                <th>Action(JSON)</th>
            </tr>
            <tr>
                <td>
                    <a href="/api/fight" class="btn btn-primary " target="_blank" rel="noopener noreferrer">
                        <span class="text">GET</span>
                        <span class="icon text-white-50">(try)</span>

                    </a>
                </td>
                <td></td>
                <td>/api/fight</td>
                <td></td>
                <td></td>
                <td>Find All</td>
            </tr>

            <tr>
                <td>
                    <a href="#" class="btn btn-primary">
                        <span class="icon text-white-50"></span>
                        <span class="text">GET</span>
                    </a>
                </td>
                <td></td>
                <td>/api/fight/{id}</td>
                <td></td>
                <td></td>
                <td>Find by id</td>
            </tr>

            <tr>
                <td>
                    <a href="#" class="btn btn-success ">
                        <span class="icon text-white-50"></span>
                        <span class="text">POST</span>
                    </a>
                </td>
                <td></td>
                <td>/api/fight</td>
                <td></td>
                <td></td>
                <td>Create</td>
            </tr>

            <tr>
                <td>
                    <a href="#" class="btn btn-warning ">
                        <span class="icon text-white-50"></span>
                        <span class="text">PUT</span>
                    </a>
                </td>
                <td></td>
                <td>/api/fight/{id}</td>
                <td></td>
                <td></td>
                <td>Update with id</td>
            </tr>

            <tr>
                <td>
                    <a href="#" class="btn btn-danger ">
                        <span class="icon text-white-50"></span>
                        <span class="text">DELETE</span>
                    </a>
                </td>
                <td></td>
                <td>/api/fight/{id}</td>
                <td></td>
                <td></td>
                <td>Delete by id</td>
            </tr>

        </table>
    </div>
</div>
<%--Fight--%>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h4 class="m-0 font-weight-bold text-primary">Category</h4>
    </div>
    <div class="card-body">
        <table>
            <tr>
                <th>Method</th>
                <th></th>
                <th></th>
                <th>URL</th>
                <th></th>
                <th></th>
                <th>Action(JSON)</th>
            </tr>
            <tr>
                <td>
                    <a href="/api/category" class="btn btn-primary " target="_blank" rel="noopener noreferrer">
                        <span class="text">GET</span>
                        <span class="icon text-white-50">(try)</span>

                    </a>
                </td>
                <td></td>
                <td></td>
                <td>/api/category</td>
                <td></td>
                <td></td>
                <td>Find All</td>
            </tr>



        </table>
    </div>
</div>



<%@ include file="/fragment/footer.jsp" %>
