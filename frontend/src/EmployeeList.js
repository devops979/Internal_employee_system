import React, {useEffect, useState} from 'react';

export default function EmployeeList(){
  const [employees, setEmployees] = useState([]);

  useEffect(()=>{
    fetch('/api/employees')
      .then(r=>r.json())
      .then(setEmployees);
  }, []);

  return (
    <ul>
      {employees.map(emp=>(
        <li key={emp.id}>{emp.name} — {emp.department}</li>
      ))}
    </ul>
  );
}
