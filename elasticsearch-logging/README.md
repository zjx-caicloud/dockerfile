## Introduction
与上游的镜像相比，加了add-template.sh脚本，来加载k8s-template-logstash.json。因为es从2.0开始，不支持文件加载template，只能以curl api的方式动态加载。
然而add-template.sh比较hacky，会在容器刚启动时动态加载template-k8s-logstash.json。推荐使用旧的1.5.2镜像。


## 常用es查询api
查询所有日期的日志：
```
curl -XPOST 'localhost:9200/logstash-*/_search?pretty' -d '
{
  "query": { "match_all": {} }
}'
```
查询 2017/06/30 这一天的所有日志：
```
curl -XPOST 'localhost:9200/logstash-2017.06.30/_search?pretty' -d '
{
  "query": { "match_all": {} }
}'
```

查询namespace为default，pod名前缀为`kubernetes-admin-`的日志。
```
curl -XPOST 'localhost:9200/logstash-*/_search?pretty' -d '
{

  "query": {
      "bool": {
        "should": [],
        "must_not": [],
        "must": [
          {
            "match": {
              "kubernetes.namespace_name": "default"
            }
          },
          {
            "wildcard": {
              "kubernetes.pod_name": "kubernetes-admin-*"
            }
          }
        ]
      }
    }
}'
```

查询namespace为default，pod名为`zk-1-1863230234-drw69`，时间间隔在`2016-06-22T10:00:00+08:00`到`2016-06-23T10:03:00+08:00` 的所有日志，并以`@timestamp` 升序排列。
```
curl -XPOST 'localhost:9200/logstash-*/_search?pretty' -d '
{
  "query": {
      "bool": {
        "should": [],
        "must_not": [],
        "must": [
          {
            "match": {
              "kubernetes.namespace_name": "default"
            }
          },
          {
            "match": {
              "kubernetes.pod_name": "zk-1-1863230234-drw69"
            }
          },
          {
            "range": {
              "@timestamp": {
                "gte": "2016-06-22T10:00:00+08:00",
                "lte": "2017-06-23T10:03:00+08:00"
              }
            }
          }
        ]
      }
    },
    "sort": [{
      "@timestamp": "asc"
      }
    ]
}'
```

查询caas分区下，pod名为`redis-logger-1655605986-l8qg3`， 包含关键字`cluster*`的日志，并且以`<logHighlight>`高亮标签包围关键字。
```
curl -XPOST 'localhost:9200/logstash-*/_search?pretty' -d '
{
  "query": {
    "bool": {
      "should": [],
      "must_not": [],
      "must": [
        {
          "match": {
            "kubernetes.namespace_name": "caas"
          }
        },
        {
          "query_string": {
            "query": "cluster*",
            "fields": [
              "log"
            ]
          }
        },
        {
          "match": {
            "kubernetes.pod_name": "redis-logger-1655605986-l8qg3"
          }
        }
      ]
    }
  },
  "sort": {
    "@timestamp": {
      "order": "desc"
    }
  },
  "highlight": {
    "pre_tags": [
      "<logHighlight>"
    ],
    "post_tags": [
      "</logHighlight>"
    ],
    "fields": {
      "log": {}
    }
  }
}'
```
