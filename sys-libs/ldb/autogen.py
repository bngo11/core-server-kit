#!/usr/bin/env python3

from bs4 import BeautifulSoup

async def generate(hub, **pkginfo):
	base_url = "https://download.samba.org/pub/ldb"
	html_data = await hub.pkgtools.fetch.get_page(base_url)
	soup = BeautifulSoup(html_data, "html.parser")
	links = soup.find_all("a")
	links.reverse()
	version = None

	for link in links:
		href = link.get("href")
		if href.endswith('tar.gz'):
			version = href.split('-')[-1].rsplit('.', 2)[0]

			try:
				list(map(int, version.split(".")))
				break

			except ValueError:
				continue

	if version:
		final_name = f"ldb-{version}.tar.gz"
		url = f"{base_url}/ldb-{version}.tar.gz"
		ebuild = hub.pkgtools.ebuild.BreezyBuild(
			**pkginfo,
			version=version,
			artifacts=[hub.pkgtools.ebuild.Artifact(url=url, final_name=final_name)],
		)

		ebuild.push()


# vim: ts=4 sw=4 noet
