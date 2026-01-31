import DynamicPage from "./[...slug]";

export default function Home() {
  return (
    <DynamicPage page={{ profile: { first_name: '', last_name: '' }, sections: [] }} />
  );
}
