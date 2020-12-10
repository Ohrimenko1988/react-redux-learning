import React from 'react';

export interface ButtonProps {
    class: string;
    text: string;
    onClickHandler: any
}

const Button = (prop: ButtonProps): any => {
    return (
    <button className={prop.class} onClick={prop.onClickHandler}>{prop.text}</button>
    );
}

export default Button;