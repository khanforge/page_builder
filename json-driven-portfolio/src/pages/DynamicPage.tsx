import { redirect, useParams } from 'react-router-dom';
import Navigation from '@/components/layout/Navigation';
import Footer from '@/components/layout/Footer';
import { fetchPageSlugs } from '@/lib/api';
import { useEffect, useState } from 'react';
import PageRenderer from '@/components/renderers/PageRenderer';

const DynamicPage = () => {
  const [data, setData] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const loadPages = async () => {
      try {
        const res = await fetchPageSlugs();
        setData(res);
        console.log(data);
      } catch (e) {
        console.error(e);
      } finally {
        setLoading(false);
      }
    };
    loadPages();
  }, []);

  if (loading) {
    return <div className="min-h-screen flex items-center justify-center">Loading…</div>;
  }

  console.log(data)

  if (!data) {
    return (
      <div className="min-h-screen flex flex-col">
        <Navigation navItems={data}/>
        <main className="flex-1 flex items-center justify-center pt-nav">
          <div className="text-center portfolio-container">
            <h1 className="text-4xl font-medium mb-4">Page Not Found</h1>
            <a href="/" className="text-accent">← Back to Home</a>
          </div>
        </main>
        <Footer />
      </div>
    );
  }

  return (
    <div className="min-h-screen flex flex-col">
      <Navigation navItems={data} />
      <PageRenderer />
      <Footer />
    </div>
  );
};

export default DynamicPage;
