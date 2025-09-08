// Publications renderer using embedded data with new style
class PublicationsRenderer {
    constructor() {
        this.publications = publicationsData;
        this.sortPublications();
    }

    sortPublications() {
        // Sort by year (descending) and then by number
        this.publications.sort((a, b) => {
            if (a.year !== b.year) {
                return parseInt(b.year) - parseInt(a.year);
            }
            return a.number.localeCompare(b.number);
        });
    }

    formatAuthor(authorString) {
        if (!authorString) return '';
        
        // Split by 'and' and clean up
        const authors = authorString.split(/\s+and\s+/).map(author => {
            author = author.trim();
            // Highlight Omkar Kabde
            if (author.includes('Omkar Kabde')) {
                return `<span class="thisauthor">${author}</span>`;
            }
            return author;
        });
        
        return authors.join(', ');
    }

    generateLinks(publication) {
        const links = [];
        if (publication.url) {
            links.push(`<a href="${publication.url}" target="_blank" class="btn btn-outline-primary me-2"><i class="fas fa-file-pdf me-2"></i> Paper</a>`);
        }
        if (publication.code) {
            links.push(`<a href="${publication.code}" target="_blank" class="btn btn-outline-dark me-2"><i class="fab fa-github me-2"></i> Code</a>`);
        }
        return links.join(' ');
    }

    generateHTML(publication) {
        const image = publication.image ? `<img src="${publication.image}" class="publication-image" alt="Publication image">` : '';
        const author = this.formatAuthor(publication.author);
        const links = this.generateLinks(publication);
        
        return `
            <article class="publication-item">
                <div class="publication-image-container">
                    ${image}
                </div>
                <div class="publication-content">
                    <div class="publication-links">
                        ${links}
                    </div>
                    <h4 class="publication-title">${publication.title}</h4>
                    <p class="publication-authors">${author}</p>
                    <p class="publication-venue"><strong>${publication.venue}</strong></p>
                </div>
            </article>
        `;
    }

    renderPublications(containerId) {
        const container = document.getElementById(containerId);
        
        if (!container) {
            console.error(`Container with id '${containerId}' not found`);
            return;
        }
        
        if (this.publications.length === 0) {
            container.innerHTML = '<div class="text-center text-muted">No publications found.</div>';
            return;
        }
        
        let html = '';
        this.publications.forEach((pub, index) => {
            html += this.generateHTML(pub);
        });
        
        container.innerHTML = html;
    }
}

// Initialize and render publications when page loads
document.addEventListener('DOMContentLoaded', function() {
    const renderer = new PublicationsRenderer();
    renderer.renderPublications('publications-container');
});
