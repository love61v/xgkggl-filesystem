<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />


<form class="form-horizontal" role="form" id="userForm">
 <div class="form-group" style="display:none;">
   <label for="userId" class="col-sm-1 control-label">用户ID</label>
   <div class="col-sm-2 controls">
      <input type="text" class="input-large span3" name="userId" id="userId" value="${user.userId }">
   </div>
</div>

<div class="form-group" style="margin-top: 20px;">
	 <div class="col-sm-2 controls" style="color:red;display:none;" id="deptIdTip">
	 	<i class="icon-exclamation-sign"></i>请选择工作单位
	 </div>
	 
   	<label for="deptId" class="col-sm-2 control-label">工作单位 </label>
   	<div class="col-sm-3 controls">
     <select class="input-large span3" name="deptId" id="deptId" onchange="doHideTip(this);">
     	 <option value="0">-请选择工作单位-</option>
		<c:forEach items="${deptList }" var="el">
	        <option value="${el.deptId }" <c:if test="${user.deptId == el.deptId  }">selected="selected"</c:if> >${el.deptName }</option>
		</c:forEach>
     </select>
   </div>
</div>

<div class="form-group" style="margin-top: 30px;">
   <div class="col-sm-2 controls" style="color:red;display:none;" id="loginNameTip">
   		<i class="icon-exclamation-sign"></i>请输入登陆账号
   	</div>
   <label for="loginName" class="control-label">登陆账号</label>
   <div class="col-sm-2 controls">
      <input type="text" class="input-large span3" name="loginName" id="loginName" value="${user.loginName }"
	            placeholder="登陆账号" onfocus="doHideTip(this);">
   </div>
</div>

<div class="form-group" style="margin-top: 30px;">
   <div class="col-sm-2 controls" style="color:red;display:none;" id="userNameTip">
   	<i class="icon-exclamation-sign"></i>请输入用户名</div>
   <label for="userName" class="control-label">用户名</label>
   <div class="col-sm-3 controls">
      <input type="text" class="input-large span3" name="userName" id="userName" value="${user.userName }"
	            placeholder="用户名称" onfocus="doHideTip(this);">
   </div>
</div>

<div class="form-group" style="margin-top: 30px;">
   <label for="forcastNumber" class="col-sm-2 control-label">预报员编号</label>
   <div class="col-sm-3 controls">
      <input type="text" class="input-large span3" name="forcastNumber" id="forcastNumber" value="${user.forcastNumber }"
	            placeholder="身份证">
</div>
<div class="form-group" style="margin-top: 30px;">
   <label for="idCard" class="col-sm-2 control-label">身份证</label>
   <div class="col-sm-3 controls">
      <input type="text" class="input-large span3" name="idCard" id="idCard" value="${user.idCard }"
	            placeholder="身份证">
</div>

<div class="form-group" style="margin-top: 30px;">
   <label for="birthday" class="col-sm-2 control-label">生日</label>
   
   <div class="input-append date" id="birthday" style="margin-left:20px;">
		<input type="text" size="22"  name="birthday"  value="${user.birthday }" readonly="readonly" />
		<span class="add-on"><i class="icon-th"></i></span>
	</div>
</div>

 
<div class="form-group" style="margin-top: 30px;">
   <label for="phoneNumber" class="col-sm-2 control-label">电话号码</label>
   <div class="col-sm-3 controls">
      <input type="text" class="input-large span3" name="phoneNumber" id="phoneNumber" value="${user.phoneNumber }"
	            placeholder="电话号码">
   </div>
</div>

<div class="form-group" style="margin-top: 30px;">
   <label for="sex" class="col-sm-2 control-label">性别 </label>
   <div class="col-sm-6 controls">
        <span>
        	<input type="radio" name="sex" id="sex" value="1" checked="checked"> 男
        </span>
		<span style="margin-left:30px;">
			<input type="radio"  name="sex" id="sex" value="2"  <c:if test="${user.sex== 2  }">checked="checked"</c:if> > 女
		</span>
   </div>
</div>

<div class="form-group" style="margin-top: 30px;">
   <label for="jobTitle" class="col-sm-2 control-label">职称</label>
   <div class="col-sm-3 controls">
      <input type="text" class="input-large span3" name="jobTitle" id="jobTitle" value="${user.jobTitle }"
	            placeholder="职称">
</div>

<div class="form-group" style="margin-top: 30px;">
   <label for="jobDate" class="col-sm-2 control-label">任职时间</label>
   <div class="input-append date" id=jobDate style="margin-left:20px;">
		<input type="text" size="22"  name="jobDate"  value="${user.jobDate }" readonly="readonly" />
		<span class="add-on"><i class="icon-th"></i></span>
	</div>
</div>

<div class="form-group" style="margin-top: 30px;">
   <label for="jobRemark" class="col-sm-2 control-label">曾经历岗位及年限</label>
   <div class="col-sm-3 controls">
      <input type="text" class="input-large span3" name="jobRemark" id="jobRemark" value="${user.jobRemark }"
	            placeholder="曾经历岗位及年限">
</div>
<div class="form-group" style="margin-top: 30px;">
   <label for="forcastBeginDate" class="col-sm-2 control-label">开始从事预报年月</label>
   <div class="input-append date" id=forcastBeginDate style="margin-left:20px;">
		<input type="text" size="22"  name="forcastBeginDate"  value="${user.forcastBeginDate }" readonly="readonly" />
		<span class="add-on"><i class="icon-th"></i></span>
	</div>
</div>
<div class="form-group" style="margin-top: 30px;">
   <label for="train" class="col-sm-2 control-label">培训经历</label>
   <div class="col-sm-3 controls">
      <input type="text" class="input-large span3" name="train" id="train" value="${user.train }"
	            placeholder="培训经历">
</div>

<div class="form-group" style="margin-top: 30px;">
   <label for="educationFirst" class="col-sm-2 control-label">第一学历</label>
   	<div class="col-sm-3 controls">
	   <select class="input-large span3" name="educationFirst" id="educationFirst">
	     	 <option value="">-请选择学历-</option>
			<c:forEach items="${educationMap }" var="el">
		        <option value="${el.key }" <c:if test="${user.educationFirst == el.value  }">selected="selected"</c:if> >${el.value }</option>
			</c:forEach>
	   </select>
   </div>
</div>

<div class="form-group" style="margin-top: 30px;">
   <label for="schoolFirst" class="col-sm-2 control-label">毕业院校</label>
   <div class="col-sm-3 controls">
      <input type="text" class="input-large span3" name="schoolFirst" id="schoolFirst" value="${user.schoolFirst }"
	            placeholder="毕业院校(第一学历)">
</div>
<div class="form-group" style="margin-top: 30px;">
   <label for="graduateFirst" class="col-sm-2 control-label">毕业时间</label>
   <div class="input-append date" id="graduateFirst" style="margin-left:20px;">
		<input type="text" size="22"  name="graduateFirst"  value="${user.graduateFirst }" readonly="readonly" />
		<span class="add-on"><i class="icon-th"></i></span>
	</div>
</div>
<div class="form-group" style="margin-top: 30px;">
   <label for="majorFirst" class="col-sm-2 control-label">专业</label>
   <div class="col-sm-3 controls">
      <input type="text" class="input-large span3" name="majorFirst" id="majorFirst" value="${user.majorFirst }"
	            placeholder="专业(第一学历)">
</div>

<div class="form-group" style="margin-top: 30px;">
   <label for="educationSecond" class="col-sm-2 control-label">第二学历</label>
   <div class="col-sm-3 controls">
	   <select class="input-large span3" name="educationSecond" id="educationSecond">
	     	 <option value="">-请选择学历-</option>
			<c:forEach items="${educationMap }" var="el">
		        <option value="${el.key }" <c:if test="${user.educationSecond == el.value  }">selected="selected"</c:if> >${el.value }</option>
			</c:forEach>
	   </select>
   </div>
</div>
<div class="form-group" style="margin-top: 30px;">
   <label for="schoolSecond" class="col-sm-2 control-label">毕业院校</label>
   <div class="col-sm-3 controls">
      <input type="text" class="input-large span3" name="schoolSecond" id="schoolSecond" value="${user.schoolSecond }"
                placeholder="毕业院校(第二学历)">
</div>
<div class="form-group" style="margin-top: 30px;">
   <label for="graduateSecond" class="col-sm-2 control-label">毕业时间</label>
   <div class="input-append date" id="graduateSecond" style="margin-left:20px;">
		<input type="text" size="22"  name="graduateSecond"  value="${user.graduateSecond }" readonly="readonly" />
		<span class="add-on"><i class="icon-th"></i></span>
	</div>
</div>
<div class="form-group" style="margin-top: 30px;">
   <label for="majorSecond" class="col-sm-2 control-label">专业</label>
   <div class="col-sm-3 controls">
      <input type="text" class="input-large span3" name="majorSecond" id="majorSecond" value="${user.majorSecond }"
                placeholder="专业(第二学历)">
</div>
</form>

<script>
	/**绑定日历*/
	$(function(){
		$('#birthday,#jobDate,#graduateFirst,#graduateSecond,#forcastBeginDate').datepicker({
		format: 'yyyy-mm-dd'
		});
		
	});
</script>