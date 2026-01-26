import PageComponentsClient from "./page-components-client";

export default async function Page({
  params,
}: {
  params: Promise<{ pageId: string }>;
}) {
  const { pageId } = await params; 

  return <PageComponentsClient pageId={pageId} />;
}
