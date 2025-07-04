import React from 'react';
import EmployeeForm from './EmployeeForm';
import EmployeeList from './EmployeeList';

export default function App() {
  const reload = () => document.getElementById('reload-btn')?.click();

  return (
    <>
      <h1>Employee Directory</h1>
      <EmployeeForm onSaved={reload} />
      <EmployeeList />
    </>
  );
}
