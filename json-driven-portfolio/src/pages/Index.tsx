// This file is kept for reference but routing now uses DynamicPage
// See src/pages/DynamicPage.tsx for the main page component

import { Navigate } from 'react-router-dom';

const Index = () => {
  return <Navigate to="/" replace />;
};

export default Index;
