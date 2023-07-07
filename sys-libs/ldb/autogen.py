#!/usr/bin/env python3

import json

async def generate(hub, **pkginfo):
	json_data = await hub.pkgtools.fetch.get_page("https://gitlab.com/api/v4/projects/3456094/repository/tags?per_page=50", is_json=True)
	version = None

	for item in json_data:
		try:
			name = item['name']
			if name.startswith('ldb'):
				version = name.split('-')[-1]
				ver = version.split(".")
				list(map(int, ver))
				if int(ver[-1]) < 90:
					break

		except (IndexError, ValueError, KeyError):
			continue
	else:
		version = None

	if version:
		final_name = f"{name}.tar.gz"
		url = f"https://www.samba.org/ftp/ldb/{final_name}"
		ebuild = hub.pkgtools.ebuild.BreezyBuild(
			**pkginfo,
			version=version,
			artifacts=[hub.pkgtools.ebuild.Artifact(url=url, final_name=final_name)]
		)
		ebuild.push()
# vim: ts=4 sw=4 noet
