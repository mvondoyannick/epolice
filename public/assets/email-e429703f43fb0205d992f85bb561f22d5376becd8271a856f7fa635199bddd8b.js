$(document).ready(function() {
    window.inbox = {};
    window.paginate = {
        total: Math.random() * (54236 - 100) + 3
    }
    for (var i = 0; i <= 10; i++) {
        window.inbox[i] = {
            from: faker.name.findName(),
            timestamp: null,
            subject: faker.lorem.sentence().substring(0, 40),
            snippet: faker.lorem.lines(),
            fullMail: window.faker.lorem.paragraphs(faker.random.number(40)),
            email: faker.internet.email()
        };
    }
    var inboxVue = new Vue({
        el: '#mail-app',
        data: {
            messages: window.inbox,
            paginate: {
                pointer: {
                    start: 1,
                    end: 10
                },
                total: 100
            }
        },
        methods: {
            showMessage: function(msg, index) {
                $('#message-pane').removeClass('is-hidden');
                $('.card').removeClass('active');
                $('#msg-card-' + index).addClass('active');
                $('.message .address .name').text(msg.from);
                $('.message .address .email').text(msg.email);
                var msg_body = '<p>' +
                    msg.snippet +
                    '</p>' +
                    '<br>' +
                    '<p>' +
                    msg.fullMail +
                    '</p>';
                $('.message .content').html(msg_body);
            }
        }
    });
});
