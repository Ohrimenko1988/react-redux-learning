import React from 'react';

export interface ScreenProps {
    class: string;
    text: string;
}

const Screen = (prop: ScreenProps): any => {
    return (
    <div className={prop.class}>{prop.text}</div>
    );
}

export default Screen;