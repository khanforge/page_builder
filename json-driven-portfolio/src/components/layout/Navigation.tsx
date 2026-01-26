import { useState, useEffect } from 'react';
import { Link, useLocation } from 'react-router-dom';
import { Menu, X } from 'lucide-react';
import { redirect } from 'react-router-dom';


/**
 * Navigation - Dynamic navigation component
 * - Page slugs drive page navigation
 * - Component slugs drive smooth scrolling within the page
 * - Responsive design with mobile menu
 */
const Navigation = ({ navItems }) => {
  const location = useLocation();
  const currentPath = location.pathname;
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);
  const pages = navItems?.result;
  const user = navItems?.user;

  return (
    <nav className="fixed top-0 left-0 right-0 h-nav glass border-b border-border/50 z-50">
      <div className="portfolio-container h-full flex items-center justify-between">
        {/* Logo / Brand */}
        <Link 
          to="/" 
          className="font-display text-xl font-semibold text-foreground hover:text-accent transition-colors"
        >
          {user?.first_name} {user?.last_name}
        </Link>

        {/* Desktop Menu */}
        <ul className="hidden md:flex items-center gap-6">
          {/* Page links */}
          {pages.map(page => {
            const path = page.slug === '' ? '/' : `/${page.slug}`;
            const isActive = currentPath === path;
            return (
              <li key={page.slug}>
                <Link
                  to={path}
                  className={`text-sm font-medium py-2 transition-colors ${
                    isActive ? 'text-accent font-bold' : 'text-muted-foreground hover:text-foreground'
                  }`}
                >
                  {page.title || page.slug}
                </Link>
              </li>
            );
          })}

          {/* Sections of current page
          {sections.map(section => (
            <li key={section.id}>
              <button
                onClick={() => scrollToSection(section.slug || section.title.toLowerCase().replace(/\s+/g, '-'))}
                className="text-sm font-medium text-muted-foreground hover:text-foreground transition-colors py-2"
              >
                {section.title}
              </button>
            </li>
          ))} */}
        </ul>

        {/* Mobile Menu Button */}
        <button 
          className="md:hidden p-2 text-foreground"
          onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
          aria-label="Toggle menu"
        >
          {mobileMenuOpen ? <X size={24} /> : <Menu size={24} />}
        </button>
      </div>

      {/* Mobile Menu */}
      {mobileMenuOpen && (
        <div className="md:hidden absolute top-full left-0 right-0 glass border-b border-border/50 animate-fade-in">
          <ul className="portfolio-container py-6 space-y-4">
            {/* Page links */}
            {pages.map(page => {
              const path = page.slug === '' ? '/' : `/${page.slug}`;
              return (
                <li key={page.slug}>
                  <Link
                    to={path}
                    onClick={() => setMobileMenuOpen(false)}
                    className="block text-lg font-medium text-muted-foreground hover:text-foreground transition-colors py-2 w-full text-left"
                  >
                    {page.title || page.slug}
                  </Link>
                </li>
              );
            })}

            {/* Section links */}
            {/* {sections.map(section => (
              <li key={section.id}>
                <button
                  onClick={() => scrollToSection(section.slug || section.title.toLowerCase().replace(/\s+/g, '-'))}
                  className="block text-lg font-medium text-muted-foreground hover:text-foreground transition-colors py-2 w-full text-left"
                >
                  {section.title}
                </button>
              </li>
            ))} */}
          </ul>
        </div>
      )}
    </nav>
  );
};

export default Navigation;
