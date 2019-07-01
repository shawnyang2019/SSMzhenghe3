package com.shawnyanglearning.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shawnyanglearning.bean.Employee;
import com.shawnyanglearning.bean.Msg;
import com.shawnyanglearning.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 处理员工CRUD请求
 */
@Controller
@RequestMapping("/")
public class EmployeeController {

	@Autowired
	EmployeeService employeeService;

	/**
	 *需要导入jackson包
	 * @param pn
	 * @return
	 */
//	@RequestMapping("emps")
	// @ResponseBody 用来把返回回来的数据变成字符串，需要导入jackson 包
//	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		// 这不是一个分页查询
		// 引入PageHelper分页插件
		// 使用分页查询时，只需要在查询之前调用PageHelper.startPage()方法,传入页码以及每页的大小
		PageHelper.startPage(pn, 5);
		// startPage后面紧跟的查询就是一个分页查询
		List<Employee> emps = employeeService.getAll();
		// 用PageInfo对结果进行包装，只需要将pageInfo交给页面就行了
		// 封装了详细的分页信息，包括我们查询出来的数据,连续显示的页数是5页
		PageInfo page = new PageInfo(emps, 5);
		return Msg.success().add("pageInfo",page);
	}

	/**
	 * 查询员工数据（分页查询）
	 * 
	 * @return
	 */
	 @RequestMapping("emps")
	public String getEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
		// 这不是一个分页查询
		// 引入PageHelper分页插件
		// 使用分页查询时，只需要在查询之前调用PageHelper.startPage()方法,传入页码以及每页的大小
		PageHelper.startPage(pn, 5);
		// startPage后面紧跟的查询就是一个分页查询
		List<Employee> emps = employeeService.getAll();
		// 用PageInfo对结果进行包装，只需要将pageInfo交给页面就行了
		// 封装了详细的分页信息，包括我们查询出来的数据,连续显示的页数是5页
		PageInfo page = new PageInfo(emps, 5);
		model.addAttribute("pageInfo", page);
		return "list";
	}
}
