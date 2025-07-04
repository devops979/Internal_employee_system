import React, {useState} from 'react';

export default function EmployeeForm(){
  const [name, setName] = useState('');
  const [department, setDepartment] = useState('');

  async function handleSubmit(e){
    e.preventDefault();
    await fetch('/api/employees',{
      method:'POST',
      headers:{'Content-Type':'application/json'},
      body: JSON.stringify({name, department})
    });
    setName('');
    setDepartment('');
  }

  return (
    <form onSubmit={handleSubmit} style={{marginBottom:'1rem'}}>
      <input placeholder="Name" value={name} onChange={e=>setName(e.target.value)}/>
      <input placeholder="Department" value={department} onChange={e=>setDepartment(e.target.value)} style={{marginLeft:'0.5rem'}}/>
      <button type="submit" style={{marginLeft:'0.5rem'}}>Add</button>
    </form>
  );
}
