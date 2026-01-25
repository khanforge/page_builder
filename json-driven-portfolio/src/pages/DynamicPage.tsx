import { useParams } from 'react-router-dom';
import PageRenderer from '@/components/renderers/PageRenderer';
import Navigation from '@/components/layout/Navigation';
import Footer from '@/components/layout/Footer';
import { fetchPages } from '@/lib/api';
import { useEffect, useState } from 'react';

const DynamicPage = () => {
  const { slug } = useParams<{ slug: string }>();
  const currentSlug = slug || '';

  const [data, setData] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const loadPages = async () => {
      try {
        const res = await fetchPages();
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

  const page = data.find(p => p.slug === currentSlug);
  console.log(page)

  if (!page) {
    return (
      <div className="min-h-screen flex flex-col">
        <Navigation pages={data} />
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
      <Navigation pages={data} />
      <PageRenderer page={page} />
      <Footer />
    </div>
  );
};

export default DynamicPage;
