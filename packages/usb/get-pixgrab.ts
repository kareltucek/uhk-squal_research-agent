#!/usr/bin/env ../../node_modules/.bin/ts-node-script

import Uhk, { errorHandler, yargs } from './src';

(async function () {
    try {
        const argv = yargs
            .usage('Grab pixel matrix from the trackball module.')
            .argv;

        const { operations } = Uhk(argv);
        const data = await operations.getPixgrab();

        console.log(`data: ${data}`);
    } catch (error) {
        errorHandler(error);
    }
})();
