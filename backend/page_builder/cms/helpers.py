from page_builder.models import ContentBlock

def parse_data(content_block_id=None, all=False):
    if all:
        content_blocks = ContentBlock.objects.filter(content_type = "list")
    if content_block_id:
        content_blocks = ContentBlock.objects.filter(id=content_block_id, content_type = "list")
    
    if content_blocks:
        for block in content_blocks:
            data = block.data
            filtered = [item.strip() for item in data if item.strip() != '']
            block.data = filtered
            block.save()

    