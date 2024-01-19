fetch("https://hapi-books.p.rapidapi.com/nominees/romance/2020", {
  headers: {
    "X-RapidAPI-Key": "cd85aa3c71msh251bd5d2a3d5b83p17338bjsncc92565ee6b5",
    "X-RapidAPI-Host": "hapi-books.p.rapidapi.com",
  },
})
  .then((response) => {
    return response.text();
  })
  .then((data) => {
    console.log(data);
  })
  .catch((err) => {
    console.log(err);
  });
