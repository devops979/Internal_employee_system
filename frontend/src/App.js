import React from 'react';
import EmployeeList from './EmployeeList';
import EmployeeForm from './EmployeeForm';

export default function App() {
  return (
    <div style={{padding:'1rem'}}>
      <h1>Employee Directory</h1>
      <EmployeeForm/>
      <EmployeeList/>
    </div>
  );
}
