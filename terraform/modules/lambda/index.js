exports.handler = async (event) => {
    console.log("Event Received:", JSON.stringify(event, null, 2));

    const response = {
        statusCode: 200,
        body: JSON.stringify({ message: "Order processed successfully!" }),
    };

    return response;
};
