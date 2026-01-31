// src/pages/index.tsx
import { GetServerSideProps } from 'next';

export const getServerSideProps: GetServerSideProps = async () => {
  return {
    redirect: {
      destination: '/home', // your default CMS home slug
      permanent: false,
    },
  };
};

export default function Index() {
  return null;
}
