## 👋 Hi there

<!--
**mikemayori/mikemayori** is a ✨ _special_ ✨ repository because its `README.md` (this file) appears on your GitHub profile.

Here are some ideas to get you started:

- 🔭 I’m currently working on ...
- 🌱 I’m currently learning ...
- 👯 I’m looking to collaborate on ...
- 🤔 I’m looking for help with ...
- 💬 Ask me about ...
- 😄 Pronouns: ...
- ⚡ Fun fact: ...
-->

![GitHub last commit](https://img.shields.io/github/last-commit/mikemayori/mikemayori?label=updated)
![GitHub followers](https://img.shields.io/github/followers/mikemayori?label=GitHub%20followers)

My name is Mike and I'm a Senior Software Engineer

<!--
💬 Ask me about Amazon , Terraform , Software Architecture: how to get started and get productive in the cloud.
-->

#### 📖 My latest blog posts
{{- range rss "https://medium.com/@mayori.engineering/feed" 5 }}
- [{{ .Title }}]({{ .URL }}) ({{ humanize .PublishedAt }})
{{- end }}

#### 👷 I'm currently working on (aka my most recent contributions)
{{range recentContributions 10}}
- [{{.Repo.Name}}]({{.Repo.URL}}) - {{.Repo.Description}} ({{humanize .OccurredAt}})
{{- end}}

#### 🚀 My recent pull requests
{{range recentPullRequests 10}}
- [{{.Title}}]({{.URL}}) on [{{.Repo.Name}}]({{.Repo.URL}})
{{- end}}

#### 🏗️ My recent projects
{{range recentRepos 10}}
- [{{.Name}}]({{.URL}}) - {{.Description}}
{{- end}}

<!--
#### 🚀 Latest releases I contributed to
{{range recentReleases 5}}
- [{{.Name}}]({{.URL}}) ([{{.LastRelease.TagName}}]({{.LastRelease.URL}}), {{humanize .LastRelease.PublishedAt}}){{ with .Description }} - {{.}}{{ end }}
{{- end}}
-->

#### ⭐ Latest repositories I starred
{{range recentStars 5}}
- [{{.Repo.Name}}]({{.Repo.URL}}) - {{.Repo.Description}} - {{.Repo.Stargazers}} stars
{{- end}}

#### 👥 My latest followers
{{range followers 5}}
- [{{.Login}}]({{.URL}}) - {{.Name}}
{{- end}}

## Contribution graph
<img alt="github-snake" src="https://raw.githubusercontent.com/mikemayori/mikemayori/refs/heads/output/github-contribution-grid-snake.svg" />


## 🎓 Certificates & Trainings

<div align="center">

<!--START_SECTION:badges-->
<img src="https://img.shields.io/badge/Status-Loading_Badges-yellow?style=for-the-badge" />
<!--END_SECTION:badges-->

</div>

Find all [my badges on Credly.com](https://www.credly.com/users/miguel-mayori.7884526b).

