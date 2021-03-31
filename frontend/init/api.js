import axios from "axios";

let token = document.querySelector('[name=csrf-token]');
if (token) {
  token = token.content
};
axios.defaults.headers.common['X-CSRF-TOKEN'] = token;

export default axios.create({
  baseURL: "/api/v1/",
  responseType: "json",
  timeout: 1000 * 5
});
