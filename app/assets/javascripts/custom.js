function star_rating() {
  $('#star-rating').raty({
    path: '/assets/',
    scoreName: 'review[rate]',
  });
};

star_rating();
