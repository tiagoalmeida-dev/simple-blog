const config = [
    {
        button: "bold",
        command: (text) => `*${text}*`,
        keyCode: 16
    },
    {
        button: "italic",
        command: (text) => `**${text}**`,
        keyCode: 73
    },
    {
        button: "scratch",
        command: (text) => `~~${text}~~`,
        keyCode: 85
    },
    {
        button: "header-1",
        command: (text) => `## ${text}`,
    },
    {
        button: "ordered-list",
        command: (text) => {
            return text.match(/^(.*)$/gm)
                .map((line, index) => `${index + 1}. ${line}`)
                .join("\n");

        }
    },
    {
        button: "unordered-list",
        command: (text) => text.replace(/^(.*)$/gm, "- $1")
    }
];

document.addEventListener("turbolinks:load", () => {

    const editor = document.querySelector('.editor');

    const editorSelection = (editor) => {
        const start = editor.selectionStart;
        const end = editor.selectionEnd;
        return editor.value.substring(start, end);
    };

    const setTextInSelection = (editor, newText) => {
        const start = editor.selectionStart;
        const end = editor.selectionEnd;
        const currentText = editor.value;

        editor.value = currentText.substring(0, start) +
            newText + currentText.substring(end, currentText.length);
    };

    config.forEach((current) => {

        if(!current.button) return;

        const button = document.querySelector(`.${current.button}`);

        button.addEventListener('click', (event) => {
            event.preventDefault();
            const newText = current.command(editorSelection(editor));
            setTextInSelection(editor, newText);
        });
    });

    document.addEventListener('keydown', (event) => {
        config.forEach((current) => {
            if (event.ctrlKey && event.keyCode == current.keyCode) {
                const newText = current.command(editorSelection(editor));
                setTextInSelection(editor, newText);
            }
        });
    });

});
