"use client";

import { useState, useEffect } from "react";
/* import { generateClient } from "aws-amplify/data"; */
/* import type { Schema } from "@/amplify/data/resource"; */
import "./../app/app.css";
import { Amplify } from "aws-amplify";
import outputs from "@/amplify_outputs.json";
import "@aws-amplify/ui-react/styles.css";

Amplify.configure(outputs);

/* const client = generateClient<Schema>(); */
export type Todo = { id: string, content: string, }[];

export default function App() {
//const [todos, setTodos] = useState<Array<Schema["Todo"]["type"]>>([]);
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
