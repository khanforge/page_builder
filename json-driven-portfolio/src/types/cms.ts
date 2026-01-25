// CMS Type Definitions
// These types define the structure of the JSON data from the backend

export interface ContentBlock {
  id: number;
  content_type: 'text' | 'list' | 'numbered_list' | 'link' | 'image';
  data: string | string[] | { url: string; text?: string; alt?: string };
  order: number;
  is_active: boolean;
}

export interface SubComponent {
  id: number;
  title: string;
  is_active: boolean;
  content_blocks: ContentBlock[];
}

export interface Component {
  id: number;
  title: string;
  slug?: string;
  is_active: boolean;
  layout?: 'default' | 'hero' | 'grid' | 'cards' | 'split' | 'timeline' | 'showcase' | 'centered' | 'links' | 'publications';
  sub_components: SubComponent[];
}

export interface Profile {
  id: number;
  image: string | null;
  image_badge?: string;
  designation: string;
  organisation: string;
  org_short_name?: string;
  address?: string;
  badge?: string;
  user?: number;
  link?: number[];
}

export interface PageMeta {
  description?: string;
  subtitle?: string;
}

export interface Page {
  id: number;
  title: string;
  slug: string;
  meta?: PageMeta;
  profile?: Profile;
  keyword?: string | null;
  footer?: string | null;
  components: Component[];
}

export type CMSData = Page[];
