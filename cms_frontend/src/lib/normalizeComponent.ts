export function normalizeComponent(apiData: any) {
  return {
    title: apiData.title,
    is_active: apiData.is_active,
    subcomponents: apiData.sub_components.map((sc: any) => ({
      id: sc.id,
      title: sc.title,
      is_active: sc.is_active,
      content: sc.content_blocks.map((cb: any) => {
        let parsedData = cb.data;

        if (
          (cb.content_type === "list" ||
            cb.content_type === "numbered_list") &&
          typeof cb.data === "string"
        ) {
          try {
            parsedData = JSON.parse(cb.data.replace(/'/g, '"'));
          } catch {
            parsedData = [];
          }
        }

        return {
          id: cb.id,
          content_type: cb.content_type,
          data: parsedData,
          is_active: cb.is_active,
        };
      }),
    })),
  };
}
