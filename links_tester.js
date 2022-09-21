// Retrieve all the links on the current page
let links = document.links;

// Retrieve the current pagename
let path = window.location.pathname;
let pagename = path.split("/").pop();

// Loop over all of the retrieved links
for (let item of links) {
    
    let url = item.href
    let filename = url.split('/').pop();

    // If the current url does not include the pagename, open the link
    if (url.includes(pagename) == false) {
        window.open(item.href)
    }
    else {
        console.log(item.href)
    }
}