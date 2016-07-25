/**
 * Blocmetrics client side javascript
 * For blocmetrics event tracking.
 */
var blocmetrics = {};

blocmetrics.report = function(eventName)
{
	var event = {event: {name: eventName}};

	var request = new XMLHttpRequest();

	request.open("POST", "https://bk-blocmetrics.herokuapp.com/api/events", true);

	request.setRequestHeader('Content-Type', 'application/json');

	request.send(JSON.stringify(event));
};