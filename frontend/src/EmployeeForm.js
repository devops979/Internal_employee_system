import React, { useState } from 'react';

export default function EmployeeForm({ onSaved }) {
  const [name, setName] = useState('');
  const [department, setDepartment] = useState('');

  async function handleSubmit(e) {
    e.preventDefault();

    await fetch('/api/employees', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ name, department })
    });

    setName('');
    setDepartment('');
    onSaved && onSaved();        // refresh the list
  }

  return (
    <form onSubmit={handleSubmit}>
      <input
        value={name}
        onChange={e => setName(e.target.value)}
        placeholder="Name"
        required
      />
      <input
        value={department}
        onChange={e => setDepartment(e.target.value)}
        placeholder="Department"
        required
      />
      <button type="submit">Add</button>
    </form>
  );
}
