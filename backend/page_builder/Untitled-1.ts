{
    page_id: <pageId from params>,
    title: <title of the compoent or h2>
    links: [
        {
            label: <label>,
            url: <url link>
        }
        {
            label: <label>,
            url: <url link>
        }
        ...
    ],
    is_active:<true or false>,
    subcomponents:[
        {
            title: <title>,
            is_active: <true or false>,
            content: [
                {
                    content_type: <choices=< text, list, numbered_list, image(will give this option later), link >>,
                data: <
                    fascility to add either list, or text    
                >
                    
                }
            ]
        },
        {
            title: <title>,
                is_active: <true or false >
                content: [
                {
                    content_type: <choices=< text, list, numbered_list, image(will give this option later), link >>,
                data: <
                    fascility to add either list, or text    
                >
                    
                }
            ]
        },
        ...
    ],

}