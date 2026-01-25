import { Page } from '@/types/cms';
import ComponentRenderer from './ComponentRenderer';

interface PageRendererProps {
  page: Page;
}

/**
 * PageRenderer - Renders a complete page with all its components
 * 
 * - Profile section with image, designation, organization
 * - Page title rendered as <h1> in hero section
 * - Iterates through all components
 * - Uses semantic <main> element for content
 */
const PageRenderer = ({ page }: PageRendererProps) => {
  // Filter active components
  const activeComponents = page.components.filter(comp => comp.is_active);

  return (
    <main className="min-h-screen pt-nav">
      {/* Hero section with profile info */}
      {page.profile && (
        <header className="hero-section">
          <div className="portfolio-container">
            <div className="grid lg:grid-cols-5 gap-12 lg:gap-16 items-center">
              {/* Profile Image */}
              {page.profile.image && (
                <div className="lg:col-span-2 animate-fade-in opacity-0">
                  <div className="relative max-w-sm mx-auto lg:mx-0">
                    <div className="absolute inset-0 bg-gradient-to-br from-accent/30 to-purple-500/20 rounded-3xl blur-3xl scale-105" />
                    <img
                      src={page.profile.image}
                      alt={page.title}
                      className="relative w-full rounded-3xl shadow-medium object-cover aspect-square"
                    />
                    {page.profile.image_badge && (
                      <span className="absolute -bottom-4 left-1/2 -translate-x-1/2 px-4 py-2 text-sm font-medium bg-accent text-white rounded-full shadow-lg whitespace-nowrap">
                        {page.profile.image_badge}
                      </span>
                    )}
                  </div>
                </div>
              )}
              
              {/* Profile Info */}
              <div className={`${page.profile.image ? 'lg:col-span-3' : 'lg:col-span-5'}`}>
                <h1 className="text-foreground mb-4 animate-fade-in-up opacity-0 stagger-1">
                  Dr. Anurag Singh
                </h1>
                <p className="text-xl md:text-2xl text-accent font-medium mb-3 animate-fade-in-up opacity-0 stagger-2">
                  {page.profile.designation}
                </p>
                <p className="text-lg text-muted-foreground mb-6 animate-fade-in-up opacity-0 stagger-2">
                  {page.profile.organisation}
                </p>
                {page.profile.address && (
                  <div className="flex items-start gap-3 text-muted-foreground animate-fade-in-up opacity-0 stagger-3">
                    <svg className="w-5 h-5 mt-1 text-accent flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                    </svg>
                    <p className="text-sm leading-relaxed">
                      {page.profile.address}
                    </p>
                  </div>
                )}
              </div>
            </div>
          </div>
        </header>
      )}

      {/* Fallback header if no profile */}
      {!page.profile && (
        <header className="portfolio-section bg-gradient-to-b from-card to-background">
          <div className="portfolio-container">
            <div className="max-w-4xl">
              {page.meta?.subtitle && (
                <p className="text-accent font-medium mb-4 animate-fade-in opacity-0 text-sm uppercase tracking-widest">
                  {page.meta.subtitle}
                </p>
              )}
              <h1 className="text-foreground animate-fade-in-up opacity-0 stagger-1">
                {page.title}
              </h1>
            </div>
          </div>
        </header>
      )}

      {/* Render all active components */}
      {activeComponents.length > 0 ? (
        activeComponents.map((component, index) => (
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
        // Empty state when no active components
        <section className="portfolio-section">
          <div className="portfolio-container">
            <p className="text-muted-foreground text-lg">
              This page is currently empty.
            </p>
          </div>
        </section>
      )}
    </main>
  );
};

export default PageRenderer;
