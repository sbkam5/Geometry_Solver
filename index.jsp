<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<!--Problem one-->
<p>Please type in your known inputs</p>
<p>If an input is unknown, simply leave it blank</p>
<br>

<img src = "Refined 1.jpg" width = "480" height = "400">


<form action="calculate.jsp" method="post" target="_blank">
	Angle A(degrees):<input name="A" type="text">
	<br/>
	Angle B(degrees):<input name="B" type="text">
	<br/>
	Angle C(degrees):<input name="C" type="text">
	<br/>
	Side a:<input name="a" type="text">
	<br/>
	Side b:<input name="b" type="text">
  <br/>
  Side c:<input name="c" type="text">
  <br/>
	Segment DB:<input name="db" type="text">
	<br/>
	Segment EC:<input name="ec" type="text">
	<br/>
  radius:<input name="r" type="text">
  <br/>
  Central Angle 1:<input name="central" type="text">
  <br/>
  Chord Length 1(AD):<input name="chord" type="text">
	<br/>
	Arc Length 1(AD):<input name="arc" type="text">
	<br/>
	Central Angle 2:<input name="central2" type="text">
	<br/>
	Chord Length 2(AE):<input name="chord2" type="text">
	<br/>
	Arc Length 2(AE):<input name="arc2" type="text">
	<br/>
	Central Angle 3:<input name="central3" type="text">
	<br/>
	Arc Length 3(DE):<input name="arc3" type="text">
	<br/>
	Triangle area:<input name="triangleArea" type="text">
	<br/>
	DBCE Area:<input name="cursed" type="text">
	<br/>
	Circle area:<input name="circleArea" type="text">
	<br/>
	AD Area:<input name="ADArea" type="text">
	<br/>
	AE Area:<input name="AEArea" type="text">
	<br/>
	ADE Area:<input name="ADEArea" type="text">
	<br/>
	triangle perimeter:<input name="perimeter" type="text">
	<br/>
	circumference:<input name="circumference" type="text">
	<br/>
<input type="submit" value="Add"/>
</form>

<br/>
<br/>
<br/>

<!--Problem 2-->
<img src = "Refined 2.jpg" width="500" height="466">

	<form action="calculate2.jsp" method="post" target="_blank">
		Angle A(degrees):<input name="A" type="text">
		<br/>
		Angle B(degrees):<input name="B" type="text">
		<br/>
		Angle C(degrees):<input name="C" type="text">
		<br/>
		Side a:<input name="a" type="text">  <!--sides of triangle-->
		<br/>
		Side b:<input name="b" type="text">
	  <br/>
	  Side c:<input name="c" type="text">
	  <br/>
		Segment AD:<input name="ad" type="text">   <!-- Segments-->
		<br/>
		Segment EB:<input name="eb" type="text">
		<br/>
		Segment AF:<input name="af" type="text">
		<br/>
		Segment GC:<input name="gc" type="text">
		<br/>
	  radius:<input name="r" type="text">      <!--Circle inputs-->
	  <br/>
	  Central Angle 1:<input name="central" type="text">
	  <br/>
	  Chord Length 1:<input name="chord" type="text">
		<br/>
		Arc Length 1:<input name="arc" type="text">
		<br/>
		Central Angle 2:<input name="central2" type="text">
		<br/>
		Arc Length 2:<input name="arc2" type="text">
		<br/>
		Central Angle 3:<input name="central3" type="text">
	  <br/>
	  Chord Length 3:<input name="chord3" type="text">
		<br/>
		Arc Length 3:<input name="arc3" type="text">
		<br/>
		Central Angle 4:<input name="central4" type="text">
	  <br/>
		Arc Length 4:<input name="arc4" type="text">
		<br/>
		Triangle area:<input name="triangleArea" type="text">   <!--Area, circumference, and perimeter-->
		<br/>
		ADF Area:<input name="ADFArea" type="text">
		<br/>
		DEGF Area:<input name="DEGFArea" type="text">
		<br/>
		EBCG Area:<input name="EBCGArea" type="text">
		<br/>
		Circle area:<input name="circleArea" type="text">
		<br/>
		DE Area:<input name="DEArea" type="text">
		<br/>
		FG Area:<input name="FGArea" type="text">
		<br/>
		triangle perimeter:<input name="perimeter" type="text">
		<br/>
		circumference:<input name="circumference" type="text">
		<br/>
	<input type="submit" value="Add"/>
	</form>
