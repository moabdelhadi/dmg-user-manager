<%@page import="com.dmg.util.PropertiesManager"%>
<%@page import="java.util.Map"%>
<%@page import="com.dmg.core.bean.NewUserRegistration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>USER DETAILS</title>

<style>
* {
	border: 0;
	box-sizing: content-box;
	color: inherit;
	font-family: inherit;
	font-size: inherit;
	font-style: inherit;
	font-weight: inherit;
	line-height: inherit;
	list-style: none;
	margin: 0;
	padding: 0;
	text-decoration: none;
	vertical-align: top;
}

/* content editable */
*[contenteditable] {
	border-radius: 0.25em;
	min-width: 1em;
	outline: 0;
}

*[contenteditable] {
	cursor: pointer;
}

*[contenteditable]:hover, *[contenteditable]:focus, td:hover *[contenteditable],
	td:focus *[contenteditable], img.hover {
	background: #DEF;
	box-shadow: 0 0 1em 0.5em #DEF;
}

span[contenteditable] {
	display: inline-block;
}

/* heading */
h1 {
	font: bold 100% sans-serif;
	letter-spacing: 0.5em;
	text-align: center;
	text-transform: uppercase;
}

/* table */
table {
	font-size: 75%;
	table-layout: fixed;
	width: 100%;
}

table {
	border-collapse: separate;
	border-spacing: 2px;
}

th, td {
	border-width: 1px;
	padding: 0.5em;
	position: relative;
	text-align: left;
}

th, td {
	border-radius: 0.25em;
	border-style: solid;
}

th {
	background: #EEE;
	border-color: #BBB;
}

td {
	border-color: #DDD;
}

/* page */
html {
	font: 16px/1 'Open Sans', sans-serif;
	overflow: scroll;
	padding: 0.5in;
}

html {
	background: #999;
	cursor: default;
}

body {
	box-sizing: border-box;
	margin: 0 auto;
	padding: 0.5in;
	height: auto !important;
	overflow: visible !important;
	max-width: 800px;
}

body {
	background: #FFF;
	border-radius: 1px;
	box-shadow: 0 0 1in -0.25in rgba(0, 0, 0, 0.5);
}

/* header */
.inv-header {
	margin: 0;
	padding-bottom: 40px;
}

.inv-header:after {
	clear: both;
	content: "";
	display: table;
}

.dmg-theme .v-widget {
	font-size: 13px;
}

.inv-header h1 {
	background: #000;
	border-radius: 0.25em;
	color: #FFF;
	margin: 0 0 1em;
	padding: 0.5em 0;
}

.inv-header address {
	float: left;
	font-size: 11px;
	font-style: normal;
	line-height: 1.25;
	margin: 0 0 0 0;;
	width: 40%;
}

.inv-header address p {
	margin: 0 0 0.25em;
}

.inv-header .arAddress {
	float: right;
	direction: rtl
}

.inv-header .arAddress div {
	direction: rtl;
	algin: right;
	text-align: right;
}

.inv-header span, .inv-header img {
	display: block;
	float: left;
}

.inv-header span {
	margin: 0 0 0 0;
	max-height: 25%;
	position: relative;
	width: 19%;
}

.inv-header img {
	width: 150px;
	max-width: 100%;
}

.inv-header input {
	cursor: pointer;
	-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
	height: 100%;
	left: 0;
	opacity: 0;
	position: absolute;
	top: 0;
	width: 100%;
}

.dmg-theme.v-app, body {
	background: #FFF !important;
}

/* article */
article, article address, table.meta, table.inventory {
	margin: 0 0 1em;
}

article:after {
	clear: both;
	content: "";
	display: table;
}

article h1 {
	clip: rect(0, 0, 0, 0);
	position: absolute;
}

article address {
	float: left;
	font-size: 125%;
	font-weight: bold
}

/* table meta & balance */
table.meta {
	float: right;
	width: 45%;
}

table.balance {
	float: left;
    clear: both;
	width: 50%;
}

table.meta.right {
	float: left
}

table.meta:after, table.balance:after {
	clear: both;
	content: "";
	display: table;
}

.meta .arTitle, .inventory .arTitle {
	float: right;
}

/* table meta */
table.meta.right th {
	width: 40%;
}

table.meta.right td {
	width: 60%;
	font-size: 14px;
}

table.meta th {
	width: 60%;
}

table.meta td {
	width: 40%;
	font-size: 14px;
}

/* table items */
table.inventory {
	clear: both;
	width: 100%;
	margin-bottom: 1em;
	float: left;
}

table.inventory th {
	font-weight: bold;
	text-align: center;
}

table.inventory td:nth-child(1) {
	width: 26%;
}

table.inventory td:nth-child(2) {
	width: 38%;
}

table.inventory td:nth-child(3) {
	text-align: right;
	width: 12%;
}

table.inventory td:nth-child(4) {
	text-align: right;
	width: 12%;
}

table.inventory td:nth-child(5) {
	text-align: right;
	width: 12%;
}

table.inventory.date {
	width: 40%;
}

table.balance th, table.balance td {
	width: 50%;
}

table.balance td {
	text-align: right;
}

table.balance .arTitle {
	float: right;
}

/* table collector */
table.collector {
	float: left;
	width: 36%;
	padding-top: 50px;
}

table.collector th, table.collector td {
	width: 50%;
}

table.collector td {
	text-align: right;
}

table.collector .arTitle {
	float: right;
}

.contIntro p{
padding-bottom: 20px;

}

/* aside */
aside h1 {
	border: none;
	border-width: 0 0 1px;
	margin: 0 0 1em;
}

aside h1 {
	border-color: #999;
	border-bottom-style: solid;
}

/* javascript */
.add, .cut {
	border-width: 1px;
	display: block;
	font-size: .8rem;
	padding: 0.25em 0.5em;
	float: left;
	text-align: center;
	width: 0.6em;
}

.add, .cut {
	background: #9AF;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
	background-image: -moz-linear-gradient(#00ADEE 5%, #0078A5 100%);
	background-image: -webkit-linear-gradient(#00ADEE 5%, #0078A5 100%);
	border-radius: 0.5em;
	border-color: #0076A3;
	color: #FFF;
	cursor: pointer;
	font-weight: bold;
	text-shadow: 0 -1px 2px rgba(0, 0, 0, 0.333);
}

.add {
	margin: -2.5em 0 0;
}

.add:hover {
	background: #00ADEE;
}

.cut {
	opacity: 0;
	position: absolute;
	top: 0;
	left: -1.5em;
}

.cut {
	-webkit-transition: opacity 100ms ease-in;
}

tr:hover .cut {
	opacity: 1;
}

@media print {
	* {
		-webkit-print-color-adjust: exact;
	}
	html {
		background: none;
		padding: 0;
	}
	body {
		box-shadow: none;
		margin: 0;
	}
	span:empty {
		display: none;
	}
	.add, .cut {
		display: none;
	}
}

@page {
	margin: 0;
}
</style>




</head>
<body>

<div class="wraper-full">
		<div class="inv-header">
			<h1>Gas Supply Contract</h1>
			<address>
				<div location="companyNameLbl">Royal Development for Gas Works</div>
				<div location="companyTelLbl">Abu Dhabi: Tel.:(02)6323236, (02) 6338455</div>
				<div location="companyFaxLbl">Fax: (02) 6337267, P.O.Box:30058, U.A.E.</div>
				<div location="companyEmailLbl">Email: support.ad@royalgas.ae</div>
			</address>
			<span><div location="logo"><img class="v-image v-widget" src="https://paytest.royalgas.com/dmg-rg-client/VAADIN/themes/dmg-theme/img/adlogo.png" alt=""></div></span>
			<address class="arAddress">
				<div location="companyNameLblAr">التنمية الملكية لأعمال الغاز</div>
				<div location="companyTelLblAr">ابوظبي: 6323236 (02)</div>
				<div location="companyFaxLblAr">فاكس: (02) 6337267,   	ص.ب.:30058, U.A.E.</div>
				<div location="companyEmailLblAr">البريد الإلكتروني: support.ad@royalgas.ae</div>
			</address>


		</div>

<%
	NewUserRegistration user = (NewUserRegistration) request.getAttribute("user");
	String resultStatus = (String) request.getAttribute("requestStatus");
	Map<String,String> formMap = (Map<String,String>) request.getAttribute("paymentMap");
	
%>
		<article>
			<div class="contIntro">
			<p>This is a contract between the Royal Gas & Development As First Party, and the second party whom information is filled bellow.</p>
			<p>هذا عقد مبدئي بين الطرف الاول التنميه الملكيه لأعمال الغاز و بين الطرف الثاني المدرج بيناته بالاسفل))</p> 
			</div>
			<table class="meta right">
				<tr>
					<th><span>Name.</span><span class="arTitle">الاسم</span></th>
					<td><span><div location="userName"><%=user.getName()%></div></span></td>
				</tr>
				<tr>
					<th><span>City.</span><span class="arTitle">المدينة</span></th>
					<td><span><div location="apartmentCode"><%=user.getCity()%></div></span></td>
				</tr>
				<tr>
					<th><span>Building Owner</span><span class="arTitle">إسم
							المالك</span></th>
					<td><span><div location="BuildingOwner"><%=user.getBuildingNumber()%></div></span></td>
				</tr>
				<tr>
					<th><span>Building No.</span><span class="arTitle">رقم
							البناية</span></th>
					<td><span><div location="BuildingCode"><%=user.getBuildingNumber()%></div></span></td>
				</tr>
				<tr>
					<th><span>Flat No.</span><span class="arTitle">رقم
							الشقة</span></th>
					<td><span><div location="apartmentCode"><%=user.getAppartmentNumber()%></div></span></td>
				</tr>
				
			</table>
			<table class="meta">
				<tr>
					<th><span>Contract No.</span><span class="arTitle">رقم
							العقد</span></th>
					<td><span><div location="billCode"></div></span></td>
				</tr>
				<tr>
					<th><span>Contract Start Date</span><span class="arTitle">تاريخ
							العقد</span></th>
					<td><span><div location="billDate"><%=user.getCreationDate()%></div></span></td>
				</tr>
				<tr>
					<th><span>Email</span><span class="arTitle">
							الإيميل</span></th>
					<td><span><div location="accountId"><%=user.getEmail()%></div></span></td>
				</tr>
				<tr>
					<th><span>Last Meter Reading</span><span class="arTitle">قراءة لعداد الاخيرة
							 </span></th>
					<td><span><div location="lastRecivedAmmount"><%=user.getMeterReading()%></div></span></td>
				</tr>
				<tr>
					<th><span>Meter No.</span><span class="arTitle">رقم العداد</span></th>
					<td><span><div location="lastRecivedDate"><%=user.getMeterNo()%></div></span></td>
				</tr>
				<tr>
					<th><span>P.O.Box</span><span class="arTitle">صندوق الريد</span></th>
					<td><span><div location="lastRecivedDate"><%=user.getPobox()%></div></span></td>
				</tr>
				<tr>
					<th><span>Phone</span><span class="arTitle">رقم الهاتف</span></th>
					<td><span><div location="lastRecivedDate"><%=user.getPhone()%></div></span></td>
				</tr>
								<tr>
					<th><span>Mobile</span><span class="arTitle">المبايل</span></th>
					<td><span><div location="lastRecivedDate"><%=user.getMobile()%></div></span></td>
				</tr>
			</table>

		<table class="balance">
				<tr>
					<th><span>Name</span><span class="arTitle">الأسم</span></th>
					<td><span><div
								location="consumptionValue2"><%=user.getName()%></div></span></td>
				</tr>
				<tr>
					<th><span>Date</span><span class="arTitle">التاريخ</span></th>
					<td><span><div
								location="previousValue"><%=user.getCreationDate()%></div></span></td>
				</tr>

				<tr>
					<th><span>Signature</span><span class="arTitle">التوقيع</span></th>
					<td><span><div location="service"></div></span></td>
				</tr>
			</table>
		</article>
		<div class="Paymentform">
		
		<form name="RedirectForm" action="<%= PropertiesManager.getInstance().getProperty("payment.paymentUrl")%>" method="post">
            <%
            for(String key: formMap.keySet()){
            	%>
            	<input type="hidden" name="<%= key %>" value="<%= formMap.get(key) %>">
            	<%
            }
            %>
            <input type="submit" name="submit" value="Continue"></td></tr>
        </form>
		
		
		 
			<a href="/dmg-rg-client/regUserProcessPay">I AGREE</a>
		</div>
		<aside>
			<h1>
				<span>Additional Notes</span>
			</h1>
			<div style="float: left; width: 39%;">
				<p>مرفق مستند الشروط و الاحكام</p>
				<p>Termes & Conditions are Attached</p>
			</div>
		</aside>
	</div>



</body>
</html>