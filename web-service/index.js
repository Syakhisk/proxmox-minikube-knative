const express = require("express");
const app = express();

let handled = 0;

// Fibonacci function
function fibonacci(n) {
  if (n < 2) {
    return n;
  }
  return fibonacci(n - 1) + fibonacci(n - 2);
}

// Endpoint to generate Fibonacci sequence
app.get("/", (req, res) => {
  const n = parseInt(30);
  const result = fibonacci(n);
  res.json({ result });
  console.log("Req handled: ", ++handled);
});

app.get("/:n", (req, res) => {
  const n = parseInt(req.params.n);
  const result = fibonacci(n);
  res.json({ result });
  console.log("Req handled: ", ++handled);
});

// Start server
const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`App listening on port ${PORT}!`);
});
