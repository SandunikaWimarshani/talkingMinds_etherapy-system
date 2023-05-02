import React from "react";

const Head = (props) => {
    document.title = 'talkingMinds - ' + props.title
    return (
        <div className="w-100"> {props.children}</div>
    )
}

export default Head;