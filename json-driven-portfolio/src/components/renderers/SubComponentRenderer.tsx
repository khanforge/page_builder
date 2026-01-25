import { SubComponent } from '@/types/cms';
import ContentBlockRenderer from './ContentBlockRenderer';

interface SubComponentRendererProps {
  subComponent: SubComponent;
  layout?: 'default' | 'hero' | 'card' | 'service' | 'split' | 'timeline' | 'showcase' | 'centered' | 'links' | 'publications' | 'interest-cards';
}

/**
 * SubComponentRenderer - Renders a subcomponent block with its title and content blocks
 * 
 * - Supports multiple layout modes for different visual presentations
 * - Sorts content blocks by order property
 * - Filters out inactive content blocks
 */
const SubComponentRenderer = ({ subComponent, layout = 'default' }: SubComponentRendererProps) => {
  // Skip rendering if subcomponent is inactive
  if (!subComponent.is_active) return null;

  // Filter active content blocks and sort by order
  const activeBlocks = subComponent.content_blocks
    .filter(block => block.is_active)
    .sort((a, b) => a.order - b.order);

  // Don't render if no active content
  if (activeBlocks.length === 0) return null;

  // Hero layout - text and CTA only (image handled by parent)
  if (layout === 'hero') {
    const nonImageBlocks = activeBlocks.filter(b => b.content_type !== 'image');
    return (
      <div className="space-y-6">
        {nonImageBlocks.map(block => (
          <ContentBlockRenderer key={block.id} block={block} variant="hero" />
        ))}
      </div>
    );
  }

  // Card layout - project card with image, title, description, tags, link
  if (layout === 'card') {
    const imageBlock = activeBlocks.find(b => b.content_type === 'image');
    const nonImageBlocks = activeBlocks.filter(b => b.content_type !== 'image');
    
    return (
      <article className="project-card group">
        {imageBlock && (
          <div className="overflow-hidden">
            <ContentBlockRenderer block={imageBlock} variant="card-image" />
          </div>
        )}
        <div className="project-card-content">
          {subComponent.title && (
            <h3 className="text-foreground mb-4 group-hover:text-accent transition-colors">
              {subComponent.title}
            </h3>
          )}
          <div className="space-y-4">
            {nonImageBlocks.map(block => (
              <ContentBlockRenderer key={block.id} block={block} variant="card" />
            ))}
          </div>
        </div>
      </article>
    );
  }

  // Service card layout
  if (layout === 'service') {
    return (
      <article className="service-card h-full">
        <div className="w-12 h-12 rounded-xl bg-accent/10 flex items-center justify-center mb-6">
          <div className="w-6 h-6 rounded-lg bg-accent" />
        </div>
        {subComponent.title && (
          <h3 className="text-foreground mb-4">
            {subComponent.title}
          </h3>
        )}
        <div className="space-y-4">
          {activeBlocks.map(block => (
            <ContentBlockRenderer key={block.id} block={block} variant="service" />
          ))}
        </div>
      </article>
    );
  }

  // Split layout - can have image and text side by side
  if (layout === 'split') {
    const imageBlock = activeBlocks.find(b => b.content_type === 'image');
    const nonImageBlocks = activeBlocks.filter(b => b.content_type !== 'image');
    
    if (imageBlock) {
      return (
        <div className="relative">
          <div className="absolute inset-0 bg-gradient-to-br from-accent/10 to-purple-500/10 rounded-3xl blur-2xl scale-105" />
          <ContentBlockRenderer block={imageBlock} variant="split-image" />
        </div>
      );
    }
    
    return (
      <div className="space-y-6">
        {nonImageBlocks.map(block => (
          <ContentBlockRenderer key={block.id} block={block} variant="split" />
        ))}
      </div>
    );
  }

  // Timeline layout for experience entries
  if (layout === 'timeline') {
    // First text block is usually the date
    const dateBlock = activeBlocks.find(b => b.content_type === 'text');
    const otherBlocks = activeBlocks.filter(b => b !== dateBlock);
    
    return (
      <article className="timeline-item">
        {subComponent.title && (
          <h3 className="text-foreground mb-2">
            {subComponent.title}
          </h3>
        )}
        {dateBlock && (
          <ContentBlockRenderer block={dateBlock} variant="timeline-date" />
        )}
        <div className="space-y-2 mt-4">
          {otherBlocks.map(block => (
            <ContentBlockRenderer key={block.id} block={block} variant="timeline" />
          ))}
        </div>
      </article>
    );
  }

  // Showcase layout - large project display
  if (layout === 'showcase') {
    const imageBlock = activeBlocks.find(b => b.content_type === 'image');
    const nonImageBlocks = activeBlocks.filter(b => b.content_type !== 'image');
    
    return (
      <>
        {/* Image column */}
        <div className="relative overflow-hidden rounded-2xl">
          {imageBlock && (
            <ContentBlockRenderer block={imageBlock} variant="showcase-image" />
          )}
        </div>
        
        {/* Content column */}
        <div className="flex flex-col justify-center">
          {subComponent.title && (
            <h3 className="text-2xl md:text-3xl font-display font-semibold text-foreground mb-6">
              {subComponent.title}
            </h3>
          )}
          <div className="space-y-6">
            {nonImageBlocks.map(block => (
              <ContentBlockRenderer key={block.id} block={block} variant="showcase" />
            ))}
          </div>
        </div>
      </>
    );
  }

  // Centered layout
  if (layout === 'centered') {
    return (
      <div className="space-y-6">
        {activeBlocks.map(block => (
          <ContentBlockRenderer key={block.id} block={block} variant="centered" />
        ))}
      </div>
    );
  }

  // Links layout - social links
  if (layout === 'links') {
    return (
      <div>
        {subComponent.title && (
          <h3 className="text-muted-foreground text-sm uppercase tracking-widest mb-6">
            {subComponent.title}
          </h3>
        )}
        <div className="flex flex-wrap justify-center gap-4">
          {activeBlocks.map(block => (
            <ContentBlockRenderer key={block.id} block={block} variant="social" />
          ))}
        </div>
      </div>
    );
  }

  // Publications layout - numbered academic papers
  if (layout === 'publications') {
    return (
      <div className="space-y-4">
        {activeBlocks.map(block => (
          <ContentBlockRenderer key={block.id} block={block} variant="publications" />
        ))}
      </div>
    );
  }

  // Interest cards layout - category based cards
  if (layout === 'interest-cards') {
    return (
      <div className="space-y-4">
        {activeBlocks.map(block => (
          <ContentBlockRenderer key={block.id} block={block} variant="interest-cards" />
        ))}
      </div>
    );
  }

  // Default layout
  return (
    <article className="mb-12 last:mb-0">
      {/* SubComponent title rendered as h3 */}
      {subComponent.title && (
        <h3 className="text-foreground mb-4">
          {subComponent.title}
        </h3>
      )}
      
      {/* Render all active content blocks in order */}
      <div className="space-y-4">
        {activeBlocks.map(block => (
          <ContentBlockRenderer key={block.id} block={block} variant="default" />
        ))}
      </div>
    </article>
  );
};

export default SubComponentRenderer;
