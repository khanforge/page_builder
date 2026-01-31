import { useEffect, useState } from "react";
import type { Page } from "@/types/cms";
import ComponentRenderer from "./ComponentRenderer";
import { fetchPages } from "@/lib/api";
import Image from "next/image";
import Head from 'next/head';

/**
 * PageRenderer - SSR version (layout unchanged)
 */
const PageRenderer = ({ page }: { page: Page }) => {
  const [sectionSlugs, setSectionSlugs] = useState<any[]>([]);
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);
  const [activeSection, setActiveSection] = useState<string>("");

  // init section slugs
  useEffect(() => {
    setSectionSlugs(page?.section_slugs || []);
  }, [page]);

  // Scroll tracking
  useEffect(() => {
    const handleScroll = () => {
      const scrollPosition = window.scrollY + 140;

      for (let i = sectionSlugs.length - 1; i >= 0; i--) {
        const section = sectionSlugs[i];
        const slug =
          section.slug || section.title.toLowerCase().replace(/\s+/g, "-");
        const element = document.getElementById(slug);

        if (element && element.offsetTop <= scrollPosition) {
          setActiveSection(slug);
          break;
        }
      }
    };

    window.addEventListener("scroll", handleScroll);
    handleScroll();

    return () => window.removeEventListener("scroll", handleScroll);
  }, [sectionSlugs]);

  const scrollToSection = (slug: string) => {
    const el = document.getElementById(slug);
    if (el) el.scrollIntoView({ behavior: "smooth" });
    setMobileMenuOpen(false);
  };
  if (!page) {
    return <div className="min-h-screen flex items-center justify-center">Page not found</div>;
  }

  return (
    
    <>
      <Head>
        <title>{page?.seo_title}</title>
        <meta name="description" content={page.seo_description} />
        {/* JSON-LD structured data */}
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{
            __html: JSON.stringify({
              "@context": "https://schema.org",
              "@type": "Person",
              "name": `${page?.profile?.user?.first_name} ${page?.profile?.user?.last_name}`,
              "jobTitle": page?.profile?.designation,
              "worksFor": {
                "@type": "Organization",
                "name": page?.profile?.organisation,
              },
              "url": `https://portfolio-seven-virid-20.vercel.app/${page.slug}`,
              "image": page?.profile?.image || undefined,
              "sameAs": page?.profile?.link || undefined, // optional: social links
            }),
          }}
          
        />
        <script type="application/ld+json" dangerouslySetInnerHTML={{
          __html: JSON.stringify({
            "@context": "https://schema.org",
            "@type": "BreadcrumbList",
            "itemListElement": page.section_slugs.map((section, index) => ({
              "@type": "ListItem",
              position: index + 1,
              name: section.title,
              item: `https://portfolio-seven-virid-20.vercel.app//${section.slug}`
            }))
          })
        }} />
        <link rel="canonical" href={`https://portfolio-seven-virid-20.vercel.app/${page.slug}`} />
      </Head>
      {/* Section Nav */}
      {sectionSlugs?.length > 0 && (
        <nav className="fixed top-20 left-0 right-0 h-15 bg-muted/80 backdrop-blur-md border-b border-border/30 z-40">
          <div className="portfolio-container h-full overflow-x-auto scrollbar-hide">
            <ul className="hidden md:flex justify-center items-center gap-1 h-full py-3">
              {sectionSlugs.map((section) => {
                const slug =
                  section.slug || section.title.toLowerCase().replace(/\s+/g, "-");
                const isActive = activeSection === slug;

                return (
                  <li key={section.id}>
                    <button
                      onClick={() => scrollToSection(slug)}
                      className={`px-4 py-2 text-sm font-medium rounded-md transition-all duration-200 whitespace-nowrap ${
                        isActive
                          ? "bg-primary text-primary-foreground shadow-sm"
                          : "text-muted-foreground hover:text-foreground hover:bg-background/50"
                      }`}
                    >
                      {section.title}
                    </button>
                  </li>
                );
              })}
            </ul>
          </div>
        </nav>
      )}

      <main className="min-h-screen pt-nav">
        {/* Profile Section */}
        {page.profile && (
          <header className="hero-section">
            <div className="portfolio-container">
              <div className="grid lg:grid-cols-5 gap-12 lg:gap-16 items-center">
                {page.profile.image && (
                  <div className="lg:col-span-2">
                    <div className="relative max-w-sm mx-auto lg:mx-0">
                      <Image
                        src={page.profile.image}
                        alt={page.title}
                        width={500}
                        height={500}
                        className="rounded-3xl object-cover"
                        priority
                      />
                    </div>
                  </div>
                )}

                <div className={`${page.profile.image ? "lg:col-span-3" : "lg:col-span-5"}`}>
                  <h1>{page.profile.user?.first_name} {page.profile.user?.last_name}</h1>
                  <p className="text-accent">{page.profile.designation}</p>
                  <p className="text-muted-foreground">{page.profile.organisation}</p>
                </div>
              </div>
            </div>
          </header>
        )}

        {!page.profile && (
          <header className="portfolio-section">
            <div className="portfolio-container">
              <h1>{page.title}</h1>
            </div>
          </header>
        )}

        {/* Components */}
        {page.components.length > 0 ? (
          page.components.map((component, index) => (
            <ComponentRenderer
              key={component.id}
              component={component}
              pageTitle={page.title}
              pageMeta={page.meta}
              profile={page.profile}
              isFirst={index === 0}
            />
          ))
        ) : (
          <section className="portfolio-section">
            <div className="portfolio-container">
              <p>This page is currently empty.</p>
            </div>
          </section>
        )}
      </main>
    </>
  );
};

export default PageRenderer;
