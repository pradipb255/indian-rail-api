# Use an official Node.js runtime as a parent image (Alpine version)
FROM public.ecr.aws/lambda/nodejs:18

# Set the working directory in the container
WORKDIR ${LAMBDA_TASK_ROOT}

# Copy package.json and package-lock.json files
COPY package*.json ./

# Install the project dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
# EXPOSE 3000

# Command to run the application
# CMD ["node", "lambda.js"]
CMD ["lambda.handler"]