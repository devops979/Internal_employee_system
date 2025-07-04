import React, { useEffect, useState } from 'react';

export default function EmployeeList() {
  const [employees, setEmployees] = useState([]);

  const load = () =>
    fetch('/api/employees')
      .then(r => r.json())
      .then(setEmployees);

  useEffect(load, []);

  return (
    <>
      {/* Hidden button so parent can trigger a reload */}
      <button id="reload-btn" style={{ display: 'none' }} onClick={load} />
      <ul>
        {employees.map(e => (
          <li key={e.id}>
            {e.name} — {e.department}
          </li>
        ))}
      </ul>
    </>
  );
}
