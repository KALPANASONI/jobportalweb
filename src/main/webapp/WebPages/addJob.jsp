<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html  ng-app="app">
<head>
<meta charset="ISO-8859-1">
<title>Post Job</title>
        <!-- All Plugin Css --> 
		<link rel="stylesheet" href="css/plugins.css">
		<!-----------------------------------------------ANGUARJS----------------------------------------------->
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
	
        <!---------------------------------- API URL ------------------------------------------------------>
        <script src="${pageContext.request.contextPath}/resources/API_URL.js"></script> 
        	<!----------------------------------------------JQUERY------------------------------------------------------>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script> 
        <script src="${pageContext.request.contextPath}/resources/node_modules/jquery/dist/jquery.min.js"></script> 
 
		<!-- Style & Common Css --> 
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">

	   <!--CUSTOM CSS CHECKBOX  -->
       <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/customecheckbox.css">
       
       
       
<script type="text/javascript">
var app = angular.module("app", []);
app.controller("GetDataController", ['$scope','$http','$window', function(scope,http,window) {
	   /*******************************getJobLocation****************************************/
   
	   http.get(apiURL+'getJobLocation').
		success(function(data, status) {
		if(data != null)
			{
			if(data.status==1){
		              
				scope.getJobLocation= data.myObjectList;
				console.log(scope.getJobLocation);
				console.log( data.myObjectList);

						
	         }else{}  
	   }else{
	     	
	      }      		       		
		}).
		error(function(data,status) {
		     
		});
	   
	   
	   /*******************************getjobsSkill****************************************/

	   http.get(apiURL+'getjobsSkill').
		success(function(data, status) {
		if(data != null)
			{
			if(data.status==1){
		              
				scope.getjobsSkill= data.myObjectList;
						
	         }else{}  
	   }else{
	     	
	      }      		       		
		}).
		error(function(data,status) {
		     
		});
	  
	   /*******************************getjobsType****************************************/

	   http.get(apiURL+'getjobsType').
		success(function(data, status) {
		if(data != null)
			{
			if(data.status==1){
		              
				scope.getjobsType= data.myObjectList;

						
	         }else{}  
	   }else{
	     	
	      }      		       		
		}).
		error(function(data,status) {
		     
		});
	   
	   /*******************************submitForm****************************************/

	   scope.submitForm = function(){
		   
			currentCheckarry=[]; //reinitialize (no duplicate checkbox)
		    angular.forEach(scope.getjobsSkill, function(x){
			var currentSkill=  document.getElementById(x.skill_id+"").checked; //this will check all selected checkboxes for update 
				if(currentSkill)
		  {
				    delete x["$$hashKey"]; //remove unusual keys from array objcet
    	        delete x["selected"];
		        currentCheckarry.push(x); 
    		  }
	     });
			
		   if(typeof scope.add_Job  !== 'undefined'){
      		 
     		  if(scope.add_Job.hasOwnProperty("job_name")){
     			 scope.job_name = scope.add_Job.job_name;
	    	  	 }else{
	    	  		 scope.job_name ="";
	    	  	   }
    		  
    		  if(scope.add_Job.hasOwnProperty("mlocation")){
	    	  		   scope.mlocation = scope.add_Job.mlocation;
	    	  	   }else{
	    	  		   scope.mlocation ="";
	    	  	   }
    		  if(scope.add_Job.hasOwnProperty("description")){
	  		            scope.description = scope.add_Job.description;
	  	            }else{
	  		             scope.description ="";
	  	            }
		  
    		  if(scope.add_Job.hasOwnProperty("job_name")){
	    	  		   scope.job_name=scope.add_Job.job_name;
	    	  	   }else{
	    	  		   scope.job_name ="";
	    	  	   }
	    	if(scope.add_Job.hasOwnProperty("job_code")){
	   	  		   scope.job_code=scope.add_Job.job_code;
	   	  	   }else{
	   	  		   scope.job_code ="";
	   	  	   }
	    	  if(scope.add_Job.hasOwnProperty("job_type")){
		  		   scope.job_type=scope.add_Job.job_type;
		  		   console.log(scope.add_Job.name);
		  	   }else{
		  		   scope.name ="";
		  	   }
	    	  if(scope.add_Job.hasOwnProperty("username")){
		  		   scope.username=scope.add_Job.username;
		  	   }else{
		  		   scope.username ="";
		  	   }
	    	  if(scope.add_Job.hasOwnProperty("phoneNumber")){
		  		   scope.phoneNumber=scope.add_Job.phoneNumber;
		  	   }else{
		  		   scope.phoneNumber ="";
		  	   }
	    	  if(scope.add_Job.hasOwnProperty("emailId")){
		  		   scope.emailId=scope.add_Job.emailId;
		  	   }else{
		  		   scope.emailId ="";
		  	   }
	    	  if(scope.add_Job.hasOwnProperty("CompanyName")){
		  		   scope.CompanyName=scope.add_Job.CompanyName;
		  	   }else{
		  		   scope.CompanyName ="";
		  	   }
	    	  if(scope.add_Job.hasOwnProperty("experience")){
		  		   scope.experience=scope.add_Job.experience;
		  	   }else{
		  		   scope.experience ="";
		  	   }
    	  
    	  
      		scope.dataRequest = {
					"mlocation": scope.mlocation,
					"description":scope.description,
					"job_name": scope.job_name,
					"job_code":scope.job_code,
					"job_type": scope.add_Job.job_type,
      		        "username":scope.username,
					"phoneNumber":scope.phoneNumber,
					"emailId":scope.emailId,
					"companyName":scope.CompanyName,
					"jobSkill":currentCheckarry,
					"experience":scope.experience,
					"salary":scope.add_Job.salary
					
					
		    };
			scope.requestedData = {
					"data" : JSON.stringify(scope.dataRequest)

				};
			//VALIDATION
		
	        		
			        http({
					method :'POST',
					url :apiURL+'addJob',
					data :scope.requestedData
					}).success(function(response) {	
	 					if(response.status==1){
	 						
	 						scope.response_message = response.message;
	 						alert(scope.response_message);
							window.location.href = '${pageContext.servletContext.contextPath}/Jobs'; 

							
						}else if(response.status==0)
						{
							scope.message = response.message;
							alert(scope.message);
	 						
						}else{
							scope.message = response.message;
							alert(scope.message);

						}
	  					      
	 				}).error(function(response) {			 
					});   
		   }
       };
   		
     
}]);

</script>

</head>
 <body ng-controller="GetDataController">
	
			<%@ include file="sidebar.jsp"%>
		
		<!-- login section start -->
		<section class="login-wrapper">
			<div class="container" name="add_Job">
				<div class="col-md-6 col-sm-8 col-md-offset-3 col-sm-offset-2">
					<form>
					 <h3>Post Job</h3>
						<input type="text" class="form-control input-lg" ng-model="add_Job.job_name" placeholder="Job title">
						<input type="text" class="form-control input-lg" ng-model="add_Job.CompanyName" placeholder="Company">
						<select class="select2 form-control input-lg" ng-model="add_Job.mlocation" ng-options="s as s.lcity for s in getJobLocation track by s.lid"  id="mVehicleClass" required>
						<option value="" disabled selected> Job Location </option></select>
                  	   
                  	   <div class="col-sm-6" style="padding-right: 0px;padding-left: 0px;">
 						<input type="number" class="form-control input-lg" ng-model="add_Job.experience" placeholder="Experience"></div>	
						<div class="col-sm-6"  style="padding-right: 0px;padding-left: 15px;">
                        <input type="text" class="form-control input-lg " ng-model="add_Job.job_code" placeholder="Job Code">						</div> 
                  	   <!--  <input type="text" class="form-control input-lg " ng-model="add_Job.job_code" placeholder="Job Code">
  -->	                 <div class="col-sm-12" style="padding-right: 0px;padding-left: 0px;">
                        <input type="text" class="form-control input-lg" ng-model="add_Job.username" placeholder="User Name">
                       </div>
 						<div class="col-sm-6" style="padding-right: 0px;padding-left: 0px;">
 						<input type="text" class="form-control input-lg" ng-model="add_Job.phoneNumber" placeholder="Phone"></div>	
						<div class="col-sm-6"  style="padding-right: 0px;padding-left: 15px;">
 						<input type="text" class="form-control input-lg" ng-model="add_Job.emailId" placeholder="Email id">
						</div> 
						
					    <div class="col-sm-6" style="padding-right: 0px;padding-left: 0px;">
						<select class="select2 form-control input-lg" ng-model="add_Job.job_type" ng-options="k as k.name for k in getjobsType track by k.id" required>
						<option value="" disabled selected>Employment Type </option></select>
						</div>
						<div class="col-sm-6"  style="padding-right: 0px;padding-left: 15px;">
						<input type="NUMBER" class="form-control input-lg" ng-model="add_Job.salary" placeholder="Salary">
						</div>
						<div class="col-sm-12" style="padding-right: 0px;padding-left: 0px;">
						<p style="padding-left: 0px;margin-top: 1px !important;margin-bottom: 5px !important; text-align: left !important;">Add skill</p>
						</div>
 						<div class="checkbox" ng-repeat="x in getjobsSkill" style="padding-bottom: 10px; padding-right: 10px;display: table-cell;">
														<label class="checkclass" for="{{x.skill_id}}">
															&nbsp; {{x.skill_level}} <input type="checkbox"
															ng-model="x.selected" id="{{x.skill_id}}"> <span style="    top: auto;;"
															class="checkmark"></span>
														</label>

													</div>
 						<textarea class="form-control" rows="4" cols="50"  placeholder="Add a job description" name="description" ng-model="add_Job.description"  required="required"  style="resize: none;"></textarea>
 					
						
						<button type="submit"ng-click="submitForm()" class="btn btn-primary">Post Job</button>
					</form>
				</div>
			</div>
		</section>
		
		
		 
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/bootsnav.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
    </body>
</html>