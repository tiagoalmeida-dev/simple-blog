import heading from "h.svg";
import bold from "b.svg";
import italic from "i.svg";
import underline from "u.svg";

document.addEventListener("turbolinks:load", () => {
    const coffpad = document.querySelector("#coffpad");
    const coffpadButtons = document.querySelector("#coffpad-buttons");

    const actions = {
        "h": {
            "id": "heading",
            "icon": heading,
            "action": () => { insertOnSelectedText("## ", ""); }
        },
        "b": {
            "id": "bold",
            "icon": bold,
            "action": () => { insertOnSelectedText("** ", "**"); }
        },
        "i": {
            "id": "italic",
            "icon": italic,
            "action": () => { insertOnSelectedText("* ", "*"); }
        },
        "u": {
            "id": "underline",
            "icon": underline,
            "action": () => { insertOnSelectedText("~~ ", "~~"); }
        },
    };

    const createIconBySchema = (schema) => {
        const icon = document.createElement("img");
        icon.src = schema.icon;
        icon.style.height = "20px";
        icon.style.width = "20px";
        return icon;
    };

    const createButtonBySchema = (schema) => {
        const { id, action } = schema;
        const button = document.createElement("button");
        button.id = id;
        button.appendChild(createIconBySchema(schema));
        button.addEventListener("click", (e) => {
            e.preventDefault();
            action();
        });
        return button;
    };

    const insertOnSelectedText = (startChar, endChar) => {
        coffpad.focus();
        const start = coffpad.selectionStart;
        const end = coffpad.selectionEnd;
        const allTextSelected = coffpad.value.substring(start, end);
        const updatedText = coffpad.value.substring(0, start) + startChar + allTextSelected + endChar + coffpad.value.substring(end);
        coffpad.value = updatedText;
    };

    Object.keys(actions).forEach((key) => {
        coffpadButtons.appendChild(createButtonBySchema(actions[key]));
    });

    document.addEventListener("keypress", (e) => {
        if ((e.ctrlKey || e.metaKey) && e.key in actions) {
            actions[e.key].action();
        }
    });

});

