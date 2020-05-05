document.addEventListener("turbolinks:load", () => {

    const messages = document.querySelectorAll('.message');

    const isDesktop = !(/Mobi|Android/i.test(navigator.userAgent));

    const openMessage = (message, index) => {
        const openAt = (index + 1) * 400;
        const closeAt = openAt + 20000;

        setInterval(() => {
            message.classList.add('message--open');
        }, openAt);

        setTimeout(() => {
            message.classList.remove('message--open');
            message.classList.add('message--close');
        }, closeAt);

        if (index > 0 && isDesktop) {
            message.style.marginBottom = `${(100 * (index + 1))}px`;
        }
    };

    const closeMessage = (message) => {
        message.classList.remove('message--open');
        message.classList.add('message--close');
    };

    messages.forEach((message, index) => {
        button = message.querySelector('.message__button');
        button.addEventListener('click', () => {
            closeMessage(message);
        });

        openMessage(message, index);
    });
});
