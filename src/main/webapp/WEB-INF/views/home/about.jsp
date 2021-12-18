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
    <h1 class="h3 mb-0 text-gray-800"><a href="https://www.kswmma.com/">
        <img src="${pageContext.request.contextPath}/resources/img/unnamed.jpg" style="align-content: center">
    </a></h1>

</div>
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h4 class="m-0 font-weight-bold text-primary">About</h4>
    </div>
    <div class="card-body">
        Martin Lewandowski had been the manager of the Hotel Marriott in Warsaw when he met Maciej Kawulski in 2002.
        Kawulski was organizing one of the biggest sports expos in Poland at that time, and as both businessmen come
        from martial arts backgrounds, they quickly found a common subject. Eighteen months later the first KSW show was
        born.[2]

        The promotion is famed for its four and eight-man tournaments, which until KSW X - Dekalog took place over the
        period of one night,[3] but since KSW XI they are split, with the tournament final taking place on the next
        event. KSW XV is the first event without a new tournament, only with extra fights and finals from previous
        tournaments.

        Several fighters who have been successful in KSW have signed on to more well known promotions such as the UFC.
        KSW has its own fight team, the KSW Team, which consists of some of the promotion's elite fighters, such as
        Mamed Khalidov, Jan Błachowicz, Krzysztof Kulak, Łukasz Jurkowski or Antoni Chmielewski. KSW co-operates with
        many other promotions in Europe by exchanging fighters, for example WFC and The Cage. KSW runs the majority of
        its shows live on a variety of TV networks (Polsat Sport, Polsat Sport Extra) throughout Europe. Since KSW XI,
        the promotion runs its shows live on nationally available private television Polsat.

        The KSW ring announcer is Waldemar Kasta, a former rapper born in Wrocław.
    </div>
</div>
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h4 class="m-0 font-weight-bold text-primary">People</h4>
    </div>
    <div class="card-body">
        <ul class="b">
        <li>Maciej Kawulski</li>
            <small>co-owner, founder</small>
        <li> Martin Lewandowski</li>
            <small>co-owner, founder</small>
        </ul>
        <style>
            ul.b {
                list-style-type: square;
            }
        </style>
        <br>
        <ul>
            <li>Wojsław Rysiewski,&nbsp;&nbsp;/sport ceo </li>
            <li>Waldemar Kasta,&nbsp;&nbsp;/announcer</li>
            <li>Paweł Wójcik,&nbsp;&nbsp;/journalist</li>
            <li>Dominik Durniat,&nbsp;&nbsp;/journalist</li>
            <li>Andrzej Janisz,&nbsp;&nbsp;/commentator</li>
            <li>Łukasz Jurkowski,&nbsp;&nbsp;/commentator</li>
            <li>Jerzy Mielewski,&nbsp;&nbsp;/studio</li>
            <li>Filip Sadowski,&nbsp;&nbsp;/announcer</li>
            <li>Tomasz Bronder,&nbsp;&nbsp;/main referee</li>
        </ul>
    </div>
</div>
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h4 class="m-0 font-weight-bold text-primary">Brands</h4>
    </div>
    <div class="card-body">
        &#x1F4FA; KSW TV <br>

        &#x1F4AA; KSW Gym <br>

        &#x1F6D2; KSW Shop <br>
    </div>
</div>


<%@ include file="/fragment/footer.jsp" %>
