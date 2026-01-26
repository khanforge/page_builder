import { Component, PageMeta, Profile } from '@/types/cms';
import SubComponentRenderer from './SubComponentRenderer';

interface ComponentRendererProps {
  component: Component;
  pageTitle?: string;
  pageMeta?: PageMeta;
  profile?: Profile;
  isFirst?: boolean;
}

/**
 * ComponentRenderer - Renders a component section with its title and subcomponents
 * 
 * - Supports multiple layouts: default, hero, grid, cards, split, timeline, showcase, centered, links, publications
 * - Renders as a semantic <section> element
 * - Title rendered as <h2>
 * - Filters out inactive subcomponents
 * - Adds ID for scroll navigation
 */
const ComponentRenderer = ({ component, pageTitle, pageMeta, profile, isFirst }: ComponentRendererProps) => {
  // Skip rendering if component is inactive
  if (!component.is_active) return null;

  // Filter active subcomponents
  const activeSubComponents = component.sub_components.filter(sub => sub.is_active);

  // Don't render if no active subcomponents
  if (activeSubComponents.length === 0) return null;

  const layout = component.layout || 'default';
  
  // Generate section ID for scroll navigation
  const sectionId = component.slug || component.title.toLowerCase().replace(/\s+/g, '-');

  // Hero layout - special full-height section with profile info
  if (layout === 'hero' && profile) {
    return (
      <section id={sectionId} className="hero-section scroll-mt-nav">
        <div className="portfolio-container">
          <div className="grid lg:grid-cols-2 gap-12 lg:gap-20 items-center">
            <div className="order-2 lg:order-1">
              {profile.image_badge && (
                <span className="inline-block px-4 py-1.5 text-sm font-medium bg-accent/10 text-accent rounded-full mb-6 animate-fade-in opacity-0">
                  {profile.image_badge}
                </span>
              )}
              <h1 className="text-foreground mb-4 animate-fade-in-up opacity-0 stagger-1">
                {pageTitle}
              </h1>
              <p className="text-xl md:text-2xl text-muted-foreground mb-2 animate-fade-in-up opacity-0 stagger-2">
                {profile.designation}
              </p>
              <p className="text-lg text-accent mb-6 animate-fade-in-up opacity-0 stagger-2">
                {profile.organisation}
              </p>
              {profile.address && (
                <p className="text-muted-foreground text-sm leading-relaxed animate-fade-in-up opacity-0 stagger-3">
                  {profile.address}
                </p>
              )}
            </div>
            {profile.image && (
              <div className="order-1 lg:order-2 animate-fade-in opacity-0 stagger-3">
                <div className="relative">
                  <div className="absolute inset-0 bg-gradient-to-br from-accent/20 to-purple-500/20 rounded-3xl blur-3xl scale-110" />
                  <img
                    src={profile.image}
                    alt={pageTitle || 'Profile'}
                    className="relative w-full max-w-md mx-auto rounded-3xl shadow-medium object-cover aspect-[4/5]"
                  />
                </div>
              </div>
            )}
          </div>
        </div>
      </section>
    );
  }

  // Publications layout - numbered academic papers
  if (layout === 'publications') {
    return (
      <section id={sectionId} className="portfolio-section scroll-mt-nav">
        <div className="portfolio-container">
          <h2 className="text-foreground mb-12 animate-fade-in opacity-0">
            {component.title}
          </h2>
          <div className="space-y-4">
            {component.sub_components.map((subComponent, index) => (
              <div 
                key={subComponent.id}
                className="animate-fade-in-up opacity-0"
                style={{ animationDelay: `${(index + 1) * 100}ms` }}
              >
                <SubComponentRenderer subComponent={subComponent} layout="publications" />
              </div>
            ))}
          </div>
        </div>
      </section>
    );
  }

  // Cards layout for areas of interest
  if (layout === 'cards') {
    return (
      <section id={sectionId} className="portfolio-section bg-gradient-to-b from-background to-card scroll-mt-nav">
        <div className="portfolio-container">
          <h2 className="text-foreground mb-12 animate-fade-in opacity-0">
            {component.title}
          </h2>
          <div className="max-w-4xl">
            {component.sub_components.map((subComponent, index) => (
              <div 
                key={subComponent.id}
                className="animate-fade-in-up opacity-0"
                style={{ animationDelay: `${(index + 1) * 100}ms` }}
              >
                <SubComponentRenderer subComponent={subComponent} layout="interest-cards" />
              </div>
            ))}
          </div>
        </div>
      </section>
    );
  }

  // Grid layout for project cards
  if (layout === 'grid') {
    return (
      <section id={sectionId} className="portfolio-section scroll-mt-nav">
        <div className="portfolio-container">
          <h2 className="text-foreground mb-16 animate-fade-in opacity-0">
            {component.title}
          </h2>
          <div className="grid md:grid-cols-2 gap-8">
            {component.sub_components.map((subComponent, index) => (
              <div 
                key={subComponent.id}
                className="animate-fade-in-up opacity-0"
                style={{ animationDelay: `${(index + 1) * 100}ms` }}
              >
                <SubComponentRenderer subComponent={subComponent} layout="card" />
              </div>
            ))}
          </div>
        </div>
      </section>
    );
  }

  // Split layout - image on one side, content on other
  if (layout === 'split') {
    return (
      <section id={sectionId} className="portfolio-section scroll-mt-nav">
        <div className="portfolio-container">
          <div className="grid lg:grid-cols-2 gap-16 items-start">
            {component.sub_components.map((subComponent, index) => (
              <div 
                key={subComponent.id}
                className="animate-fade-in-up opacity-0"
                style={{ animationDelay: `${(index + 1) * 100}ms` }}
              >
                <SubComponentRenderer subComponent={subComponent} layout="split" />
              </div>
            ))}
          </div>
        </div>
      </section>
    );
  }

  // Timeline layout for experience
  if (layout === 'timeline') {
    return (
      <section id={sectionId} className="portfolio-section bg-gradient-to-b from-card to-background scroll-mt-nav">
        <div className="portfolio-container">
          <h2 className="text-foreground mb-16 animate-fade-in opacity-0">
            {component.title}
          </h2>
          <div className="max-w-3xl">
            {component.sub_components.map((subComponent, index) => (
              <div 
                key={subComponent.id}
                className="animate-fade-in-up opacity-0"
                style={{ animationDelay: `${(index + 1) * 100}ms` }}
              >
                <SubComponentRenderer subComponent={subComponent} layout="timeline" />
              </div>
            ))}
          </div>
        </div>
      </section>
    );
  }

  // Showcase layout - alternating large project displays
  if (layout === 'showcase') {
    return (
      <section id={sectionId} className="portfolio-section scroll-mt-nav">
        <div className="portfolio-container">
          <h2 className="text-foreground mb-8 animate-fade-in opacity-0">
            {component.title}
          </h2>
          <div>
            {component.sub_components.map((subComponent, index) => (
              <div 
                key={subComponent.id}
                className="showcase-item animate-fade-in-up opacity-0"
                style={{ animationDelay: `${(index + 1) * 150}ms` }}
              >
                <SubComponentRenderer subComponent={subComponent} layout="showcase" />
              </div>
            ))}
          </div>
        </div>
      </section>
    );
  }

  // Centered layout for contact/CTA sections
  if (layout === 'centered') {
    return (
      <section id={sectionId} className="portfolio-section bg-gradient-to-b from-card to-background scroll-mt-nav">
        <div className="portfolio-container">
          <div className="max-w-2xl mx-auto text-center">
            <h2 className="text-foreground mb-8 animate-fade-in opacity-0">
              {component.title}
            </h2>
            {component.sub_components.map((subComponent, index) => (
              <div 
                key={subComponent.id}
                className="animate-fade-in-up opacity-0"
                style={{ animationDelay: `${(index + 1) * 100}ms` }}
              >
                <SubComponentRenderer subComponent={subComponent} layout="centered" />
              </div>
            ))}
          </div>
        </div>
      </section>
    );
  }

  // Links layout - social links display
  if (layout === 'links') {
    return (
      <section id={sectionId} className="portfolio-section scroll-mt-nav">
        <div className="portfolio-container">
          <div className="max-w-2xl mx-auto text-center">
            <h2 className="text-foreground mb-8 animate-fade-in opacity-0">
              {component.title}
            </h2>
            {component.sub_components.map((subComponent, index) => (
              <div 
                key={subComponent.id}
                className="animate-fade-in-up opacity-0"
                style={{ animationDelay: `${(index + 1) * 100}ms` }}
              >
                <SubComponentRenderer subComponent={subComponent} layout="links" />
              </div>
            ))}
          </div>
        </div>
      </section>
    );
  }

  // Default layout - academic content sections
  return (
    <section id={sectionId} className="portfolio-section border-t border-border/50 first:border-t-0 scroll-mt-nav">
      <div className="portfolio-container">
        {/* Component title rendered as h2 */}
        <h2 className="text-foreground mb-8 animate-fade-in opacity-0">
          {component.title}
        </h2>
        
        {/* Render all active subcomponents */}
        <div className="max-w-4xl">
          {component.sub_components.map((subComponent, index) => (
            <div 
              key={subComponent.id}
              className="animate-fade-in-up opacity-0"
              style={{ animationDelay: `${(index + 1) * 100}ms` }}
            >
              <SubComponentRenderer subComponent={subComponent} layout="default" />
            </div>
          ))}
        </div>
      </div>
    </section>
  );
};

export default ComponentRenderer;
