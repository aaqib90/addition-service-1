package com.prolifics.controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin(origins = "*")
@RequestMapping("/add")
@RestController
public class AdditionController {

	@RequestMapping(value = "{num1}/{num2}", method = RequestMethod.GET)
	public @ResponseBody String addThese(@PathVariable(value = "num1") Long num1,@PathVariable(value = "num2") Long num2){
		return String.valueOf(num1+num2);	
	}
	
	
}
