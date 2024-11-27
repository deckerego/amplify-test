export const dynamic = 'force-dynamic';

import "./../app/app.css";
import { Amplify } from "aws-amplify";
import outputs from "@/amplify_outputs.json";
import "@aws-amplify/ui-react/styles.css";

Amplify.configure(outputs);

export default async function App() {
  let data = await fetch('https://api.vercel.app/blog');
  let posts = await data.json();
  return (
    <main>
      <h1>Server Side Rendering</h1>
      <ul>
        <li key={posts[0].id}>{posts[0].title}</li>
        <li key={posts[1].id}>{posts[1].title}</li>
        <li key={posts[2].id}>{posts[2].title}</li>
      </ul>
    </main>
  )
}
