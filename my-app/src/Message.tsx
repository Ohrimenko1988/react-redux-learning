import React from 'react';

export interface UserMessage {
    name: string;
    message: string;
}

const Message = (prop: UserMessage): any => {
    return (
    <p>User: {prop.name}, message: {prop.message}</p>
    );
}

export default Message;
