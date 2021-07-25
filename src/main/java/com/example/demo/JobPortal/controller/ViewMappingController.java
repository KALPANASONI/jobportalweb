package com.example.demo.JobPortal.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ViewMappingController {
	
	@RequestMapping(value = "/applied", method = RequestMethod.GET)
	public String OpenJobPage(ModelMap model,  HttpServletRequest request) {
 		return "Jobsdetails";
	}
	@RequestMapping(value = "/Login", method = RequestMethod.GET)
	public String OpenLoginPage(ModelMap model,  HttpServletRequest request) {
 		return "Login";
	}
	@RequestMapping(value = "/Jobs", method = RequestMethod.GET)
	public String OpenJobsPage(ModelMap model,  HttpServletRequest request) {
 		return "jobs";
	}
	@RequestMapping(value = "/addjob", method = RequestMethod.GET)
	public String OpenUserPage(ModelMap model,  HttpServletRequest request) {
 		return "addJob";
	}
	
}
