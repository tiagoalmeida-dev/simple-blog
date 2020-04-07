document.addEventListener("turbolinks:load", () => {
  const coffpad = document.querySelector("#coffpad")
  const coffpadButtons = document.querySelector("#coffpad-buttons")

  const actions = {
    "h1": () => { insertOnSelectedText("# ", "") },
    "h2": () => { insertOnSelectedText("## ", "") },
    "h3": () => { insertOnSelectedText("### ", "") },
    "b": () => { insertOnSelectedText("**", "**") },
    "i": () => { insertOnSelectedText("*", "*") },
    "u": () => { insertOnSelectedText("~~", "~~") },
  }

  const createActionButtonsSchema = (actions) => {
    return Object.keys(actions).map(action => {
      return {
        "tag": "button",
        "id": action,
        "text": action,
        "event": "click",
        "action": actions[action]
      }
    })
  }

  const createHTMLTagsBySchema = ({ tag, text, event, action }) => {
    const component = document.createElement(tag)
    component.innerHTML = text
      component.addEventListener(event, (e) => {
          e.preventDefault()
          action()
      })
    return component
  }

  const appendHTMLAction = () => {
    createActionButtonsSchema(actions).forEach((schema) => {
      coffpadButtons.appendChild(createHTMLTagsBySchema(schema))
    })
  }

  const registerShotcuts = () => {
    document.addEventListener("keypress", (e) => {
      if ((e.ctrlKey || e.metaKey) && e.key in actions) {
        actions[e.key]()
      }
    })
  }

  const insertOnSelectedText = (startChar, endChar) => {
    coffpad.focus()
    const start = coffpad.selectionStart
    const end = coffpad.selectionEnd
    const allTextSelected = coffpad.value.substring(start, end);
    const updatedText = coffpad.value.substring(0, start) + startChar + allTextSelected + endChar + coffpad.value.substring(end);
    coffpad.value = updatedText;
  }

  registerShotcuts()
  appendHTMLAction()
});

