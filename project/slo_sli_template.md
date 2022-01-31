# API Service

| Category     | SLI | SLO                                                                                                         |
|--------------|-----|-------------------------------------------------------------------------------------------------------------|
| Availability |  total number of successful requests / total number of requests   | 99%                                                                                                         |
| Latency      |  buckets of requests in a histogram showing the 90th percentile below 100ms over the last 30 seconds   | 90% of requests below 100ms                                                                                 |
| Error Budget |  80% of requests are successful  | Error budget is defined at 20%. This means that 20% of the requests can fail and still be within the budget |
| Throughput   |  sustained RPS rate of 5 total number of successful requests over 5 minutes  | 5 RPS indicates the application is functioning                                                              |
