from django.apps import apps

def build_title(page, user):
    Page = apps.get_model('page_builder', 'Page')
    try:
        page_id = int(page)
        page = Page.objects.get(id = page_id, profile__user_id = user.id)
    except(ValueError, TypeError):
        pass
    except Page.DoesNotExist:
        return ""
    if page.seo_title:
        return page.seo_title

    if page.slug != "home":
        seo_title = f"{page.title} {page.profile.get_full_name} | {page.profile.designation} as {page.profile.organisation}" 
    else:
        seo_title = f"{page.profile.get_full_name} | {page.profile.designation} at {page.profile.organisation}"
    return seo_title

def build_meta_description(page, user):
    Page = apps.get_model('page_builder', 'Page')
    try:
        page_id = int(page)
        page = Page.objects.get(id = page_id, profile__user_id = user.id)
    except(ValueError, TypeError):
        pass
    except Page.DoesNotExist:
        print("Page does not exist")
        return ""

    if page.seo_description:
        return page.seo_desciption

    organisation = user.profile.organisation or ""
    name = user.profile.get_full_name
    designation = user.profile.designation or ""
    if page.title == "home":
        desc = f"{name} is a {designation}"
        if organisation:
            desc += f" at {organisation}"
        return f"{desc}. Explore projects, skills, and professional experience."

    if page.title == "about":
        return (
            f"Learn more about {name}, a {designation}, "
            f"including background, area of interest, and professional journey."
        )

    if page.title == "projects":
        return (
            f"Discover projects by {name}, a {designation}, "
            f"showcasing real-world problem solving and technical expertise."
        )

    if page.title == "contact":
        return (
            f"Get in touch with {name}, a {designation}, "
            f"for collaborations, or opportunities."
        )

    return (
        f"Explore the professional portfolio of {name}, "
        f"highlighting projects, skills, and experience."
    )