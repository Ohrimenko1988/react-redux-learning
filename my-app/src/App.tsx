import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import axios from 'axios'
import Message from './Message';
import Button from './elements/buttons/Button';
import Screen from './elements/screens/Screen';
import { ProjectConstants } from './ProjectConstants';


export enum MathAction {
  SUM = '+',
  DIV = '/',
  MUL = '*',
  SUB = '-'
}

export enum RequestRoute {
  SUM = '+',
  DIV = '/',
  MUL = '*',
  SUB = '-'
}

const initState = {
  inputText: '0',
  resultText: '0',
  mathAction: '',
  firstNumber: 0,
  secondNumber: 0,
  resultNumber: 0
}

type State = Readonly<typeof initState>;

class App extends Component<any, State> {
  constructor(props: any) {
    super(props);

    this.state = initState;

    this.onClickNumberActionsHandler = this.onClickNumberActionsHandler.bind(this);
    this.onClickActionHandler = this.onClickActionHandler.bind(this);
    this.onRejectHandler = this.onRejectHandler.bind(this);
    this.onSubmitHandler = this.onSubmitHandler.bind(this);


  }

  readonly state: State = initState;

  async onClickNumberActionsHandler(digit: string) {
    if (this.state.inputText === '0' && digit === '.') {
      this.setState({
        inputText: this.state.inputText + digit
      })

      return;
    }

    if (this.state.inputText === '0') {
      this.setState({
        inputText: digit
      })

      return;
    }

    this.setState({
      inputText: this.state.inputText + digit
    })
  }

  async onClickActionHandler(mathAction: MathAction) {
    let inputNumber: number = parseFloat(this.state.inputText);

    if (this.state.mathAction === '' && this.state.resultText !== '0'){
      this.setState({
        resultText: this.state.resultText + ` ${mathAction}`,
        mathAction: mathAction
      });

      return;
    }


    if (this.state.mathAction === '') {
      this.setState({
        resultText: this.state.inputText + ` ${mathAction}`,
        firstNumber: inputNumber,
        inputText: '0',
        mathAction: mathAction
      })

      return;
    }

    this.calculateResult(this.state.firstNumber, inputNumber, this.state.mathAction)
      .then((result) => {
        this.setState({
          resultText: `${result} ${mathAction}`,
          inputText: '0',
          firstNumber: parseFloat(result),
          mathAction: mathAction
        })

      });




  }

  async onRejectHandler() {
    this.setState(initState)
  }

  async onSubmitHandler() {
    const secondNumber: number = parseFloat(this.state.inputText);

    this.calculateResult(this.state.firstNumber, secondNumber, this.state.mathAction)
      .then((result) => {
        this.setState({
          resultText: result,
          inputText: '0',
          firstNumber: parseFloat(result),
          mathAction: ''
        });
      });


  }

  private async sendRequest(url: string, headerOpt: any): Promise<string> {
    return axios.get(url, headerOpt).then((resp): string => {
      return resp.data
    })
  }

  private async calculateResult(firstNumber: number, secondNumber: number, mathAction: string): Promise<string> {
    let requestParams = {
      params: {
        FIRST_NUMBER: firstNumber,
        SECOND_NUMBER: secondNumber
      }
    }


    if (mathAction === MathAction.DIV) {

      return this.sendRequest(ProjectConstants.DIV_REQUEST_URL, requestParams);
    }

    if (mathAction === MathAction.MUL) {

      return this.sendRequest(ProjectConstants.MUL_REQUEST_URL, requestParams);
    }

    if (mathAction === MathAction.SUB) {

      return this.sendRequest(ProjectConstants.SUB_REQUEST_URL, requestParams);
    }

    if (mathAction === MathAction.SUM) {

      return this.sendRequest(ProjectConstants.SUM_REQUEST_URL, requestParams);
    }

    throw new Error('Unexpected error in the \'calculateResult\' method');

  }




  render() {
    return (
      <div className="App">
        <div className="Body">
          <div className="Screens">
            <Screen class="ResultScreen" text={this.state.resultText} />
            <Screen class="InputScreen" text={this.state.inputText} />
          </div>
          <div className="Buttons">
            <Button class="RejectButton button" text="Reject" onClickHandler={this.onRejectHandler}></Button>

            <div className="buttonsLayer">
              <Button class="numberButton button" text="7" onClickHandler={() => { this.onClickNumberActionsHandler('7') }} />
              <Button class="numberButton button" text="8" onClickHandler={() => { this.onClickNumberActionsHandler('8') }} />
              <Button class="numberButton button" text="9" onClickHandler={() => { this.onClickNumberActionsHandler('9') }} />
              <Button class="numberButton button" text="+" onClickHandler={() => { this.onClickActionHandler(MathAction.SUM) }} />
            </div>

            <div className="buttonsLayer">
              <Button class="numberButton button" text="4" onClickHandler={() => { this.onClickNumberActionsHandler('4') }} />
              <Button class="numberButton button" text="5" onClickHandler={() => { this.onClickNumberActionsHandler('5') }} />
              <Button class="numberButton button" text="6" onClickHandler={() => { this.onClickNumberActionsHandler('6') }} />
              <Button class="numberButton button" text="-" onClickHandler={() => { this.onClickActionHandler(MathAction.SUB) }} />
            </div>
            <div className="buttonsLayer">
              <Button class="numberButton button" text="1" onClickHandler={() => { this.onClickNumberActionsHandler('1') }} />
              <Button class="numberButton button" text="2" onClickHandler={() => { this.onClickNumberActionsHandler('2') }} />
              <Button class="numberButton button" text="3" onClickHandler={() => { this.onClickNumberActionsHandler('3') }} />
              <Button class="numberButton button" text="*" onClickHandler={() => { this.onClickActionHandler(MathAction.MUL) }} />
            </div>
            <div className="buttonsLayer">
              <Button class="numberButton button" text="0" onClickHandler={() => { this.onClickNumberActionsHandler('0') }} />
              <Button class="numberButton button" text="." onClickHandler={() => { this.onClickNumberActionsHandler('.') }} />
              <Button class="numberButton button" text="=" onClickHandler={this.onSubmitHandler} />
              <Button class="numberButton button" text="/" onClickHandler={() => { this.onClickActionHandler(MathAction.DIV) }} />
            </div>
          </div>
        </div>

      </div>
    );
  }

}

export default App;
