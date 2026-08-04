const auth = Buffer.from(`${process.env.CF_EMAIL}:${process.env.CF_TOKEN}`).toString("base64");
const res = await fetch(
    `https://${process.env.CF_SITE}.atlassian.net/wiki/rest/api/content/search?cql=contributor=currentUser()%20order%20by%20lastmodified%20desc&limit=10&expand=version`,
    { headers: { Authorization: `Basic ${auth}` } }
);
const { results } = await res.json();
const rows = results.map(p =>
    `- [${p.title}](https://${process.env.CF_SITE}.atlassian.net/wiki${p._links.webui}) — updated ${p.version.when.slice(0,10)}`
).join("\n");

const fs = require("fs");
let md = fs.readFileSync("README.md", "utf8");
md = md.replace(
    /<!-- CONFLUENCE:START -->[\s\S]*<!-- CONFLUENCE:END -->/,
    `<!-- CONFLUENCE:START -->\n${rows}\n<!-- CONFLUENCE:END -->`
);
fs.writeFileSync("README.md", md);