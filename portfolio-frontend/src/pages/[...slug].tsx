import Navigation from '@/components/layout/Navigation';
import Footer from '@/components/layout/Footer';
import PageRenderer from '@/components/renderers/PageRenderer';
import { fetchPages, fetchPageSlugs } from '@/lib/api';
import { useEffect, useState } from 'react';
import { NavItems } from '@/types/cms';

interface DynamicPageProps {
  page: any; // you can type this more specifically
}

const DynamicPage = ({ page }: DynamicPageProps) => {
  const [navData, setNavData] = useState<NavItems>({ result: [], user: {} });
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const loadNavData = async () => {
      try {
        const res = await fetchPageSlugs();
        setNavData(res);
      } catch (err) {
        console.error(err);
      } finally {
        setLoading(false);
      }
    };
    loadNavData();
  }, []);

  if (loading) {
    return <div className="min-h-screen flex items-center justify-center">Loading…</div>;
  }
  
  return (
    <div className="min-h-screen flex flex-col">
      <Navigation navItems={navData} />
      
      {/* Pass the page from getServerSideProps */}
      
      <PageRenderer page={page} />

      <Footer profileInfo={navData.user || { first_name: '', last_name: '' }} />
    </div>
  );
};

export default DynamicPage;

// ---------------------------------
// SSR function to fetch page data
// ---------------------------------
export async function getServerSideProps({ params }: any) {
  try {
    // Get slug from URL
    let slug = params.slug;

    if (Array.isArray(slug)) {
      slug = slug.join('/'); // e.g., ['research-summary'] -> 'research-summary'
    }
    // Treat invalid slugs (starting with . or undefined) as null
    if (!slug || slug.startsWith('.')) {
      slug = null;
    }

    // Fetch page (fetchPages handles null -> home)
    const page = await fetchPages(slug);

    // If fetchPages returns nothing, mark as not found
    if (!page) {
      return { notFound: true };
    }

    // Return page as props
    return {
      props: { page },
    };
  } catch (err) {
    console.error('SSR fetchPages error:', err);
    return { notFound: true };
  }
}

