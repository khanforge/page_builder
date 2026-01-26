import { Link } from 'react-router-dom';

/**
 * Footer - Academic portfolio footer component
 */
const Footer = () => {
  const currentYear = new Date().getFullYear();

  return (
    <footer className="border-t border-border/50 py-12 mt-auto">
      <div className="portfolio-container">
        <div className="flex flex-col md:flex-row items-center justify-between gap-6">
          {/* Brand */}
          <div className="text-center md:text-left">
            <Link 
              to="/" 
              className="inline-block font-display text-xl font-semibold text-foreground hover:text-accent transition-colors mb-2"
            >
              Dr. Anurag Singh
            </Link>
            <p className="text-muted-foreground text-sm">
              Assistant Professor, NIT Delhi
            </p>
          </div>
          
          {/* Links */}
          <div className="flex items-center gap-6">
            <a 
              href="https://scholar.google.com" 
              target="_blank" 
              rel="noopener noreferrer"
              className="text-muted-foreground hover:text-accent transition-colors text-sm font-medium"
            >
              Google Scholar
            </a>
            <a 
              href="https://www.researchgate.net" 
              target="_blank" 
              rel="noopener noreferrer"
              className="text-muted-foreground hover:text-accent transition-colors text-sm font-medium"
            >
              ResearchGate
            </a>
            <a 
              href="https://linkedin.com" 
              target="_blank" 
              rel="noopener noreferrer"
              className="text-muted-foreground hover:text-accent transition-colors text-sm font-medium"
            >
              LinkedIn
            </a>
          </div>
        </div>
        
        {/* Copyright */}
        <div className="mt-8 pt-6 border-t border-border/30 text-center">
          <p className="text-sm text-muted-foreground">
            © {currentYear} Dr. Anurag Singh. All rights reserved.
          </p>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
