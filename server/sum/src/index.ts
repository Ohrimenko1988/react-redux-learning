import express from "express";
const app = express();
const port = 3434;

app.get("/", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin", "*");
    res.setHeader("Content-Type", "application/json");

    const firstNumber: number = Number.parseInt(req.query.FIRST_NUMBER, 10);
    const secondNumber: number = Number.parseInt(req.query.SECOND_NUMBER, 10);
    const result: number = firstNumber + secondNumber;

    res.send(`${result}`);
});

// start the Express server
app.listen(port, async () => {
    // tslint:disable-next-line:no-console
    console.log(`server started at http://localhost:${port}`);

});
