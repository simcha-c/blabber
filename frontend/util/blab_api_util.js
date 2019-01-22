export const fetchBlabsAjax = () => {
    return $.ajax({
        method: "GET",
        url: 'api/blabs'
    });
}

export const createBlabAjax = (blab) => {
    return $.ajax({
        method: "POST",
        url: "/api/blabs",
        data: { blab }
    });
};

export const fetchBlabAjax = id => {
    return $.ajax({
        method: 'GET',
        url: `/api/blabs/${id}`,
    });
};