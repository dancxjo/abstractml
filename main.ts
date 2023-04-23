// main.ts
import { parse } from 'https://deno.land/std/flags/mod.ts';
import { JSDOM } from './deps.ts';

const args = parse(Deno.args);

const artifactURL = args.url;
const xsltFilename = args.xslt;

async function fetchFile(url: string): Promise<string> {
  const data = await fetch(url);
  return await data.text();
}

async function main() {
  const [artifactData, xsltData] = await Promise.all([
    fetchFile(artifactURL),
    fetchFile(xsltFilename),
  ]);

  const artifactDom = new JSDOM(artifactData);
  const xsltDom = new JSDOM(xsltData, { contentType: 'application/xml' });

  const xsltProcessor = new artifactDom.window.XSLTProcessor();
  xsltProcessor.importStylesheet(xsltDom.window.document);

  const transformedOutput = xsltProcessor.transformToFragment(
    artifactDom.window.document,
    artifactDom.window.document
  );

  console.log(artifactDom.serialize(transformedOutput));
}

main();
