# What this folder is for

This is the home for your tests.

`test_cases` : define the test cases here
`steps` : define the various steps in the tests here, e.g. `when`, `init`, `tearDown`, etc.

You can share the same test cases between integration (running code locally, but talking to real downstream) and acceptance (invoking code remotely via its HTTP interface and testing the system end-to-end).

For more details, see [this post](https://hackernoon.com/yubls-road-to-serverless-part-2-testing-and-ci-cd-72b2e583fe64).