final charactersQuery = """query Characters {
    characters(page: 2, filter: { name: "Morty" }) {
        info {
            count
            pages
            next
            prev
        }
        results {
            id
            name
            status
            species
            type
            gender
            image
            created
        }
    }
} """
;
