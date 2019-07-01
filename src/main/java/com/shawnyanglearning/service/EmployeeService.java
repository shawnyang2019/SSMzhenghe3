package com.shawnyanglearning.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shawnyanglearning.bean.Employee;
import com.shawnyanglearning.dao.EmployeeMapper;

@Service
public class EmployeeService {

	@Autowired
	EmployeeMapper employeeMapper;

	/**
	 * 查询所有员工（分页查询）
	 * 查询的是所有的数据，没有其他的查询条件，所有入参是null
	 * @return
	 */

	public List<Employee> getAll() {
		return employeeMapper.selectByExampleWithDept(null);
	}

}
