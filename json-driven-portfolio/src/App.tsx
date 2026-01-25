import { Toaster } from "@/components/ui/toaster";
import { Toaster as Sonner } from "@/components/ui/sonner";
import { TooltipProvider } from "@/components/ui/tooltip";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import DynamicPage from "./pages/DynamicPage";

const queryClient = new QueryClient();

/**
 * App - Root component with routing
 * 
 * Uses a single DynamicPage component that handles all routes
 * The DynamicPage component fetches the appropriate page based on the URL slug
 */
const App = () => (
  <QueryClientProvider client={queryClient}>
    <TooltipProvider>
      <Toaster />
      <Sonner />
      <BrowserRouter>
        <Routes>
          {/* Home page (empty slug) */}
          <Route path="/" element={<DynamicPage />} />
          {/* All other dynamic pages */}
          <Route path="/:slug" element={<DynamicPage />} />
        </Routes>
      </BrowserRouter>
    </TooltipProvider>
  </QueryClientProvider>
);

export default App;
