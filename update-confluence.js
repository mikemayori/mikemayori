import fs from "fs";

const site = process.env.CF_SITE.replace(/^https?:\/\//, "").replace(/\/+$/, "");
const auth = Buffer.from(`${process.env.CF_EMAIL}:${process.env.CF_TOKEN}`).toString("base64");

const url = new URL(`https://${site}/wiki/rest/api/content/search`);
url.searchParams.set("cql", "contributor=currentUser() order by lastmodified desc");
url.searchParams.set("limit", "50");
url.searchParams.set("expand", "version");

const res = await fetch(url, { headers: { Authorization: `Basic ${auth}` } });
if (!res.ok) {
    throw new Error(`Confluence API ${res.status}: ${await res.text()}`);
}
const { results, size } = await res.json();

// Counts-only, safe for a public profile:
const count = size ?? results.length;
const block = `📄 **${count}** Confluence pages contributed`;

// If you DO want titles/links instead, comment the two lines above and use:
// const block = results.map(p =>
//   `- [${p.title}](https://${site}/wiki${p._links.webui}) — ${p.version.when.slice(0,10)}`
// ).join("\n");

let md = fs.readFileSync("templates/README.md.tpl", "utf8");
md = md.replace(
    /<!-- CONFLUENCE:START -->[\s\S]*<!-- CONFLUENCE:END -->/,
    `<!-- CONFLUENCE:START -->\n${block}\n<!-- CONFLUENCE:END -->`
);
fs.writeFileSync("templates/README.md.tpl", md);
console.log("Updated README:", block);