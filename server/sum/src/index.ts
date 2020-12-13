import express from "express";
import { ProjectConstants } from "./ProjectConstants";
const app = express();
const port = ProjectConstants.PROJECT_PORT;

app.get("/", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin", "*");
    res.setHeader("Content-Type", "application/json");

    const firstNumber: number = Number.parseFloat(req.query.FIRST_NUMBER);
    const secondNumber: number = Number.parseFloat(req.query.SECOND_NUMBER);
    const result: number = firstNumber + secondNumber;

    res.send(`${result}`);
});

app.get("/health", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin", "*");
    res.setHeader("Content-Type", "application/json");

    res.send(`It is up and run`);
});

// start the Express server
app.listen(port, async () => {
    // tslint:disable-next-line:no-console
    console.log(`server started at http://localhost:${port}`);

});
