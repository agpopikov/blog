---
title: "Краткое вступление"
date: 2018-09-29T11:36:33+08:00
draft: false
featuredImg: ""
tags: 
  - intro
---

TODO!

{{< highlight html >}}
<section id="main">
  <div>
    <h1 id="title">{{ .Title }}</h1>
    {{ range .Pages }}
      {{ .Render "summary"}}
    {{ end }}
  </div>
</section>
{{< /highlight >}}
