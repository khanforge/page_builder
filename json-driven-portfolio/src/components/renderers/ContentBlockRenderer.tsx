import { ContentBlock } from '@/types/cms';

interface ContentBlockRendererProps {
  block: ContentBlock;
  variant?: 'default' | 'hero' | 'card' | 'card-image' | 'service' | 'split' | 'split-image' | 'timeline' | 'timeline-date' | 'showcase' | 'showcase-image' | 'centered' | 'social' | 'publications' | 'interest-cards';
}

/**
 * Helper function to parse list data that may come as:
 * - A proper array: ["item1", "item2"]
 * - A Python-style string: "['item1', 'item2']"
 * - A JSON string: '["item1", "item2"]'
 */
const parseListData = (data: string | string[]): string[] => {
  // If already an array, return it
  if (Array.isArray(data)) {
    return data;
  }
  
  // If it's a string, try to parse it
  if (typeof data === 'string') {
    // Empty string check
    if (!data.trim()) return [];
    
    try {
      // Try parsing as JSON first
      const parsed = JSON.parse(data);
      if (Array.isArray(parsed)) {
        return parsed;
      }
    } catch {
      // If JSON parse fails, try Python-style list parsing
      // Format: "['item1', 'item2']" or '["item1", "item2"]'
      const trimmed = data.trim();
      if (trimmed.startsWith('[') && trimmed.endsWith(']')) {
        // Remove brackets and split by comma, handling quotes
        const inner = trimmed.slice(1, -1);
        const items: string[] = [];
        let current = '';
        let inQuote = false;
        let quoteChar = '';
        
        for (let i = 0; i < inner.length; i++) {
          const char = inner[i];
          
          if ((char === '"' || char === "'") && !inQuote) {
            inQuote = true;
            quoteChar = char;
          } else if (char === quoteChar && inQuote) {
            inQuote = false;
            quoteChar = '';
          } else if (char === ',' && !inQuote) {
            if (current.trim()) {
              items.push(current.trim());
            }
            current = '';
          } else {
            current += char;
          }
        }
        
        if (current.trim()) {
          items.push(current.trim());
        }
        
        return items;
      }
      
      // If not a list format, return as single item
      return [data];
    }
  }
  
  return [];
};

/**
 * ContentBlockRenderer - Renders individual content blocks based on content_type
 * 
 * Supported content types:
 * - text: Renders as <p> paragraph
 * - list: Renders as tags/pills or <ul>
 * - numbered_list: Renders as <ol> ordered list
 * - link: Renders as <a> anchor tag or button
 * - image: Renders as <img> with proper alt text
 */
const ContentBlockRenderer = ({ block, variant = 'default' }: ContentBlockRendererProps) => {
  // Skip rendering if block is inactive
  if (!block.is_active) return null;

  // Skip empty text blocks
  if (block.content_type === 'text' && typeof block.data === 'string' && !block.data.trim()) {
    return null;
  }

  switch (block.content_type) {
    case 'text':
      const textData = block.data as string;
      
      // Timeline date variant
      if (variant === 'timeline-date') {
        return (
          <p className="timeline-date">
            {textData}
          </p>
        );
      }
      
      // Hero text - larger
      if (variant === 'hero') {
        return (
          <p className="text-lg md:text-xl text-muted-foreground max-w-xl">
            {textData}
          </p>
        );
      }
      
      // Centered text
      if (variant === 'centered') {
        return (
          <p className="text-lg text-muted-foreground">
            {textData}
          </p>
        );
      }
      
      // Split layout text
      if (variant === 'split') {
        return (
          <p className="text-lg text-muted-foreground leading-relaxed">
            {textData}
          </p>
        );
      }
      
      // Showcase text
      if (variant === 'showcase') {
        return (
          <p className="text-lg text-muted-foreground">
            {textData}
          </p>
        );
      }

      // Default text
      return (
        <p className="content-block text-muted-foreground text-base md:text-lg leading-relaxed">
          {textData}
        </p>
      );

    case 'list':
      const listItems = parseListData(block.data as string | string[]);
      
      // Skip if no items
      if (listItems.length === 0) return null;
      
      // Card and showcase variant - tech tags
      if (variant === 'card' || variant === 'showcase') {
        return (
          <div className="flex flex-wrap gap-2">
            {listItems.map((item, index) => (
              <span key={index} className="tech-tag">
                {item}
              </span>
            ))}
          </div>
        );
      }
      
      // Publications variant - numbered academic papers
      if (variant === 'publications') {
        return (
          <ol className="space-y-4">
            {listItems.map((item, index) => (
              <li key={index} className="flex gap-4 p-4 rounded-xl bg-card/50 border border-border/30 hover:border-accent/30 transition-colors">
                <span className="flex-shrink-0 w-8 h-8 rounded-lg bg-accent/10 text-accent text-sm font-semibold flex items-center justify-center">
                  {index + 1}
                </span>
                <p className="text-muted-foreground text-sm leading-relaxed pt-1">
                  {item}
                </p>
              </li>
            ))}
          </ol>
        );
      }
      
      // Interest cards variant - category based display
      if (variant === 'interest-cards') {
        return (
          <div className="grid gap-4">
            {listItems.map((item, index) => {
              // Parse "Category: items" format
              const colonIndex = item.indexOf(':');
              const category = colonIndex > -1 ? item.substring(0, colonIndex).trim() : '';
              const details = colonIndex > -1 ? item.substring(colonIndex + 1).trim() : item;
              
              return (
                <div key={index} className="p-5 rounded-xl bg-card border border-border/50 hover:border-accent/30 transition-all hover:shadow-soft">
                  {category && (
                    <h4 className="text-accent font-semibold mb-2 text-sm uppercase tracking-wide">
                      {category}
                    </h4>
                  )}
                  <p className="text-muted-foreground text-sm leading-relaxed">
                    {details}
                  </p>
                </div>
              );
            })}
          </div>
        );
      }
      
      // Default - bullet list
      return (
        <ul className="content-block space-y-2 text-muted-foreground">
          {listItems.map((item, index) => (
            <li key={index} className="flex items-start gap-3">
              <span className="w-1.5 h-1.5 rounded-full bg-accent mt-2.5 flex-shrink-0" />
              <span className="text-base leading-relaxed">{item}</span>
            </li>
          ))}
        </ul>
      );

    case 'numbered_list':
      const numberedItems = parseListData(block.data as string | string[]);
      
      // Skip if no items
      if (numberedItems.length === 0) return null;
      
      // Showcase variant - stats/achievements
      if (variant === 'showcase') {
        return (
          <ul className="space-y-3">
            {numberedItems.map((item, index) => (
              <li key={index} className="flex items-start gap-3 text-muted-foreground">
                <span className="flex-shrink-0 w-6 h-6 rounded-full bg-accent/10 text-accent text-xs font-medium flex items-center justify-center">
                  {index + 1}
                </span>
                <span>{item}</span>
              </li>
            ))}
          </ul>
        );
      }
      
      // Default numbered list
      return (
        <ol className="content-block space-y-3 text-muted-foreground">
          {numberedItems.map((item, index) => (
            <li key={index} className="flex items-start gap-3">
              <span className="flex-shrink-0 w-6 h-6 rounded-full bg-accent/10 text-accent text-xs font-semibold flex items-center justify-center">
                {index + 1}
              </span>
              <span className="text-base leading-relaxed pt-0.5">{item}</span>
            </li>
          ))}
        </ol>
      );

    case 'link':
      const linkData = block.data as { url: string; text?: string };
      
      // Hero CTA button
      if (variant === 'hero') {
        return (
          <a
            href={linkData.url}
            target={linkData.url.startsWith('mailto:') ? undefined : '_blank'}
            rel="noopener noreferrer"
            className="inline-flex items-center gap-2 px-8 py-4 mt-4 rounded-full bg-accent text-accent-foreground font-medium text-lg transition-all hover:scale-105 hover:shadow-glow"
          >
            {linkData.text || linkData.url}
          </a>
        );
      }
      
      // Centered email link
      if (variant === 'centered') {
        return (
          <a
            href={linkData.url}
            target={linkData.url.startsWith('mailto:') ? undefined : '_blank'}
            rel="noopener noreferrer"
            className="inline-block text-3xl md:text-4xl font-display font-semibold text-gradient hover:opacity-80 transition-opacity"
          >
            {linkData.text || linkData.url}
          </a>
        );
      }
      
      // Social link buttons
      if (variant === 'social') {
        return (
          <a
            href={linkData.url}
            target="_blank"
            rel="noopener noreferrer"
            className="social-link"
          >
            {linkData.text || linkData.url}
          </a>
        );
      }
      
      // Card and showcase variant - styled link
      if (variant === 'card' || variant === 'showcase') {
        return (
          <a
            href={linkData.url}
            target="_blank"
            rel="noopener noreferrer"
            className="inline-flex items-center gap-2 text-accent font-medium hover:gap-3 transition-all group"
          >
            {linkData.text || linkData.url}
          </a>
        );
      }
      
      // Default link with animated underline
      return (
        <div className="content-block">
          <a
            href={linkData.url}
            target={linkData.url.startsWith('mailto:') ? undefined : '_blank'}
            rel="noopener noreferrer"
            className="link-hover text-accent font-medium text-base md:text-lg transition-colors hover:text-accent/80"
          >
            {linkData.text || linkData.url}
          </a>
        </div>
      );

    case 'image':
      const imageData = block.data as { url: string; alt?: string };
      
      // Card image - full width with hover effect
      if (variant === 'card-image') {
        return (
          <img
            src={imageData.url}
            alt={imageData.alt || 'Project image'}
            className="project-card-image transition-transform duration-500 group-hover:scale-105"
            loading="lazy"
          />
        );
      }
      
      // Split image - rounded with glow
      if (variant === 'split-image') {
        return (
          <img
            src={imageData.url}
            alt={imageData.alt || 'Image'}
            className="relative w-full rounded-2xl shadow-medium object-cover aspect-[4/5]"
            loading="lazy"
          />
        );
      }
      
      // Showcase image - large display
      if (variant === 'showcase-image') {
        return (
          <div className="relative group overflow-hidden rounded-2xl">
            <div className="absolute inset-0 bg-gradient-to-br from-accent/10 to-purple-500/10 opacity-0 group-hover:opacity-100 transition-opacity duration-500" />
            <img
              src={imageData.url}
              alt={imageData.alt || 'Project image'}
              className="w-full aspect-[16/10] object-cover transition-transform duration-500 group-hover:scale-105"
              loading="lazy"
            />
          </div>
        );
      }
      
      // Default image with figure/caption
      return (
        <figure className="content-block my-8">
          <img
            src={imageData.url}
            alt={imageData.alt || 'Portfolio image'}
            className="w-full max-w-lg rounded-2xl shadow-medium"
            loading="lazy"
          />
          {imageData.alt && (
            <figcaption className="mt-4 text-sm text-muted-foreground">
              {imageData.alt}
            </figcaption>
          )}
        </figure>
      );

    default:
      // Gracefully handle unknown content types
      console.warn(`Unknown content type: ${block.content_type}`);
      return null;
  }
};

export default ContentBlockRenderer;
