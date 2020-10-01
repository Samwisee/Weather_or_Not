import places from 'places.js';

const initAutocomplete = () => {
  const cityNameInput = document.getElementById('user_city_name');
  useDeviceLocation: true;
  if (cityNameInput) {
    places({ container: cityNameInput });
  }
};

export { initAutocomplete };


