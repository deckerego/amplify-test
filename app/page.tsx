"use client";

import { useState, useEffect } from "react";
import "./../app/app.css";
import { Amplify } from "aws-amplify";
import outputs from "@/amplify_outputs.json";
import "@aws-amplify/ui-react/styles.css";

Amplify.configure(outputs);

export async function getServerSideProps() {
  const res = await fetch(`https://pokeapi.co/api/v2/pokemon/ditto/`);
  const data = await res.json();
 
  // Pass data to the page via props
  return { props: { data } }
}

export type Todo = { id: string, content: string, }[];

export default function App() {
  const [todos, setTodos] = useState<Todo>([]);

  function listTodos() {
    return [];
  }

  useEffect(() => {
    listTodos();
  }, []);

  function createTodo() {
    window.prompt("Todo content");
  }

  return (
    <main>
      <h1>My todos</h1>
      <button onClick={createTodo}>+ new</button>
      <ul>
        {todos.map((todo) => (
          <li key={todo.id}>{todo.content}</li>
        ))}
      </ul>
      <div>
        Let's delete AppSync! It sucks!
      </div>
    </main>
  );
}
